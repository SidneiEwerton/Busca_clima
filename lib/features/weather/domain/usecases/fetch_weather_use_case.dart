<<<<<<< HEAD
import 'package:busca_clima2/features/weather/data/repositories/weather_repository.dart';
import 'package:busca_clima2/features/weather/domain/models/weather_model.dart';


class FetchWeatherUseCase {
  final WeatherRepository _repository;

  FetchWeatherUseCase(this._repository);
  
  // o metodo call permite chamar o use case como uma função 
  Future<WeatherModel> call(String cityName) =>
      _repository.fetchWeather(cityName);
      
}

=======
import 'package:busca_clima2/features/weather/data/repositories/weather_repository.dart';
import 'package:busca_clima2/features/weather/domain/models/weather_model.dart';


class FetchWeatherUseCase {
  final WeatherRepository _repository;

  FetchWeatherUseCase(this._repository);
  
  // o metodo call permite chamar o use case como uma função 
  Future<WeatherModel> call(String cityName) =>
      _repository.fetchWeather(cityName);
      
}

>>>>>>> 8f9e9b4ff38e1dba3a22217e58566c9b46c572be
