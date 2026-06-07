import 'package:busca_clima2/core/constants/app_colors.dart';
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
                      '${weather.humidity}% Umidade',
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
                      '${weather.feelsLike!.round()}°C Sensação',
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
                      '${weather.windSpeed} m/s vento',
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
                      '${weather.uvIndex!.round()} UV',
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

        // --- MOVIDO: Agora a previsão dos dias fica na Column principal, ocupando toda a largura útil ---
        const SizedBox(height: 24),
        const Text(
          'PREVISÃO PARA OS PRÓXIMOS DIAS',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white70,
          ),
        ),
        const SizedBox(height: 12),

        // Listagem dinâmica usando o .map()
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: weather.dailyForecasts.map((day) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 100.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // A. Nome abreviado do dia da semana
                    SizedBox(
                      width: 50,
                      child: Text(
                        _formatarDiaSemana(day.date),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),

                    // B. Ícone do clima
                    Image.network(
                      day.iconUrl,
                      width: 30,
                      height: 30,
                      errorBuilder: (context, error, stackTrace) => const Icon(
                        Icons.wb_cloudy,
                        color: Colors.white54,
                        size: 20,
                      ),
                    ),

                    // C. Descrição do clima do dia
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(
                          day.description.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white60,
                            fontSize: 12,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),

                    // D. Temperatura prevista
                    Text(
                      '${day.temperature.round()}°C',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  /// FUNÇÃO AUXILIAR: Transforma o número do weekday em texto amigável
  String _formatarDiaSemana(DateTime date) {
    switch (date.weekday) {
      case DateTime.monday:
        return 'Seg';
      case DateTime.tuesday:
        return 'Ter';
      case DateTime.wednesday:
        return 'Qua';
      case DateTime.thursday:
        return 'Qui';
      case DateTime.friday:
        return 'Sex';
      case DateTime.saturday:
        return 'Sáb';
      case DateTime.sunday:
        return 'Dom';
      default:
        return '';
    }
  }
}
