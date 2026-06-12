import 'package:busca_clima2/core/errors/failure.dart';
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
        throw const CityNotFoundException();
      }

      if (locations.length > 1) {
        throw MultipleCitiesFailure(locations);
      }

      return await _fetchWeather(locations.first);
    });

    if (!ref.mounted) return;
    state = newState;
  }

  Future<void> selectLocation(GeocodingModel location) async {
    state = const AsyncLoading();

    final newState = await AsyncValue.guard(() async {
      return await _fetchWeather(location);
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
    if (locations.isEmpty) throw const CityNotFoundException();
    return await _fetchWeather(locations.first);
  }
}