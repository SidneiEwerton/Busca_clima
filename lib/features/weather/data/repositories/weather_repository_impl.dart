

// import 'package:busca_clima2/core/network/connectivity_service.dart';
// import 'package:busca_clima2/core/errors/failure.dart';
// import 'package:busca_clima2/features/weather/data/dto/weather_dto.dart';
// import 'package:busca_clima2/features/weather/data/repositories/weather_repository.dart';
// import 'package:busca_clima2/features/weather/domain/models/weather_model.dart';
// import 'package:dio/dio.dart';

// class WeatherRepositoryImpl implements WeatherRepository {
//   final Dio _dio;
//   final ConnectivityService _connectivityService;

//   WeatherRepositoryImpl(this._dio, {ConnectivityService? connectivityService})
//     : _connectivityService = connectivityService ?? ConnectivityService();

//   @override
//   Future<WeatherModel> fetchWeather(String city) async {
//     final isConnected = await _connectivityService.hasConnection();
//     if (!isConnected) {
//       throw const NetworkFailure();
//     }

//     try {
//       final response = await _dio.get(
//         'weather',
//         queryParameters: {'q': city, 'units': 'metric', 'lang': 'pt_br'},
//       );
//       final dto = WeatherDto.fromJson(response.data);

//       // final String countryName = Locale('pt', dto.sys.country).displayCountry;

//       final String countryName =  dto.sys.country;

      

//       if (dto.weather.isEmpty) {
//         throw const CityNotFoundException();
//       }

//       @override
//       Future<WeatherModel> fetchWeatherByCoords(double lat, double lon) async{
//         try {
//           final response = await _dio.get(
//             'weather',
//             queryParameters: {
//               'lat': lat,
//               'lon': lon,
//               'units': 'metric',
//               'lang': 'pt_br',
//             },
//           );
//           final dto = WeatherDto.fromJson(response.data);

          
//         }
//       }
      
//       return WeatherModel(
//         cityName: dto.name,
//         temperature: dto.main.temp,
        
//         description: dto.weather.first.description,
//         iconUrl:
//             'https://openweathermap.org/img/wn/${dto.weather.first.icon}@2x.png',
//         countryCode: countryName,
//         humidity: dto.main.humidity,
//         windSpeed: dto.wind.speed,
//         uvIndex:  dto.uvIndex,
//         dateTime: DateTime.fromMillisecondsSinceEpoch(dto.dt * 1000)
//       );
//     } on DioException catch (e) {
//       if (e.type == DioExceptionType.connectionTimeout ||
//           e.type == DioExceptionType.receiveTimeout ||
//           e.type == DioExceptionType.sendTimeout) {
//         throw const TimeoutFailure();
//       }

//       final statusCode = e.response?.statusCode;

//       if (statusCode == 404) throw const CityNotFoundException();
//       if (statusCode == 401) throw const ApiKeyInvalidFailure();

//       throw const ServerFailure();
//     }
//   }
// }

import 'package:busca_clima2/core/network/connectivity_service.dart';
import 'package:busca_clima2/core/errors/failure.dart';
import 'package:busca_clima2/features/weather/data/dto/weather_dto.dart';
import 'package:busca_clima2/features/weather/data/repositories/weather_repository.dart';
import 'package:busca_clima2/features/weather/domain/models/weather_model.dart';
import 'package:dio/dio.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final Dio _dio;
  final ConnectivityService _connectivityService;

  WeatherRepositoryImpl(this._dio, {ConnectivityService? connectivityService})
      : _connectivityService = connectivityService ?? ConnectivityService();

  @override
  Future<WeatherModel> fetchWeather(String city) async {
    await _checkConnection();
    try {
      final response = await _dio.get(
        'weather',
        queryParameters: {'q': city, 'units': 'metric', 'lang': 'pt_br'},
      );
      return _mapDtoToModel(WeatherDto.fromJson(response.data));
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  @override
  Future<WeatherModel> fetchWeatherByCoords(double lat, double lon) async {
    await _checkConnection();
    try {
      final response = await _dio.get(
        'weather',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'units': 'metric',
          'lang': 'pt_br',
        },
      );
      return _mapDtoToModel(WeatherDto.fromJson(response.data));
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  WeatherModel _mapDtoToModel(WeatherDto dto) {
    if (dto.weather.isEmpty) throw const CityNotFoundException();

    return WeatherModel(
      cityName: dto.name,
      temperature: dto.main.temp,
      description: dto.weather.first.description,
      iconUrl: 'https://openweathermap.org/img/wn/${dto.weather.first.icon}@2x.png',
      countryCode: dto.sys.country,
      humidity: dto.main.humidity,
      windSpeed: dto.wind.speed,
      uvIndex: dto.uvIndex ?? 0.0, // Proteção contra nulo
      dateTime: DateTime.fromMillisecondsSinceEpoch(dto.dt * 1000),
    );
  }

  Future<void> _checkConnection() async {
    final isConnected = await _connectivityService.hasConnection();
    if (!isConnected) throw const NetworkFailure();
  }

  void _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      throw const TimeoutFailure();
    }
    final statusCode = e.response?.statusCode;
    if (statusCode == 404) throw const CityNotFoundException();
    if (statusCode == 401) throw const ApiKeyInvalidFailure();
    throw const ServerFailure();
  }
}
