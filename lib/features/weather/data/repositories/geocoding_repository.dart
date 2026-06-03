<<<<<<< HEAD

import 'package:busca_clima2/features/weather/domain/models/geocoding_model.dart';
@override
abstract class GeocodingRepository {
  Future<List<GeocodingModel>> fetchCityOptions(String name);
=======

import 'package:busca_clima2/features/weather/domain/models/geocoding_model.dart';
abstract class GeocodingRepository {
  Future<List<GeocodingModel>> fetchCityOptions(String name);
>>>>>>> 8f9e9b4ff38e1dba3a22217e58566c9b46c572be
}