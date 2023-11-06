import 'package:gateflow/generated/json/base/json_field.dart';
import 'package:gateflow/generated/json/custom_config_entity.g.dart';
import 'dart:convert';

import 'config_response_entity.dart';
export 'package:gateflow/generated/json/custom_config_entity.g.dart';

@JsonSerializable()
class CustomConfigEntity {
	int? code = 0;
	String? msg = '';
	CustomConfigData? data;

	CustomConfigEntity();

	factory CustomConfigEntity.fromJson(Map<String, dynamic> json) => $CustomConfigEntityFromJson(json);

	Map<String, dynamic> toJson() => $CustomConfigEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CustomConfigData {
	String? url = '';
	String? code = '';
	ConfigResponseData? config;

	CustomConfigData();

	factory CustomConfigData.fromJson(Map<String, dynamic> json) => $CustomConfigDataFromJson(json);

	Map<String, dynamic> toJson() => $CustomConfigDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}


@JsonSerializable()
class CustomConfigDataConfigDeFalseVoice {
	String? other = '';
	String? invalid = '';
	String? used = '';
	String? error = '';

	CustomConfigDataConfigDeFalseVoice();

	factory CustomConfigDataConfigDeFalseVoice.fromJson(Map<String, dynamic> json) => $CustomConfigDataConfigDeFalseVoiceFromJson(json);

	Map<String, dynamic> toJson() => $CustomConfigDataConfigDeFalseVoiceToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CustomConfigDataConfigDeTrueVoice {
	String? normal = '';
	String? other = '';
	String? yearCard1 = '';
	String? yearCard2 = '';

	CustomConfigDataConfigDeTrueVoice();

	factory CustomConfigDataConfigDeTrueVoice.fromJson(Map<String, dynamic> json) => $CustomConfigDataConfigDeTrueVoiceFromJson(json);

	Map<String, dynamic> toJson() => $CustomConfigDataConfigDeTrueVoiceToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}