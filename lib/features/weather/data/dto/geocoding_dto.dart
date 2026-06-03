<<<<<<< HEAD

import 'package:freezed_annotation/freezed_annotation.dart';

part 'geocoding_dto.freezed.dart';
part 'geocoding_dto.g.dart';


@freezed
abstract class GeocodingDto with _$GeocodingDto {
 const  factory GeocodingDto({
  required String name,
  required String country,
  String? state,
  required double lat,
  required double lon,
 }) = _GeocodingDto;

 factory GeocodingDto.fromJson(Map<String, dynamic> json) => _$GeocodingDtoFromJson(json);
=======

import 'package:freezed_annotation/freezed_annotation.dart';

part 'geocoding_dto.freezed.dart';
part 'geocoding_dto.g.dart';


@freezed
abstract class GeocodingDto with _$GeocodingDto {
 const  factory GeocodingDto({
  required String name,
  required String country,
  String? state,
  required double lat,
  required double lon,
 }) = _GeocodingDto;

 factory GeocodingDto.fromJson(Map<String, dynamic> json) => _$GeocodingDtoFromJson(json);
>>>>>>> 8f9e9b4ff38e1dba3a22217e58566c9b46c572be
}