import 'package:busca_clima2/core/network/connectivity_service.dart';
import 'package:busca_clima2/core/errors/failure.dart';
import 'package:busca_clima2/features/weather/data/dto/weather_dto.dart';
import 'package:busca_clima2/features/weather/data/repositories/weather_repository.dart';
import 'package:busca_clima2/features/weather/domain/models/weather_model.dart';
import 'package:busca_clima2/features/weather/presentation/screans/widgets/daily_forecast.dart';
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
      // 1. Busca o clima atual
      final responseCurrent = await _dio.get(
        'weather',
        queryParameters: {'q': city, 'units': 'metric', 'lang': 'pt_br'},
      );

      // 2. Busca a previsão de 5/6 dias (40 itens de 3h em 3h)
      final responseForecast = await _dio.get(
        'forecast',
        queryParameters: {'q': city, 'units': 'metric', 'lang': 'pt_br'},
      );

      final currentDto = WeatherDto.fromJson(responseCurrent.data);
      
      // 3. Filtra a lista gigante da API para extrair os dias
      final List<dynamic> forecastListRaw = responseForecast.data['list'];
      final diasFiltrados = _filtrarPrevisaoDiaria(forecastListRaw);

      // 4. Junta tudo no modelo final
      return _mapDtoToModel(currentDto, diasFiltrados);
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  @override
  Future<WeatherModel> fetchWeatherByCoords(double lat, double lon) async {
    await _checkConnection();
    try {
      // 1. Busca o clima atual por coordenadas
      final responseCurrent = await _dio.get(
        'weather',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'units': 'metric',
          'lang': 'pt_br',
        },
      );

      // 2. Busca a previsão por coordenadas
      final responseForecast = await _dio.get(
        'forecast',
        queryParameters: {
          'lat': lat,
          'lon': lon,
          'units': 'metric',
          'lang': 'pt_br',
        },
      );

      final currentDto = WeatherDto.fromJson(responseCurrent.data);
      
      // 3. Filtra a lista gigante da API para extrair os dias
      final List<dynamic> forecastListRaw = responseForecast.data['list'];
      final diasFiltrados = _filtrarPrevisaoDiaria(forecastListRaw);

      // 4. Junta tudo no modelo final
      return _mapDtoToModel(currentDto, diasFiltrados);
    } on DioException catch (e) {
      _handleDioError(e);
      rethrow;
    }
  }

  /// FUNÇÃO AUXILIAR: Entra na lista de 40 itens da API e filtra pegando apenas
  /// o clima de meio-dia (12:00) de cada dia para representar a previsão diária.
  List<DailyForecast> _filtrarPrevisaoDiaria(List<dynamic> listaBruta) {
    List<DailyForecast> resultado = [];

    for (var item in listaBruta) {
      final DateTime dataHoraItem = DateTime.parse(item['dt_txt']);
      
      // Filtra para pegar apenas o horário das 12:00
      if (dataHoraItem.hour == 12) {
        resultado.add(
          DailyForecast(
            date: dataHoraItem,
            temperature: (item['main']['temp'] as num).toDouble(),
            description: item['weather'][0]['description'],
            iconUrl: 'https://openweathermap.org/img/wn/${item['weather'][0]['icon']}@2x.png',
          ),
        );
      }
    }
    return resultado;
  }

  /// Converte o DTO do clima atual e a lista de previsões no WeatherModel definitivo
  WeatherModel _mapDtoToModel(WeatherDto dto, List<DailyForecast> forecasts) {
    if (dto.weather.isEmpty) throw const CityNotFoundException();

    return WeatherModel(
      cityName: dto.name,
      temperature: dto.main.temp,
      description: dto.weather.first.description,
      iconUrl: 'https://openweathermap.org/img/wn/${dto.weather.first.icon}@2x.png',
      countryCode: dto.sys.country,
      humidity: dto.main.humidity,
      windSpeed: dto.wind.speed,
      feelsLike: dto.main.feelsLike,
      uvIndex: dto.uvIndex ?? 0.0,
      dateTime: DateTime.fromMillisecondsSinceEpoch(dto.dt * 1000),
      dailyForecasts: forecasts, // Passando a lista populada de verdade!
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