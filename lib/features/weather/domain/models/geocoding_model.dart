
import 'package:freezed_annotation/freezed_annotation.dart';

part 'geocoding_model.freezed.dart';


@freezed
abstract class GeocodingModel with _$GeocodingModel {
 const  factory GeocodingModel({
  required String name,
  required String country,
  String? state,
  required double  lat,
  required double lon,

}) = _GeocodingModel;
}