import 'package:gateflow/generated/json/base/json_field.dart';
import 'package:gateflow/generated/json/config_respons_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class ConfigResponsEntity {

	int? code;
	String? msg;
	ConfigResponsData? data;
  
  ConfigResponsEntity();

  factory ConfigResponsEntity.fromJson(Map<String, dynamic> json) => $ConfigResponsEntityFromJson(json);

  Map<String, dynamic> toJson() => $ConfigResponsEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ConfigResponsData {

	String? trueVoice1;
	int? heartbeatTime;
	String? trueVoice3;
	String? trueVoice2;
	ConfigResponsDataDeFalseVoice? deFalseVoice;
	String? configNo;
	int? writeOffDelayTime;
	int? invalidTime;
	String? equipmentNo;
	String? yccode;
	String? manufacturerId2;
	String? manufacturerId1;
	ConfigResponsDataDeTrueVoice? deTrueVoice;
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
  
  ConfigResponsData();

  factory ConfigResponsData.fromJson(Map<String, dynamic> json) => $ConfigResponsDataFromJson(json);

  Map<String, dynamic> toJson() => $ConfigResponsDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ConfigResponsDataDeFalseVoice {

	String? other;
	String? invalid;
	String? used;
	String? error;
  
  ConfigResponsDataDeFalseVoice();

  factory ConfigResponsDataDeFalseVoice.fromJson(Map<String, dynamic> json) => $ConfigResponsDataDeFalseVoiceFromJson(json);

  Map<String, dynamic> toJson() => $ConfigResponsDataDeFalseVoiceToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ConfigResponsDataDeTrueVoice {

	String? normal;
	String? other;
	String? yearCard1;
	String? yearCard2;
  
  ConfigResponsDataDeTrueVoice();

  factory ConfigResponsDataDeTrueVoice.fromJson(Map<String, dynamic> json) => $ConfigResponsDataDeTrueVoiceFromJson(json);

  Map<String, dynamic> toJson() => $ConfigResponsDataDeTrueVoiceToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}