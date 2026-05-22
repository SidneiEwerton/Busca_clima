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
    double? uvIndex, 
    required DateTime dateTime,   

  }) = _WeatherModel;
}

