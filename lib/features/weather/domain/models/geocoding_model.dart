<<<<<<< HEAD

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
=======

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
>>>>>>> 8f9e9b4ff38e1dba3a22217e58566c9b46c572be
}