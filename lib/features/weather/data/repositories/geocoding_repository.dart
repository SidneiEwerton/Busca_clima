
import 'package:busca_clima2/features/weather/domain/models/geocoding_model.dart';
@override
abstract class GeocodingRepository {
  Future<List<GeocodingModel>> fetchCityOptions(String name);
}