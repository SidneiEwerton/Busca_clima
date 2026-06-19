// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeatherModel {

 String get cityName; String get countryCode; double get temperature; String get description; String get iconUrl; int get humidity; double get windSpeed; double? get feelsLike; double? get uvIndex; DateTime get dateTime; List<DailyForecast> get dailyForecasts; List<HourlyForecast> get hourlyForecast;
/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherModelCopyWith<WeatherModel> get copyWith => _$WeatherModelCopyWithImpl<WeatherModel>(this as WeatherModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherModel&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.uvIndex, uvIndex) || other.uvIndex == uvIndex)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&const DeepCollectionEquality().equals(other.dailyForecasts, dailyForecasts)&&const DeepCollectionEquality().equals(other.hourlyForecast, hourlyForecast));
}


@override
int get hashCode => Object.hash(runtimeType,cityName,countryCode,temperature,description,iconUrl,humidity,windSpeed,feelsLike,uvIndex,dateTime,const DeepCollectionEquality().hash(dailyForecasts),const DeepCollectionEquality().hash(hourlyForecast));

@override
String toString() {
  return 'WeatherModel(cityName: $cityName, countryCode: $countryCode, temperature: $temperature, description: $description, iconUrl: $iconUrl, humidity: $humidity, windSpeed: $windSpeed, feelsLike: $feelsLike, uvIndex: $uvIndex, dateTime: $dateTime, dailyForecasts: $dailyForecasts, hourlyForecast: $hourlyForecast)';
}


}

/// @nodoc
abstract mixin class $WeatherModelCopyWith<$Res>  {
  factory $WeatherModelCopyWith(WeatherModel value, $Res Function(WeatherModel) _then) = _$WeatherModelCopyWithImpl;
@useResult
$Res call({
 String cityName, String countryCode, double temperature, String description, String iconUrl, int humidity, double windSpeed, double? feelsLike, double? uvIndex, DateTime dateTime, List<DailyForecast> dailyForecasts, List<HourlyForecast> hourlyForecast
});




}
/// @nodoc
class _$WeatherModelCopyWithImpl<$Res>
    implements $WeatherModelCopyWith<$Res> {
  _$WeatherModelCopyWithImpl(this._self, this._then);

  final WeatherModel _self;
  final $Res Function(WeatherModel) _then;

/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cityName = null,Object? countryCode = null,Object? temperature = null,Object? description = null,Object? iconUrl = null,Object? humidity = null,Object? windSpeed = null,Object? feelsLike = freezed,Object? uvIndex = freezed,Object? dateTime = null,Object? dailyForecasts = null,Object? hourlyForecast = null,}) {
  return _then(_self.copyWith(
cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int,windSpeed: null == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as double,feelsLike: freezed == feelsLike ? _self.feelsLike : feelsLike // ignore: cast_nullable_to_non_nullable
as double?,uvIndex: freezed == uvIndex ? _self.uvIndex : uvIndex // ignore: cast_nullable_to_non_nullable
as double?,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,dailyForecasts: null == dailyForecasts ? _self.dailyForecasts : dailyForecasts // ignore: cast_nullable_to_non_nullable
as List<DailyForecast>,hourlyForecast: null == hourlyForecast ? _self.hourlyForecast : hourlyForecast // ignore: cast_nullable_to_non_nullable
as List<HourlyForecast>,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherModel].
extension WeatherModelPatterns on WeatherModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherModel value)  $default,){
final _that = this;
switch (_that) {
case _WeatherModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherModel value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String cityName,  String countryCode,  double temperature,  String description,  String iconUrl,  int humidity,  double windSpeed,  double? feelsLike,  double? uvIndex,  DateTime dateTime,  List<DailyForecast> dailyForecasts,  List<HourlyForecast> hourlyForecast)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that.cityName,_that.countryCode,_that.temperature,_that.description,_that.iconUrl,_that.humidity,_that.windSpeed,_that.feelsLike,_that.uvIndex,_that.dateTime,_that.dailyForecasts,_that.hourlyForecast);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String cityName,  String countryCode,  double temperature,  String description,  String iconUrl,  int humidity,  double windSpeed,  double? feelsLike,  double? uvIndex,  DateTime dateTime,  List<DailyForecast> dailyForecasts,  List<HourlyForecast> hourlyForecast)  $default,) {final _that = this;
switch (_that) {
case _WeatherModel():
return $default(_that.cityName,_that.countryCode,_that.temperature,_that.description,_that.iconUrl,_that.humidity,_that.windSpeed,_that.feelsLike,_that.uvIndex,_that.dateTime,_that.dailyForecasts,_that.hourlyForecast);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String cityName,  String countryCode,  double temperature,  String description,  String iconUrl,  int humidity,  double windSpeed,  double? feelsLike,  double? uvIndex,  DateTime dateTime,  List<DailyForecast> dailyForecasts,  List<HourlyForecast> hourlyForecast)?  $default,) {final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that.cityName,_that.countryCode,_that.temperature,_that.description,_that.iconUrl,_that.humidity,_that.windSpeed,_that.feelsLike,_that.uvIndex,_that.dateTime,_that.dailyForecasts,_that.hourlyForecast);case _:
  return null;

}
}

}

/// @nodoc


class _WeatherModel implements WeatherModel {
  const _WeatherModel({required this.cityName, required this.countryCode, required this.temperature, required this.description, required this.iconUrl, required this.humidity, required this.windSpeed, required this.feelsLike, this.uvIndex, required this.dateTime, required final  List<DailyForecast> dailyForecasts, required final  List<HourlyForecast> hourlyForecast}): _dailyForecasts = dailyForecasts,_hourlyForecast = hourlyForecast;
  

@override final  String cityName;
@override final  String countryCode;
@override final  double temperature;
@override final  String description;
@override final  String iconUrl;
@override final  int humidity;
@override final  double windSpeed;
@override final  double? feelsLike;
@override final  double? uvIndex;
@override final  DateTime dateTime;
 final  List<DailyForecast> _dailyForecasts;
@override List<DailyForecast> get dailyForecasts {
  if (_dailyForecasts is EqualUnmodifiableListView) return _dailyForecasts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dailyForecasts);
}

 final  List<HourlyForecast> _hourlyForecast;
@override List<HourlyForecast> get hourlyForecast {
  if (_hourlyForecast is EqualUnmodifiableListView) return _hourlyForecast;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hourlyForecast);
}


/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherModelCopyWith<_WeatherModel> get copyWith => __$WeatherModelCopyWithImpl<_WeatherModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherModel&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.feelsLike, feelsLike) || other.feelsLike == feelsLike)&&(identical(other.uvIndex, uvIndex) || other.uvIndex == uvIndex)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&const DeepCollectionEquality().equals(other._dailyForecasts, _dailyForecasts)&&const DeepCollectionEquality().equals(other._hourlyForecast, _hourlyForecast));
}


@override
int get hashCode => Object.hash(runtimeType,cityName,countryCode,temperature,description,iconUrl,humidity,windSpeed,feelsLike,uvIndex,dateTime,const DeepCollectionEquality().hash(_dailyForecasts),const DeepCollectionEquality().hash(_hourlyForecast));

@override
String toString() {
  return 'WeatherModel(cityName: $cityName, countryCode: $countryCode, temperature: $temperature, description: $description, iconUrl: $iconUrl, humidity: $humidity, windSpeed: $windSpeed, feelsLike: $feelsLike, uvIndex: $uvIndex, dateTime: $dateTime, dailyForecasts: $dailyForecasts, hourlyForecast: $hourlyForecast)';
}


}

/// @nodoc
abstract mixin class _$WeatherModelCopyWith<$Res> implements $WeatherModelCopyWith<$Res> {
  factory _$WeatherModelCopyWith(_WeatherModel value, $Res Function(_WeatherModel) _then) = __$WeatherModelCopyWithImpl;
@override @useResult
$Res call({
 String cityName, String countryCode, double temperature, String description, String iconUrl, int humidity, double windSpeed, double? feelsLike, double? uvIndex, DateTime dateTime, List<DailyForecast> dailyForecasts, List<HourlyForecast> hourlyForecast
});




}
/// @nodoc
class __$WeatherModelCopyWithImpl<$Res>
    implements _$WeatherModelCopyWith<$Res> {
  __$WeatherModelCopyWithImpl(this._self, this._then);

  final _WeatherModel _self;
  final $Res Function(_WeatherModel) _then;

/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cityName = null,Object? countryCode = null,Object? temperature = null,Object? description = null,Object? iconUrl = null,Object? humidity = null,Object? windSpeed = null,Object? feelsLike = freezed,Object? uvIndex = freezed,Object? dateTime = null,Object? dailyForecasts = null,Object? hourlyForecast = null,}) {
  return _then(_WeatherModel(
cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int,windSpeed: null == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as double,feelsLike: freezed == feelsLike ? _self.feelsLike : feelsLike // ignore: cast_nullable_to_non_nullable
as double?,uvIndex: freezed == uvIndex ? _self.uvIndex : uvIndex // ignore: cast_nullable_to_non_nullable
as double?,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,dailyForecasts: null == dailyForecasts ? _self._dailyForecasts : dailyForecasts // ignore: cast_nullable_to_non_nullable
as List<DailyForecast>,hourlyForecast: null == hourlyForecast ? _self._hourlyForecast : hourlyForecast // ignore: cast_nullable_to_non_nullable
as List<HourlyForecast>,
  ));
}


}

// dart format on
