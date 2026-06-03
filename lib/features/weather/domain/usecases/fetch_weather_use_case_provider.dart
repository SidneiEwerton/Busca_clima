<<<<<<< HEAD
import 'package:busca_clima2/features/weather/data/repositories/weather_repository_provider.dart';
import 'package:busca_clima2/features/weather/domain/usecases/fetch_weather_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'fetch_weather_use_case_provider.g.dart';

@riverpod
FetchWeatherUseCase fetchWeatherUseCase(Ref ref){
  return FetchWeatherUseCase(ref.watch(weatherRepositoryProvider));

}


=======
import 'package:busca_clima2/features/weather/data/repositories/weather_repository_provider.dart';
import 'package:busca_clima2/features/weather/domain/usecases/fetch_weather_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'fetch_weather_use_case_provider.g.dart';

@riverpod
FetchWeatherUseCase fetchWeatherUseCase(Ref ref){
  return FetchWeatherUseCase(ref.watch(weatherRepositoryProvider));

}


>>>>>>> 8f9e9b4ff38e1dba3a22217e58566c9b46c572be
