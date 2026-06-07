
import 'package:busca_clima2/features/weather/presentation/screans/widgets/daily_forecast.dart';
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
    required List<DailyForecast> dailyForecasts,

  }) = _WeatherModel;
}

