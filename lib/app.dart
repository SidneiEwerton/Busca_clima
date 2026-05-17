import 'package:busca_clima2/core/constants/app_strings.dart';
import 'package:busca_clima2/core/constants/app_theme.dart';
import 'package:busca_clima2/features/settings/presentation/providers/theme_notifier.dart';
import 'package:busca_clima2/features/weather/presentation/screans/weather_home_scream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode =
        ref.watch(themeProvider).asData?.value ?? ThemeMode.system;
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      themeMode: themeMode,
      home: WeatherHomeScreen(),
    );
  }
}
