import 'package:json_annotation/json_annotation.dart';
import 'package:weather_counter_app/utils/helper_utils/convertors.dart';

part 'schemas.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherResponse {
  @JsonKey(name: "main")
  final WeatherData data;

  WeatherResponse({
    required this.data,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class WeatherData {
  // Save temp in kelvin itself to preserve the precision during convertions
  @JsonKey(name: "temp", fromJson: getDouble)
  final double tempInKelvin;
  @JsonKey(fromJson: getInt)
  final int humidity;

  WeatherData({
    required this.tempInKelvin,
    required this.humidity,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherDataToJson(this);
}
