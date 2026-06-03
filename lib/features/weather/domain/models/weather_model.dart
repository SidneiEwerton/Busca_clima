<<<<<<< HEAD
import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_model.freezed.dart';


@freezed
abstract class WeatherModel with _$WeatherModel{
const  factory  WeatherModel ({
    required String cityName,
    required String countryCode, 
    required double temperature,
    required String description,
    required String iconUrl,
    required int humidity,    
    required double windSpeed, 
    required double? feelsLike,
    double? uvIndex, 
    required DateTime dateTime,   

  }) = _WeatherModel;
}

=======
import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_model.freezed.dart';


@freezed
abstract class WeatherModel with _$WeatherModel{
const  factory  WeatherModel ({
    required String cityName,
    required String countryCode, 
    required double temperature,
    required String description,
    required String iconUrl,
    required int humidity,    
    required double windSpeed, 
    required double? feelsLike,
    double? uvIndex, 
    required DateTime dateTime,   

  }) = _WeatherModel;
}

>>>>>>> 8f9e9b4ff38e1dba3a22217e58566c9b46c572be
