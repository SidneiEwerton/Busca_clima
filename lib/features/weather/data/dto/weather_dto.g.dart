// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherDto _$WeatherDtoFromJson(Map<String, dynamic> json) => _WeatherDto(
  main: MainDto.fromJson(json['main'] as Map<String, dynamic>),
  weather: (json['weather'] as List<dynamic>)
      .map((e) => WeatherDescriptionDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  name: json['name'] as String,
  dt: (json['dt'] as num).toInt(),
  sys: SysDto.fromJson(json['sys'] as Map<String, dynamic>),
  wind: WindDto.fromJson(json['wind'] as Map<String, dynamic>),
  uvIndex: (json['uvIndex'] as num?)?.toDouble(),
);

Map<String, dynamic> _$WeatherDtoToJson(_WeatherDto instance) =>
    <String, dynamic>{
      'main': instance.main,
      'weather': instance.weather,
      'name': instance.name,
      'dt': instance.dt,
      'sys': instance.sys,
      'wind': instance.wind,
      'uvIndex': instance.uvIndex,
    };

_MainDto _$MainDtoFromJson(Map<String, dynamic> json) => _MainDto(
  temp: (json['temp'] as num).toDouble(),
  feelsLike: (json['feels_like'] as num).toDouble(),
  humidity: (json['humidity'] as num).toInt(),
);

Map<String, dynamic> _$MainDtoToJson(_MainDto instance) => <String, dynamic>{
  'temp': instance.temp,
  'feels_like': instance.feelsLike,
  'humidity': instance.humidity,
};

_WeatherDescriptionDto _$WeatherDescriptionDtoFromJson(
  Map<String, dynamic> json,
) => _WeatherDescriptionDto(
  description: json['description'] as String,
  icon: json['icon'] as String,
);

Map<String, dynamic> _$WeatherDescriptionDtoToJson(
  _WeatherDescriptionDto instance,
) => <String, dynamic>{
  'description': instance.description,
  'icon': instance.icon,
};

_SysDto _$SysDtoFromJson(Map<String, dynamic> json) =>
    _SysDto(country: json['country'] as String);

Map<String, dynamic> _$SysDtoToJson(_SysDto instance) => <String, dynamic>{
  'country': instance.country,
};

_WindDto _$WindDtoFromJson(Map<String, dynamic> json) =>
    _WindDto(speed: (json['speed'] as num).toDouble());

Map<String, dynamic> _$WindDtoToJson(_WindDto instance) => <String, dynamic>{
  'speed': instance.speed,
};

_UvIndexDto _$UvIndexDtoFromJson(Map<String, dynamic> json) =>
    _UvIndexDto(uv: (json['uv'] as num).toDouble());

Map<String, dynamic> _$UvIndexDtoToJson(_UvIndexDto instance) =>
    <String, dynamic>{'uv': instance.uv};
