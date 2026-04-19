
import 'package:busca_clima2/core/network/dio_client.dart';
import 'package:busca_clima2/features/weather/data/repositories/weather_repository.dart';
import 'package:busca_clima2/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_repository_provider.g.dart';


@riverpod
WeatherRepository weatherRepository(Ref ref){
  final dio = ref.watch(dioProvider);
  return WeatherRepositoryImpl(dio);
}

