import 'package:gateflow/generated/json/base/json_field.dart';
import 'package:gateflow/generated/json/response_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ResponseEntity {

	int? code;
	String? msg;
	String? data;
  
  ResponseEntity();

  factory ResponseEntity.fromJson(Map<String, dynamic> json) => $ResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $ResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}