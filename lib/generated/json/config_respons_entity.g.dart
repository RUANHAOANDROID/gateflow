import 'package:gateflow/generated/json/base/json_convert_content.dart';
import 'package:gateflow/models/config_respons_entity.dart';

ConfigResponsEntity $ConfigResponsEntityFromJson(Map<String, dynamic> json) {
	final ConfigResponsEntity configResponsEntity = ConfigResponsEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		configResponsEntity.code = code;
	}
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		configResponsEntity.msg = msg;
	}
	final ConfigResponsData? data = jsonConvert.convert<ConfigResponsData>(json['data']);
	if (data != null) {
		configResponsEntity.data = data;
	}
	return configResponsEntity;
}

Map<String, dynamic> $ConfigResponsEntityToJson(ConfigResponsEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] = entity.data?.toJson();
	return data;
}

ConfigResponsData $ConfigResponsDataFromJson(Map<String, dynamic> json) {
	final ConfigResponsData configResponsData = ConfigResponsData();
	final String? trueVoice1 = jsonConvert.convert<String>(json['trueVoice1']);
	if (trueVoice1 != null) {
		configResponsData.trueVoice1 = trueVoice1;
	}
	final int? heartbeatTime = jsonConvert.convert<int>(json['heartbeatTime']);
	if (heartbeatTime != null) {
		configResponsData.heartbeatTime = heartbeatTime;
	}
	final String? trueVoice3 = jsonConvert.convert<String>(json['trueVoice3']);
	if (trueVoice3 != null) {
		configResponsData.trueVoice3 = trueVoice3;
	}
	final String? trueVoice2 = jsonConvert.convert<String>(json['trueVoice2']);
	if (trueVoice2 != null) {
		configResponsData.trueVoice2 = trueVoice2;
	}
	final ConfigResponsDataDeFalseVoice? deFalseVoice = jsonConvert.convert<ConfigResponsDataDeFalseVoice>(json['deFalseVoice']);
	if (deFalseVoice != null) {
		configResponsData.deFalseVoice = deFalseVoice;
	}
	final String? configNo = jsonConvert.convert<String>(json['configNo']);
	if (configNo != null) {
		configResponsData.configNo = configNo;
	}
	final int? writeOffDelayTime = jsonConvert.convert<int>(json['writeOffDelayTime']);
	if (writeOffDelayTime != null) {
		configResponsData.writeOffDelayTime = writeOffDelayTime;
	}
	final int? invalidTime = jsonConvert.convert<int>(json['invalidTime']);
	if (invalidTime != null) {
		configResponsData.invalidTime = invalidTime;
	}
	final String? equipmentNo = jsonConvert.convert<String>(json['equipmentNo']);
	if (equipmentNo != null) {
		configResponsData.equipmentNo = equipmentNo;
	}
	final String? yccode = jsonConvert.convert<String>(json['yccode']);
	if (yccode != null) {
		configResponsData.yccode = yccode;
	}
	final String? manufacturerId2 = jsonConvert.convert<String>(json['manufacturerId2']);
	if (manufacturerId2 != null) {
		configResponsData.manufacturerId2 = manufacturerId2;
	}
	final String? manufacturerId1 = jsonConvert.convert<String>(json['manufacturerId1']);
	if (manufacturerId1 != null) {
		configResponsData.manufacturerId1 = manufacturerId1;
	}
	final ConfigResponsDataDeTrueVoice? deTrueVoice = jsonConvert.convert<ConfigResponsDataDeTrueVoice>(json['deTrueVoice']);
	if (deTrueVoice != null) {
		configResponsData.deTrueVoice = deTrueVoice;
	}
	final String? writeOffUrl = jsonConvert.convert<String>(json['writeOffUrl']);
	if (writeOffUrl != null) {
		configResponsData.writeOffUrl = writeOffUrl;
	}
	final String? numUpUrl = jsonConvert.convert<String>(json['numUpUrl']);
	if (numUpUrl != null) {
		configResponsData.numUpUrl = numUpUrl;
	}
	final String? heartbeatUrl = jsonConvert.convert<String>(json['heartbeatUrl']);
	if (heartbeatUrl != null) {
		configResponsData.heartbeatUrl = heartbeatUrl;
	}
	final String? falseVoice3 = jsonConvert.convert<String>(json['falseVoice3']);
	if (falseVoice3 != null) {
		configResponsData.falseVoice3 = falseVoice3;
	}
	final int? numUpTime = jsonConvert.convert<int>(json['numUpTime']);
	if (numUpTime != null) {
		configResponsData.numUpTime = numUpTime;
	}
	final String? falseVoice4 = jsonConvert.convert<String>(json['falseVoice4']);
	if (falseVoice4 != null) {
		configResponsData.falseVoice4 = falseVoice4;
	}
	final String? welcomeMsg = jsonConvert.convert<String>(json['welcomeMsg']);
	if (welcomeMsg != null) {
		configResponsData.welcomeMsg = welcomeMsg;
	}
	final String? trueVoice4 = jsonConvert.convert<String>(json['trueVoice4']);
	if (trueVoice4 != null) {
		configResponsData.trueVoice4 = trueVoice4;
	}
	final String? checkUrl = jsonConvert.convert<String>(json['checkUrl']);
	if (checkUrl != null) {
		configResponsData.checkUrl = checkUrl;
	}
	final String? falseVoice1 = jsonConvert.convert<String>(json['falseVoice1']);
	if (falseVoice1 != null) {
		configResponsData.falseVoice1 = falseVoice1;
	}
	final String? falseVoice2 = jsonConvert.convert<String>(json['falseVoice2']);
	if (falseVoice2 != null) {
		configResponsData.falseVoice2 = falseVoice2;
	}
	return configResponsData;
}

Map<String, dynamic> $ConfigResponsDataToJson(ConfigResponsData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['trueVoice1'] = entity.trueVoice1;
	data['heartbeatTime'] = entity.heartbeatTime;
	data['trueVoice3'] = entity.trueVoice3;
	data['trueVoice2'] = entity.trueVoice2;
	data['deFalseVoice'] = entity.deFalseVoice?.toJson();
	data['configNo'] = entity.configNo;
	data['writeOffDelayTime'] = entity.writeOffDelayTime;
	data['invalidTime'] = entity.invalidTime;
	data['equipmentNo'] = entity.equipmentNo;
	data['yccode'] = entity.yccode;
	data['manufacturerId2'] = entity.manufacturerId2;
	data['manufacturerId1'] = entity.manufacturerId1;
	data['deTrueVoice'] = entity.deTrueVoice?.toJson();
	data['writeOffUrl'] = entity.writeOffUrl;
	data['numUpUrl'] = entity.numUpUrl;
	data['heartbeatUrl'] = entity.heartbeatUrl;
	data['falseVoice3'] = entity.falseVoice3;
	data['numUpTime'] = entity.numUpTime;
	data['falseVoice4'] = entity.falseVoice4;
	data['welcomeMsg'] = entity.welcomeMsg;
	data['trueVoice4'] = entity.trueVoice4;
	data['checkUrl'] = entity.checkUrl;
	data['falseVoice1'] = entity.falseVoice1;
	data['falseVoice2'] = entity.falseVoice2;
	return data;
}

ConfigResponsDataDeFalseVoice $ConfigResponsDataDeFalseVoiceFromJson(Map<String, dynamic> json) {
	final ConfigResponsDataDeFalseVoice configResponsDataDeFalseVoice = ConfigResponsDataDeFalseVoice();
	final String? other = jsonConvert.convert<String>(json['other']);
	if (other != null) {
		configResponsDataDeFalseVoice.other = other;
	}
	final String? invalid = jsonConvert.convert<String>(json['invalid']);
	if (invalid != null) {
		configResponsDataDeFalseVoice.invalid = invalid;
	}
	final String? used = jsonConvert.convert<String>(json['used']);
	if (used != null) {
		configResponsDataDeFalseVoice.used = used;
	}
	final String? error = jsonConvert.convert<String>(json['error']);
	if (error != null) {
		configResponsDataDeFalseVoice.error = error;
	}
	return configResponsDataDeFalseVoice;
}

Map<String, dynamic> $ConfigResponsDataDeFalseVoiceToJson(ConfigResponsDataDeFalseVoice entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['other'] = entity.other;
	data['invalid'] = entity.invalid;
	data['used'] = entity.used;
	data['error'] = entity.error;
	return data;
}

ConfigResponsDataDeTrueVoice $ConfigResponsDataDeTrueVoiceFromJson(Map<String, dynamic> json) {
	final ConfigResponsDataDeTrueVoice configResponsDataDeTrueVoice = ConfigResponsDataDeTrueVoice();
	final String? normal = jsonConvert.convert<String>(json['normal']);
	if (normal != null) {
		configResponsDataDeTrueVoice.normal = normal;
	}
	final String? other = jsonConvert.convert<String>(json['other']);
	if (other != null) {
		configResponsDataDeTrueVoice.other = other;
	}
	final String? yearCard1 = jsonConvert.convert<String>(json['yearCard1']);
	if (yearCard1 != null) {
		configResponsDataDeTrueVoice.yearCard1 = yearCard1;
	}
	final String? yearCard2 = jsonConvert.convert<String>(json['yearCard2']);
	if (yearCard2 != null) {
		configResponsDataDeTrueVoice.yearCard2 = yearCard2;
	}
	return configResponsDataDeTrueVoice;
}

Map<String, dynamic> $ConfigResponsDataDeTrueVoiceToJson(ConfigResponsDataDeTrueVoice entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['normal'] = entity.normal;
	data['other'] = entity.other;
	data['yearCard1'] = entity.yearCard1;
	data['yearCard2'] = entity.yearCard2;
	return data;
}