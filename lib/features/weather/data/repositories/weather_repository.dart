import 'package:busca_clima2/features/weather/domain/models/weather_model.dart';

abstract class WeatherRepository {
  Future<WeatherModel> fetchWeather(String city);
}