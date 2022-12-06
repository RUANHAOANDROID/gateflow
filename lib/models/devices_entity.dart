import 'package:gateflow/generated/json/base/json_field.dart';
import 'package:gateflow/generated/json/devices_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class DevicesEntity {

	int? code;
	String? message;
	List<DevicesData>? data;
  
  DevicesEntity();

  factory DevicesEntity.fromJson(Map<String, dynamic> json) => $DevicesEntityFromJson(json);

  Map<String, dynamic> toJson() => $DevicesEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class DevicesData {

	int? id;
  String? deviceId;
  String? deviceNo;
  String? deviceIp;
	String? serialNumber;
	String? deviceVersion;
	String? deviceStatus;
	int? status;
  
  DevicesData();

  factory DevicesData.fromJson(Map<String, dynamic> json) => $DevicesDataFromJson(json);

  Map<String, dynamic> toJson() => $DevicesDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}