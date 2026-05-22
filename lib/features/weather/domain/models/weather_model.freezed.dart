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

 String get cityName; String get countryCode; double get temperature; String get description; String get iconUrl; int get humidity; double get windSpeed; double? get uvIndex; DateTime get dateTime;
/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherModelCopyWith<WeatherModel> get copyWith => _$WeatherModelCopyWithImpl<WeatherModel>(this as WeatherModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherModel&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.uvIndex, uvIndex) || other.uvIndex == uvIndex)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime));
}


@override
int get hashCode => Object.hash(runtimeType,cityName,countryCode,temperature,description,iconUrl,humidity,windSpeed,uvIndex,dateTime);

@override
String toString() {
  return 'WeatherModel(cityName: $cityName, countryCode: $countryCode, temperature: $temperature, description: $description, iconUrl: $iconUrl, humidity: $humidity, windSpeed: $windSpeed, uvIndex: $uvIndex, dateTime: $dateTime)';
}


}

/// @nodoc
abstract mixin class $WeatherModelCopyWith<$Res>  {
  factory $WeatherModelCopyWith(WeatherModel value, $Res Function(WeatherModel) _then) = _$WeatherModelCopyWithImpl;
@useResult
$Res call({
 String cityName, String countryCode, double temperature, String description, String iconUrl, int humidity, double windSpeed, double? uvIndex, DateTime dateTime
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
@pragma('vm:prefer-inline') @override $Res call({Object? cityName = null,Object? countryCode = null,Object? temperature = null,Object? description = null,Object? iconUrl = null,Object? humidity = null,Object? windSpeed = null,Object? uvIndex = freezed,Object? dateTime = null,}) {
  return _then(_self.copyWith(
cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int,windSpeed: null == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as double,uvIndex: freezed == uvIndex ? _self.uvIndex : uvIndex // ignore: cast_nullable_to_non_nullable
as double?,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String cityName,  String countryCode,  double temperature,  String description,  String iconUrl,  int humidity,  double windSpeed,  double? uvIndex,  DateTime dateTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that.cityName,_that.countryCode,_that.temperature,_that.description,_that.iconUrl,_that.humidity,_that.windSpeed,_that.uvIndex,_that.dateTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String cityName,  String countryCode,  double temperature,  String description,  String iconUrl,  int humidity,  double windSpeed,  double? uvIndex,  DateTime dateTime)  $default,) {final _that = this;
switch (_that) {
case _WeatherModel():
return $default(_that.cityName,_that.countryCode,_that.temperature,_that.description,_that.iconUrl,_that.humidity,_that.windSpeed,_that.uvIndex,_that.dateTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String cityName,  String countryCode,  double temperature,  String description,  String iconUrl,  int humidity,  double windSpeed,  double? uvIndex,  DateTime dateTime)?  $default,) {final _that = this;
switch (_that) {
case _WeatherModel() when $default != null:
return $default(_that.cityName,_that.countryCode,_that.temperature,_that.description,_that.iconUrl,_that.humidity,_that.windSpeed,_that.uvIndex,_that.dateTime);case _:
  return null;

}
}

}

/// @nodoc


class _WeatherModel implements WeatherModel {
  const _WeatherModel({required this.cityName, required this.countryCode, required this.temperature, required this.description, required this.iconUrl, required this.humidity, required this.windSpeed, this.uvIndex, required this.dateTime});
  

@override final  String cityName;
@override final  String countryCode;
@override final  double temperature;
@override final  String description;
@override final  String iconUrl;
@override final  int humidity;
@override final  double windSpeed;
@override final  double? uvIndex;
@override final  DateTime dateTime;

/// Create a copy of WeatherModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherModelCopyWith<_WeatherModel> get copyWith => __$WeatherModelCopyWithImpl<_WeatherModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherModel&&(identical(other.cityName, cityName) || other.cityName == cityName)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.temperature, temperature) || other.temperature == temperature)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.humidity, humidity) || other.humidity == humidity)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.uvIndex, uvIndex) || other.uvIndex == uvIndex)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime));
}


@override
int get hashCode => Object.hash(runtimeType,cityName,countryCode,temperature,description,iconUrl,humidity,windSpeed,uvIndex,dateTime);

@override
String toString() {
  return 'WeatherModel(cityName: $cityName, countryCode: $countryCode, temperature: $temperature, description: $description, iconUrl: $iconUrl, humidity: $humidity, windSpeed: $windSpeed, uvIndex: $uvIndex, dateTime: $dateTime)';
}


}

/// @nodoc
abstract mixin class _$WeatherModelCopyWith<$Res> implements $WeatherModelCopyWith<$Res> {
  factory _$WeatherModelCopyWith(_WeatherModel value, $Res Function(_WeatherModel) _then) = __$WeatherModelCopyWithImpl;
@override @useResult
$Res call({
 String cityName, String countryCode, double temperature, String description, String iconUrl, int humidity, double windSpeed, double? uvIndex, DateTime dateTime
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
@override @pragma('vm:prefer-inline') $Res call({Object? cityName = null,Object? countryCode = null,Object? temperature = null,Object? description = null,Object? iconUrl = null,Object? humidity = null,Object? windSpeed = null,Object? uvIndex = freezed,Object? dateTime = null,}) {
  return _then(_WeatherModel(
cityName: null == cityName ? _self.cityName : cityName // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,temperature: null == temperature ? _self.temperature : temperature // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,iconUrl: null == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String,humidity: null == humidity ? _self.humidity : humidity // ignore: cast_nullable_to_non_nullable
as int,windSpeed: null == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as double,uvIndex: freezed == uvIndex ? _self.uvIndex : uvIndex // ignore: cast_nullable_to_non_nullable
as double?,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
