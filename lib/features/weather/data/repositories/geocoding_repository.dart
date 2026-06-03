
import 'package:busca_clima2/features/weather/domain/models/geocoding_model.dart';
abstract class GeocodingRepository {
  Future<List<GeocodingModel>> fetchCityOptions(String name);
}