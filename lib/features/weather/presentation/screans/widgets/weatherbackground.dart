import 'package:busca_clima2/core/constants/app_colors.dart';
import 'package:busca_clima2/features/weather/presentation/screans/widgets/aurora_halo.dart';
import 'package:flutter/material.dart';

class Weatherbackground extends StatelessWidget {
  final Widget? child;

  const Weatherbackground({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            top: -50,
            right: -50,
            child: AuroraHalo(
              size: 350,
              color: Colors.orange,
              alpha: 60,
            ),
          ),

          Positioned(
            bottom: -100,
            left: -50,
            child: AuroraHalo(
              size: 400,
              color: AppColors.auroraBlue,
              alpha: 50,
            ),
          ),

          if (child != null) child!,
        ],
      ),
    );
  }
}
