import 'package:busca_clima2/features/weather/data/repositories/weather_repository.dart';
import 'package:busca_clima2/features/weather/domain/models/weather_model.dart';


class FetchWeatherUseCase {
  final WeatherRepository _repository;

  FetchWeatherUseCase(this._repository);
  
  // o metodo call permite chamar o use case como uma função 
  Future<WeatherModel> call(String cityName) =>
      _repository.fetchWeather(cityName);
      
}

