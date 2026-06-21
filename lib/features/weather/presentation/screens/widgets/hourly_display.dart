import 'package:busca_clima2/core/constants/app_colors.dart';
import 'package:busca_clima2/features/weather/domain/models/weather_model.dart';
import 'package:flutter/material.dart';

class HourlyDisplay extends StatelessWidget {
  final WeatherModel weather;

  const HourlyDisplay({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weather.hourlyForecast.length,
        itemBuilder: (context, index) {
          final item = weather.hourlyForecast[index];

          return Container(
            width: 90,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${item.time.hour.toString().padLeft(2, '0')}:00',
                  style: const TextStyle(
                    color: AppColors.white90,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 8),
                Text(
                  '${item.temperature.round()} C',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.white90,
                  ),
                ),
                const SizedBox(height: 8),
                Image.network(
                  item.iconUrl,
                  width: 40,
                  height: 40,
                  errorBuilder: (context, error, stacTrace) =>
                      const Icon(Icons.wb_sunny, color: Colors.orange),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
