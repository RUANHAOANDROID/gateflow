import 'package:gateflow/generated/json/base/json_field.dart';
import 'package:gateflow/generated/json/config_get_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ConfigGetEntity {

	String? configUrl;
	String? id;
  
  ConfigGetEntity();

  factory ConfigGetEntity.fromJson(Map<String, dynamic> json) => $ConfigGetEntityFromJson(json);

  Map<String, dynamic> toJson() => $ConfigGetEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}