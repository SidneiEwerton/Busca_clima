<<<<<<< HEAD
import 'package:busca_clima2/features/weather/domain/models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> fetchWeather(String city);
  Future<WeatherModel> fetchWeatherByCoords(double lat, double lon);
=======
import 'package:busca_clima2/features/weather/domain/models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> fetchWeather(String city);
  Future<WeatherModel> fetchWeatherByCoords(double lat, double lon);
>>>>>>> 8f9e9b4ff38e1dba3a22217e58566c9b46c572be
}