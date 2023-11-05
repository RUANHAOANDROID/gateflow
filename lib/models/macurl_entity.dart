import 'package:gateflow/generated/json/base/json_field.dart';
import 'package:gateflow/generated/json/macurl_entity.g.dart';
import 'dart:convert';
export 'package:gateflow/generated/json/macurl_entity.g.dart';

@JsonSerializable()
class MacurlEntity {
	int? code = 0;
	String? msg = '';
	MacurlData? data;

	MacurlEntity();

	factory MacurlEntity.fromJson(Map<String, dynamic> json) => $MacurlEntityFromJson(json);

	Map<String, dynamic> toJson() => $MacurlEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class MacurlData {
	String? mac = '';
	String? url = '';

	MacurlData();

	factory MacurlData.fromJson(Map<String, dynamic> json) => $MacurlDataFromJson(json);

	Map<String, dynamic> toJson() => $MacurlDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}