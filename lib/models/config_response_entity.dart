import 'package:gateflow/generated/json/base/json_field.dart';
import 'package:gateflow/generated/json/config_response_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ConfigResponseEntity {
	int? code;
	String? msg;
	ConfigResponseData? data;

	ConfigResponseEntity();

	factory ConfigResponseEntity.fromJson(Map<String, dynamic> json) => $ConfigResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $ConfigResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ConfigResponseData {
	String? trueVoice1;
	int? heartbeatTime;
	String? trueVoice3;
	String? trueVoice2;
	ConfigResponseDataDeFalseVoice? deFalseVoice;
	String? configNo;
	int? writeOffDelayTime;
	int? invalidTime;
	String? equipmentNo;
	String? yccode;
	String? manufacturerId2;
	String? manufacturerId1;
	ConfigResponseDataDeTrueVoice? deTrueVoice;
	String? writeOffUrl;
	String? numUpUrl;
	String? heartbeatUrl;
	String? falseVoice3;
	int? numUpTime;
	String? falseVoice4;
	String? welcomeMsg;
	String? trueVoice4;
	String? checkUrl;
	String? falseVoice1;
	String? falseVoice2;

	ConfigResponseData();

	factory ConfigResponseData.fromJson(Map<String, dynamic> json) => $ConfigResponseDataFromJson(json);

	Map<String, dynamic> toJson() => $ConfigResponseDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ConfigResponseDataDeFalseVoice {
	String? other;
	String? invalid;
	String? used;
	String? error;

	ConfigResponseDataDeFalseVoice();

	factory ConfigResponseDataDeFalseVoice.fromJson(Map<String, dynamic> json) => $ConfigResponseDataDeFalseVoiceFromJson(json);

	Map<String, dynamic> toJson() => $ConfigResponseDataDeFalseVoiceToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ConfigResponseDataDeTrueVoice {
	String? normal;
	String? other;
	String? yearCard1;
	String? yearCard2;

	ConfigResponseDataDeTrueVoice();

	factory ConfigResponseDataDeTrueVoice.fromJson(Map<String, dynamic> json) => $ConfigResponseDataDeTrueVoiceFromJson(json);

	Map<String, dynamic> toJson() => $ConfigResponseDataDeTrueVoiceToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}