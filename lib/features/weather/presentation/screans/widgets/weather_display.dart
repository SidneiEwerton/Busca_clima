import 'package:busca_clima2/core/constants/app_colors.dart';
import 'package:busca_clima2/features/weather/domain/models/weather_model.dart';
import 'package:flutter/material.dart';

class WeatherDisplay extends StatelessWidget {
  final WeatherModel weather;

  const WeatherDisplay({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${weather.cityName}, ${weather.countryCode}',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: AppColors.white90,
          ),
        ),
        const SizedBox(height: 8),

        SizedBox(height: 8),
        Image.network(
          weather.iconUrl,
          scale: 0.5,
          errorBuilder: (context, error, stackTrace) => const Icon(
            Icons.wb_sunny_outlined,
            size: 50,
            color: AppColors.accent,
          ),
        ),
        SizedBox(height: 8),

        // Text(
        //   DateFormat("EEEE, d 'de' MMMM", "pt_BR").format(weather.dateTime),
        //   style: const TextStyle(
        //     fontSize: 16,
        //     color: Colors.white70,
        //     fontWeight: FontWeight.w300,
        //   ),
        // ),
        Text(
          '${weather.temperature.round()}°C, ${weather.humidity} % Humidade',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontWeight: FontWeight.w100,
            color: AppColors.accent,
          ),
        ),
        SizedBox(height: 8),

        Text(
          '${weather.windSpeed} vento, ${weather.uvIndex ?? 0.0} raio UV',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontWeight: FontWeight.w100,
            color: AppColors.accent
          ),
        ),

        Text(
          weather.description.toUpperCase(),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            letterSpacing: 1.4,
            color: AppColors.white50,
          ),
        ),
      ],
    );
  }
}
