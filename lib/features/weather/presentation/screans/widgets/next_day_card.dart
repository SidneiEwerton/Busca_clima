import 'package:busca_clima2/core/constants/app_colors.dart';
import 'package:busca_clima2/features/weather/domain/models/weather_model.dart';
import 'package:busca_clima2/features/weather/presentation/screans/widgets/next_day.dart';
import 'package:flutter/widgets.dart';

class NextDayCard extends StatelessWidget {
  final WeatherModel weather;

  const NextDayCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // REMOVIDO o LayoutBuilder e height fixo.
      // Deixamos o container se ajustar dinamicamente ao padding.
      decoration: BoxDecoration(
        color: AppColors.white10,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.white20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: NextDay(weather: weather), 
    );
  }
}
