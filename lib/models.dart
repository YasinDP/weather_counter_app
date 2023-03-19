import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class GeoCode {
  final double latitude;
  final double longitude;

  GeoCode({
    required this.latitude,
    required this.longitude,
  });
}
