// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    WeatherResponse(
      data: WeatherData.fromJson(json['main'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'main': instance.data.toJson(),
    };

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) => WeatherData(
      tempInKelvin: getDouble(json['temp']),
      humidity: getInt(json['humidity']),
    );

Map<String, dynamic> _$WeatherDataToJson(WeatherData instance) =>
    <String, dynamic>{
      'temp': instance.tempInKelvin,
      'humidity': instance.humidity,
    };
