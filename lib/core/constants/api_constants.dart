import 'package:busca_clima2/core/env/env.dart';

class ApiConstants {
  ApiConstants._();

  static String get apiKey => Env.apiKey;
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/';
  static const String geoBaseUrl = 'https://api.openweathermap.org/geo/1.0/';
  static const int geocodingLimit = 5;
}