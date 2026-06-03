
import 'package:busca_clima2/features/weather/data/repositories/weather_repository_provider.dart';
import 'package:busca_clima2/features/weather/domain/models/geocoding_model.dart';
import 'package:busca_clima2/features/weather/domain/models/weather_model.dart';
import 'package:busca_clima2/features/weather/domain/usecases/search_city_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_notifier.g.dart';



@riverpod
class WeatherNotifier extends _$WeatherNotifier {
  @override
  FutureOr<WeatherModel> build() async {
    return _fetchWeatherByCityName('Taubaté');
  }

  Future<void> search(String cityName) async {
    state = const AsyncLoading();
    
    final newState = await AsyncValue.guard(() async {
      final useCase = ref.read(searchCityUseCaseProvider);
      final locations = await useCase.execute(cityName);

      if (locations.isEmpty) {
        throw Exception('Cidade não encontrada');
      }

      if (locations.length > 1) {
        throw locations;
      }

      return await _fetchWeather(locations.first);
    });

    if (!ref.mounted) return;
    state = newState;
  }

  Future<void> selectLocation(GeocodingModel location) async {
    state = const AsyncLoading();
    
    final newState = await AsyncValue.guard(() async {
      try {
        return await _fetchWeather(location);
      } catch (e) {
        
        throw Exception('Erro ao processar os dados do clima: $e');
      }
    });
    
    if (!ref.mounted) return;
    state = newState;
  }

  Future<WeatherModel> _fetchWeather(GeocodingModel location) async {
    final weatherRepo = ref.read(weatherRepositoryProvider);
    return await weatherRepo.fetchWeatherByCoords(location.lat, location.lon);
  }

  Future<WeatherModel> _fetchWeatherByCityName(String cityName) async {
    final useCase = ref.read(searchCityUseCaseProvider);
    final locations = await useCase.execute(cityName);
    if (locations.isEmpty) throw Exception('Cidade padrão não encontrada');
    return await _fetchWeather(locations.first);
  }
}