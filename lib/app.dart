
import 'package:busca_clima2/features/weather/presentation/screans/weather_home_scream.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget  {

  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busca clima',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),

      ),
      home: WeatherHomeScreen(),
    );
  }
}