

import 'package:busca_clima2/core/constants/app_strings.dart';
import 'package:busca_clima2/features/weather/domain/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NextDay extends StatelessWidget{
  final WeatherModel weather;

  const NextDay({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [ 
         const Text(
          AppStrings.forecastNextDays,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white70,
          ),
        ),
        

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
      
    ]));
  }

  /// FUNÇÃO AUXILIAR: Transforma o número do weekday em texto amigável
  String _formatarDiaSemana(DateTime date) {
    switch (date.weekday) {
      case DateTime.monday:
        return AppStrings.weekdayMon;
      case DateTime.tuesday:
        return AppStrings.weekdayTue;
      case DateTime.wednesday:
        return AppStrings.weekdayWed;
      case DateTime.thursday:
        return AppStrings.weekdayThu;
      case DateTime.friday:
        return AppStrings.weekdayFri;
      case DateTime.saturday:
        return AppStrings.weekdaySat;
      case DateTime.sunday:
        return AppStrings.weekdaySun;
      default:
        return '';
    }
  }
}

