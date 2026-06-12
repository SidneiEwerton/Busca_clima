import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_forecast.freezed.dart';

@freezed
abstract class DailyForecast with _$DailyForecast {
  const factory DailyForecast({
    required DateTime date,
    required double temperature,
    required String description,
    required String iconUrl,
  }) = _DailyForecast;
}
