import 'package:busca_clima2/core/constants/app_colors.dart';
import 'package:busca_clima2/core/constants/app_strings.dart';
import 'package:busca_clima2/features/weather/domain/models/weather_model.dart';
import 'package:busca_clima2/features/weather/presentation/screans/widgets/displaydatahora.dart';
import 'package:flutter/material.dart';

class WeatherDisplay extends StatelessWidget {
  final WeatherModel weather;

  const WeatherDisplay({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize
          .min, // Garante que a coluna ocupe apenas o espaço necessário
      children: [
        // 1. Nome da Cidade
        Text(
          '${weather.cityName}, ${weather.countryCode}',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: AppColors.white90,
          ),
        ),
        const SizedBox(height: 4),
        const DisplayDataHora(),

        // 2. Imagem do Clima
        SizedBox(
          height: 100,
          child: Image.network(
            weather.iconUrl,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => const Icon(
              Icons.wb_sunny_outlined,
              size: 50,
              color: AppColors.accent,
            ),
          ),
        ),
        const SizedBox(height: 4),

        // 3. Descrição
        Text(
          weather.description.toUpperCase(),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            letterSpacing: 1.4,
            fontSize: 14,
            color: AppColors.white90,
          ),
        ),
        const SizedBox(height: 12),

        // 4. Temperatura Principal
        Text(
          '${weather.temperature.round()}°C',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.w200,
            fontSize: 54,
            color: AppColors.accent,
          ),
        ),
        const SizedBox(height: 12),

        // 5. Grid de Informações Adicionais (Umidade, Sensação, Vento, UV)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Coluna da Esquerda
              Expanded(
                child: Column(
                  children: [
                    const Icon(
                      Icons.water_drop,
                      color: Colors.blueAccent,
                      size: 20,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${weather.humidity}${AppStrings.humidityUnit} ${AppStrings.humidity}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accent,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Icon(Icons.thermostat, color: Colors.blue, size: 20),
                    const SizedBox(height: 2),
                    Text(
                      '${weather.feelsLike!.round()}${AppStrings.celsius} ${AppStrings.feelsLike}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accent,
                      ),
                    ),
                  ],
                ),
              ),

              // Coluna da Direita
              Expanded(
                child: Column(
                  children: [
                    const Icon(Icons.air, color: Colors.white, size: 20),
                    const SizedBox(height: 2),
                    Text(
                      '${weather.windSpeed} ${AppStrings.windUnit} ${AppStrings.wind}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accent,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Icon(Icons.wb_sunny, color: Colors.yellow, size: 20),
                    const SizedBox(height: 2),
                    Text(
                      '${weather.uvIndex!.round()} ${AppStrings.uvIndex}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accent,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        
     
      ],
    );
  }
}
