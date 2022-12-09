import 'package:gateflow/generated/json/base/json_field.dart';
import 'package:gateflow/generated/json/hardware_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class HardwareEntity {
  String? name;
  String? total;
  String? used;
  String? proportion;

  HardwareEntity();

  factory HardwareEntity.fromJson(Map<String, dynamic> json) =>
      $HardwareEntityFromJson(json);

  Map<String, dynamic> toJson() => $HardwareEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
