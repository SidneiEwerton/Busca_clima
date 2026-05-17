// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeocodingDto _$GeocodingDtoFromJson(Map<String, dynamic> json) =>
    _GeocodingDto(
      name: json['name'] as String,
      country: json['country'] as String,
      state: json['state'] as String?,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
    );

Map<String, dynamic> _$GeocodingDtoToJson(_GeocodingDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'state': instance.state,
      'lat': instance.lat,
      'lon': instance.lon,
    };
