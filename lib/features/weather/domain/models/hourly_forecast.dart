class HourlyForecast {
  final DateTime time;
  final double temperature;
  final String iconUrl;

  HourlyForecast({
    required this.time,
    required this.temperature,
    required this.iconUrl,
  });
}
