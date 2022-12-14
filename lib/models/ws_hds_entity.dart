import 'package:gateflow/generated/json/base/json_field.dart';
import 'package:gateflow/generated/json/ws_hds_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class WsHdsEntity {

	String? name;
	String? total;
	String? used;
	String? proportion;
  
  WsHdsEntity();

  factory WsHdsEntity.fromJson(Map<String, dynamic> json) => $WsHdsEntityFromJson(json);

  Map<String, dynamic> toJson() => $WsHdsEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}