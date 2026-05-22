import 'package:busca_clima2/features/weather/data/repositories/geocoding_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart'; // ADICIONE ISSO
import 'package:busca_clima2/features/weather/data/repositories/geocoding_repository_impl.dart';
import 'package:busca_clima2/features/weather/domain/models/geocoding_model.dart';

part 'search_city_use_case.g.dart';

@riverpod
SearchCityUseCase searchCityUseCase( Ref ref) {
 
  final repository = ref.watch(geocodingRepositoryProvider);
  return SearchCityUseCase(repository);
}

class SearchCityUseCase {
  final GeocodingRepository _repository;

  SearchCityUseCase(this._repository);

  Future<List<GeocodingModel>> execute(String cityName) async {
    if (cityName.trim().isEmpty) return [];

    final locations = await _repository.fetchCityOptions(cityName);

    return locations;
  }
}