import 'package:busca_clima2/core/constants/app_colors.dart';
import 'package:busca_clima2/core/constants/app_strings.dart';
import 'package:busca_clima2/features/weather/presentation/screans/weather_home_scream.dart';
import 'package:busca_clima2/features/weather/presentation/screans/widgets/aurora_halo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherSplashScreen extends ConsumerStatefulWidget {
  const WeatherSplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WeatherSplashScreenState();
}

class _WeatherSplashScreenState extends ConsumerState<WeatherSplashScreen> {
  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const WeatherHomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 600),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            left: -50,
            child: AuroraHalo(
              size: 350,
              color: AppColors.auroraBlue,
              alpha: 40,
            ),
          ),
          Positioned(
            bottom: 100,
            right: -50,
            child: AuroraHalo(
              size: 300,
              color: AppColors.auroraViolet,
              alpha: 35,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.white10.withOpacity(0.05),
                    border: Border.all(color: AppColors.white10),
                  ),
                  child: const Icon(
                    Icons.cloud_queue_rounded,
                    size: 80,
                    color: AppColors.accent,
                  ),
                ),
                const SizedBox(height: 24),

                const Text(
                  AppStrings.appTitle,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 8),

                Text(
                  'Sua previsao do tempo em segundos',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
                const SizedBox(height: 48),

                const SizedBox(height: 48),

                const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.accent),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
