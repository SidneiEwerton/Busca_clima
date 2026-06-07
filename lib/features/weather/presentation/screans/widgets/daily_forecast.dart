class DailyForecast {
  final DateTime date;
  final double temperature;
  final String description;
  final String iconUrl;

 const DailyForecast({
    required this.date,
    required this.temperature,
    required this.description,
    required this.iconUrl,
  });
}