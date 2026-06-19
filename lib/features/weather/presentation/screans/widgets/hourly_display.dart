import 'package:busca_clima2/core/constants/app_colors.dart';
import 'package:busca_clima2/features/weather/domain/models/weather_model.dart';
import 'package:flutter/material.dart';

class HourlyDisplay extends StatelessWidget {
  final WeatherModel weather;

  const HourlyDisplay({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final item = weather.hourlyForecast[index];
        return

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${weather.hourlyForecast}',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: AppColors.white90,
              ),
            ),
          ],
        );
      },
    );
  }
}
