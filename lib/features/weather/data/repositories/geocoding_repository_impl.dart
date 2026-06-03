import 'package:busca_clima2/core/errors/failure.dart';
import 'package:busca_clima2/features/weather/data/dto/geocoding_dto.dart';
import 'package:busca_clima2/features/weather/data/repositories/geocoding_repository.dart';
import 'package:busca_clima2/features/weather/domain/models/geocoding_model.dart';
import 'package:busca_clima2/core/network/dio_client.dart'; 
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'geocoding_repository_impl.g.dart'; 

@riverpod
GeocodingRepository geocodingRepository(Ref ref) {
  final dio = ref.watch(dioProvider); 
  return GeocodingRepositoryImpl(dio);
}



class GeocodingRepositoryImpl implements GeocodingRepository {
  final Dio _dio;

  GeocodingRepositoryImpl(this._dio);
  @override
  Future<List<GeocodingModel>> fetchCityOptions(String cityName) async {
    try {
      final response = await _dio.get(
        'https://api.openweathermap.org/geo/1.0/direct', 
        queryParameters: {
          'q': cityName, 
          'limit': 5,
         
        },
      );

      final List data = response.data;
      return data.map((json) {
        final dto = GeocodingDto.fromJson(json);
        return GeocodingModel(
          country: dto.country,
          name: dto.name,
          state: dto.state,
          lat: dto.lat,
          lon: dto.lon,
        );
      }).toList();
    }
    
    on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw const TimeoutFailure();
      
    }
      if (e.response?.statusCode == 401) throw const ApiKeyInvalidFailure();
      throw const ServerFailure();
  }
}
}