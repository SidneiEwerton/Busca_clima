import 'package:busca_clima2/features/weather/presentation/providers/weather_notifier.dart';
import 'package:busca_clima2/features/weather/presentation/widgets/weather_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherHomeScreen extends ConsumerStatefulWidget {
  const WeatherHomeScreen({super.key});

  @override
  ConsumerState<WeatherHomeScreen>  createState() => _WeatherHomeScreenState();
  }

  class _WeatherHomeScreenState extends ConsumerState<WeatherHomeScreen> {
    late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weatherState = ref.watch(weatherProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Consulte o clima ')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Digite uma cidade',
                suffixIcon: IconButton(
                  onPressed: () {
                    ref
                        .read(weatherProvider.notifier)
                        .searchWeather(_controller.text);
                    FocusScope.of(context).unfocus();
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(height: 32),
            weatherState.when(
              data: (weather) => Expanded(
                child: SingleChildScrollView(
                  child: WeatherDisplay(weather: weather),
                ),
              ),
              error: (error, stackTrace) => Padding(
                padding: EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    SizedBox(height: 16),
                    Text('Ops! $error', textAlign: TextAlign.center),
                  ],
                ),
              ),
              loading: () => const Expanded(
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  
}
