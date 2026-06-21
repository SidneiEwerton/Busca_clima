import 'package:busca_clima2/features/weather/domain/models/geocoding_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_notifier.g.dart';

// implementar busca incremental com debounce de 400ms.
// Fluxo: TextField.onChange -> debounce -> search(query) ->
// GeocodingRepository.fetchCityOptions() -> AsyncValue<List<GeocodingModel>>.
@riverpod
class SearchNotifier extends _$SearchNotifier {
  @override
  AsyncValue<List<GeocodingModel>> build() => const AsyncData([]);
}
