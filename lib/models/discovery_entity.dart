import 'package:gateflow/generated/json/base/json_field.dart';
import 'package:gateflow/generated/json/discovery_entity.g.dart';
import 'dart:convert';
export 'package:gateflow/generated/json/discovery_entity.g.dart';

@JsonSerializable()
class DiscoveryEntity {
	int? code = 0;
	String? msg = '';
	List<DiscoveryData> data = [];

	DiscoveryEntity();

	factory DiscoveryEntity.fromJson(Map<String, dynamic> json) => $DiscoveryEntityFromJson(json);

	Map<String, dynamic> toJson() => $DiscoveryEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class DiscoveryData {
	String? device_name = '';
	String? device_sn = '';
	String? device_ip = '';
	String? device_type = '';
	String? device_version = '';
	String? added = '';

	DiscoveryData();

	factory DiscoveryData.fromJson(Map<String, dynamic> json) => $DiscoveryDataFromJson(json);

	Map<String, dynamic> toJson() => $DiscoveryDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}