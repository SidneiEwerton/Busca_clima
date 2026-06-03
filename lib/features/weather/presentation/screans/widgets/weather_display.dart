<<<<<<< HEAD
// import 'package:busca_clima2/core/constants/app_colors.dart';
// import 'package:busca_clima2/features/weather/domain/models/weather_model.dart';
// import 'package:busca_clima2/features/weather/presentation/screans/widgets/displaydatahora.dart';
// import 'package:flutter/material.dart';

// class WeatherDisplay extends StatelessWidget {
//   final WeatherModel weather;

//   const WeatherDisplay({super.key, required this.weather,});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           '${weather.cityName}, ${weather.countryCode}',
//           style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//             fontWeight: FontWeight.bold,
//             fontSize: 28,
//             color: AppColors.white90,
//           ),
//         ),
//         const SizedBox(height: 4),
//           DisplayDataHora(),

//         SizedBox(height: 100),
//         Image.network(
//           weather.iconUrl,
//           scale: 0.5,
//           errorBuilder: (context, error, stackTrace) => const Icon(
//             Icons.wb_sunny_outlined,
//             size: 50,
//             color: AppColors.accent,
//           ),
//         ),
//         SizedBox(height: 4),

//         Text(
//           weather.description.toUpperCase(),
//           style: Theme.of(context).textTheme.titleMedium?.copyWith(
//             letterSpacing: 1.4,
//             fontSize: 14,
//             color: AppColors.white90,
//           ),
//         ),
//         SizedBox(height: 20),

//         Column(
//           children: [
//             Text(
//               '${weather.temperature.round()}°C ',
//               style: Theme.of(context).textTheme.displayLarge?.copyWith(
//                 fontWeight: FontWeight.w200,
//                 fontSize: 54,
//                 color: AppColors.accent,
//               ),
//             ),
//             SizedBox(height: 4),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 16
//                 // vertical: 16.0,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Icon(Icons.water_drop, color: Colors.blueAccent),
//                       SizedBox(height: 8),
//                       Text(
//                         '${weather.humidity} % Humidade',
//                         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.accent,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Icon(Icons.thermostat, color: Colors.blue,),
//                       Text(
//                         '${weather.feelsLike} Sensação termica',
//                         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.accent,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Icon(Icons.air, color: Colors.white),
//                       SizedBox(height: 8),
//                       Text(
//                         '${weather.windSpeed} vento, ',
//                         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.accent,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Icon(Icons.wb_sunny, color: Colors.yellow),
//                       Text(
//                         '${weather.uvIndex} UV ',
//                         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.accent,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }


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
      mainAxisSize: MainAxisSize.min, // Garante que a coluna ocupe apenas o espaço necessário
      children: [
        // 1. Nome da Cidade (Reduzido ligeiramente de 32 para 28)
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

        // 2. Imagem do Clima (Reduzido o tamanho para não empurrar o resto para baixo)
        SizedBox(
          height: 100, // Limitamos a altura da imagem
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

        // 4. Temperatura Principal (Reduzido de displayLarge para displayMedium)
        Text(
          '${weather.temperature.round()}°C',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.w200,
            fontSize: 54, // Tamanho ideal para não estourar a tela
            color: AppColors.accent,
          ),
        ),
        const SizedBox(height: 12),
        
        // 5. Grid de Informações Adicionais (Compactado e Seguro)
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
                    const Icon(Icons.water_drop, color: Colors.blueAccent, size: 20),
                    const SizedBox(height: 2),
                    Text(
                      '${weather.humidity}% Umidade',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.accent),
                    ),
                    const SizedBox(height: 12),
                    const Icon(Icons.thermostat, color: Colors.blue, size: 20),
                    const SizedBox(height: 2),
                    Text(
                      '${weather.feelsLike}°C Sensação',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.accent),
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
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.accent),
                    ),
                    const SizedBox(height: 12),
                    const Icon(Icons.wb_sunny, color: Colors.yellow, size: 20),
                    const SizedBox(height: 2),
                    Text(
                      '${weather.uvIndex} UV',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.accent),
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
=======
// import 'package:busca_clima2/core/constants/app_colors.dart';
// import 'package:busca_clima2/features/weather/domain/models/weather_model.dart';
// import 'package:busca_clima2/features/weather/presentation/screans/widgets/displaydatahora.dart';
// import 'package:flutter/material.dart';

// class WeatherDisplay extends StatelessWidget {
//   final WeatherModel weather;

//   const WeatherDisplay({super.key, required this.weather,});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           '${weather.cityName}, ${weather.countryCode}',
//           style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//             fontWeight: FontWeight.bold,
//             fontSize: 28,
//             color: AppColors.white90,
//           ),
//         ),
//         const SizedBox(height: 4),
//           DisplayDataHora(),

//         SizedBox(height: 100),
//         Image.network(
//           weather.iconUrl,
//           scale: 0.5,
//           errorBuilder: (context, error, stackTrace) => const Icon(
//             Icons.wb_sunny_outlined,
//             size: 50,
//             color: AppColors.accent,
//           ),
//         ),
//         SizedBox(height: 4),

//         Text(
//           weather.description.toUpperCase(),
//           style: Theme.of(context).textTheme.titleMedium?.copyWith(
//             letterSpacing: 1.4,
//             fontSize: 14,
//             color: AppColors.white90,
//           ),
//         ),
//         SizedBox(height: 20),

//         Column(
//           children: [
//             Text(
//               '${weather.temperature.round()}°C ',
//               style: Theme.of(context).textTheme.displayLarge?.copyWith(
//                 fontWeight: FontWeight.w200,
//                 fontSize: 54,
//                 color: AppColors.accent,
//               ),
//             ),
//             SizedBox(height: 4),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 16
//                 // vertical: 16.0,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Icon(Icons.water_drop, color: Colors.blueAccent),
//                       SizedBox(height: 8),
//                       Text(
//                         '${weather.humidity} % Humidade',
//                         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.accent,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Icon(Icons.thermostat, color: Colors.blue,),
//                       Text(
//                         '${weather.feelsLike} Sensação termica',
//                         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.accent,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Icon(Icons.air, color: Colors.white),
//                       SizedBox(height: 8),
//                       Text(
//                         '${weather.windSpeed} vento, ',
//                         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.accent,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Icon(Icons.wb_sunny, color: Colors.yellow),
//                       Text(
//                         '${weather.uvIndex} UV ',
//                         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: AppColors.accent,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }


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
      mainAxisSize: MainAxisSize.min, // Garante que a coluna ocupe apenas o espaço necessário
      children: [
        // 1. Nome da Cidade (Reduzido ligeiramente de 32 para 28)
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

        // 2. Imagem do Clima (Reduzido o tamanho para não empurrar o resto para baixo)
        SizedBox(
          height: 100, // Limitamos a altura da imagem
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

        // 4. Temperatura Principal (Reduzido de displayLarge para displayMedium)
        Text(
          '${weather.temperature.round()}°C',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
            fontWeight: FontWeight.w200,
            fontSize: 54, // Tamanho ideal para não estourar a tela
            color: AppColors.accent,
          ),
        ),
        const SizedBox(height: 12),
        
        // 5. Grid de Informações Adicionais (Compactado e Seguro)
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
                    const Icon(Icons.water_drop, color: Colors.blueAccent, size: 20),
                    const SizedBox(height: 2),
                    Text(
                      '${weather.humidity}% Umidade',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.accent),
                    ),
                    const SizedBox(height: 12),
                    const Icon(Icons.thermostat, color: Colors.blue, size: 20),
                    const SizedBox(height: 2),
                    Text(
                      '${weather.feelsLike}°C Sensação',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.accent),
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
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.accent),
                    ),
                    const SizedBox(height: 12),
                    const Icon(Icons.wb_sunny, color: Colors.yellow, size: 20),
                    const SizedBox(height: 2),
                    Text(
                      '${weather.uvIndex} UV',
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: AppColors.accent),
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
>>>>>>> 8f9e9b4ff38e1dba3a22217e58566c9b46c572be
}