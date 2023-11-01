import 'package:gateflow/generated/json/base/json_convert_content.dart';
import 'package:gateflow/models/config_response_entity.dart';

ConfigResponseEntity $ConfigResponseEntityFromJson(Map<String, dynamic> json) {
  final ConfigResponseEntity configResponseEntity = ConfigResponseEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    configResponseEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    configResponseEntity.msg = msg;
  }
  final ConfigResponseData? data = jsonConvert.convert<ConfigResponseData>(
      json['data']);
  if (data != null) {
    configResponseEntity.data = data;
  }
  return configResponseEntity;
}

Map<String, dynamic> $ConfigResponseEntityToJson(ConfigResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.toJson();
  return data;
}

extension ConfigResponseEntityExtension on ConfigResponseEntity {
  ConfigResponseEntity copyWith({
    int? code,
    String? msg,
    ConfigResponseData? data,
  }) {
    return ConfigResponseEntity()
      ..code = code ?? this.code
      ..msg = msg ?? this.msg
      ..data = data ?? this.data;
  }
}

ConfigResponseData $ConfigResponseDataFromJson(Map<String, dynamic> json) {
  final ConfigResponseData configResponseData = ConfigResponseData();
  final String? trueVoice1 = jsonConvert.convert<String>(json['trueVoice1']);
  if (trueVoice1 != null) {
    configResponseData.trueVoice1 = trueVoice1;
  }
  final int? heartbeatTime = jsonConvert.convert<int>(json['heartbeatTime']);
  if (heartbeatTime != null) {
    configResponseData.heartbeatTime = heartbeatTime;
  }
  final String? trueVoice3 = jsonConvert.convert<String>(json['trueVoice3']);
  if (trueVoice3 != null) {
    configResponseData.trueVoice3 = trueVoice3;
  }
  final String? trueVoice2 = jsonConvert.convert<String>(json['trueVoice2']);
  if (trueVoice2 != null) {
    configResponseData.trueVoice2 = trueVoice2;
  }
  final ConfigResponseDataDeFalseVoice? deFalseVoice = jsonConvert.convert<
      ConfigResponseDataDeFalseVoice>(json['deFalseVoice']);
  if (deFalseVoice != null) {
    configResponseData.deFalseVoice = deFalseVoice;
  }
  final String? configNo = jsonConvert.convert<String>(json['configNo']);
  if (configNo != null) {
    configResponseData.configNo = configNo;
  }
  final int? writeOffDelayTime = jsonConvert.convert<int>(
      json['writeOffDelayTime']);
  if (writeOffDelayTime != null) {
    configResponseData.writeOffDelayTime = writeOffDelayTime;
  }
  final int? invalidTime = jsonConvert.convert<int>(json['invalidTime']);
  if (invalidTime != null) {
    configResponseData.invalidTime = invalidTime;
  }
  final String? equipmentNo = jsonConvert.convert<String>(json['equipmentNo']);
  if (equipmentNo != null) {
    configResponseData.equipmentNo = equipmentNo;
  }
  final String? yccode = jsonConvert.convert<String>(json['yccode']);
  if (yccode != null) {
    configResponseData.yccode = yccode;
  }
  final String? manufacturerId2 = jsonConvert.convert<String>(
      json['manufacturerId2']);
  if (manufacturerId2 != null) {
    configResponseData.manufacturerId2 = manufacturerId2;
  }
  final String? manufacturerId1 = jsonConvert.convert<String>(
      json['manufacturerId1']);
  if (manufacturerId1 != null) {
    configResponseData.manufacturerId1 = manufacturerId1;
  }
  final ConfigResponseDataDeTrueVoice? deTrueVoice = jsonConvert.convert<
      ConfigResponseDataDeTrueVoice>(json['deTrueVoice']);
  if (deTrueVoice != null) {
    configResponseData.deTrueVoice = deTrueVoice;
  }
  final String? writeOffUrl = jsonConvert.convert<String>(json['writeOffUrl']);
  if (writeOffUrl != null) {
    configResponseData.writeOffUrl = writeOffUrl;
  }
  final String? numUpUrl = jsonConvert.convert<String>(json['numUpUrl']);
  if (numUpUrl != null) {
    configResponseData.numUpUrl = numUpUrl;
  }
  final String? heartbeatUrl = jsonConvert.convert<String>(
      json['heartbeatUrl']);
  if (heartbeatUrl != null) {
    configResponseData.heartbeatUrl = heartbeatUrl;
  }
  final String? falseVoice3 = jsonConvert.convert<String>(json['falseVoice3']);
  if (falseVoice3 != null) {
    configResponseData.falseVoice3 = falseVoice3;
  }
  final int? numUpTime = jsonConvert.convert<int>(json['numUpTime']);
  if (numUpTime != null) {
    configResponseData.numUpTime = numUpTime;
  }
  final String? falseVoice4 = jsonConvert.convert<String>(json['falseVoice4']);
  if (falseVoice4 != null) {
    configResponseData.falseVoice4 = falseVoice4;
  }
  final String? welcomeMsg = jsonConvert.convert<String>(json['welcomeMsg']);
  if (welcomeMsg != null) {
    configResponseData.welcomeMsg = welcomeMsg;
  }
  final String? trueVoice4 = jsonConvert.convert<String>(json['trueVoice4']);
  if (trueVoice4 != null) {
    configResponseData.trueVoice4 = trueVoice4;
  }
  final String? checkUrl = jsonConvert.convert<String>(json['checkUrl']);
  if (checkUrl != null) {
    configResponseData.checkUrl = checkUrl;
  }
  final String? falseVoice1 = jsonConvert.convert<String>(json['falseVoice1']);
  if (falseVoice1 != null) {
    configResponseData.falseVoice1 = falseVoice1;
  }
  final String? falseVoice2 = jsonConvert.convert<String>(json['falseVoice2']);
  if (falseVoice2 != null) {
    configResponseData.falseVoice2 = falseVoice2;
  }
  return configResponseData;
}

Map<String, dynamic> $ConfigResponseDataToJson(ConfigResponseData entity) {
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

extension ConfigResponseDataExtension on ConfigResponseData {
  ConfigResponseData copyWith({
    String? trueVoice1,
    int? heartbeatTime,
    String? trueVoice3,
    String? trueVoice2,
    ConfigResponseDataDeFalseVoice? deFalseVoice,
    String? configNo,
    int? writeOffDelayTime,
    int? invalidTime,
    String? equipmentNo,
    String? yccode,
    String? manufacturerId2,
    String? manufacturerId1,
    ConfigResponseDataDeTrueVoice? deTrueVoice,
    String? writeOffUrl,
    String? numUpUrl,
    String? heartbeatUrl,
    String? falseVoice3,
    int? numUpTime,
    String? falseVoice4,
    String? welcomeMsg,
    String? trueVoice4,
    String? checkUrl,
    String? falseVoice1,
    String? falseVoice2,
  }) {
    return ConfigResponseData()
      ..trueVoice1 = trueVoice1 ?? this.trueVoice1
      ..heartbeatTime = heartbeatTime ?? this.heartbeatTime
      ..trueVoice3 = trueVoice3 ?? this.trueVoice3
      ..trueVoice2 = trueVoice2 ?? this.trueVoice2
      ..deFalseVoice = deFalseVoice ?? this.deFalseVoice
      ..configNo = configNo ?? this.configNo
      ..writeOffDelayTime = writeOffDelayTime ?? this.writeOffDelayTime
      ..invalidTime = invalidTime ?? this.invalidTime
      ..equipmentNo = equipmentNo ?? this.equipmentNo
      ..yccode = yccode ?? this.yccode
      ..manufacturerId2 = manufacturerId2 ?? this.manufacturerId2
      ..manufacturerId1 = manufacturerId1 ?? this.manufacturerId1
      ..deTrueVoice = deTrueVoice ?? this.deTrueVoice
      ..writeOffUrl = writeOffUrl ?? this.writeOffUrl
      ..numUpUrl = numUpUrl ?? this.numUpUrl
      ..heartbeatUrl = heartbeatUrl ?? this.heartbeatUrl
      ..falseVoice3 = falseVoice3 ?? this.falseVoice3
      ..numUpTime = numUpTime ?? this.numUpTime
      ..falseVoice4 = falseVoice4 ?? this.falseVoice4
      ..welcomeMsg = welcomeMsg ?? this.welcomeMsg
      ..trueVoice4 = trueVoice4 ?? this.trueVoice4
      ..checkUrl = checkUrl ?? this.checkUrl
      ..falseVoice1 = falseVoice1 ?? this.falseVoice1
      ..falseVoice2 = falseVoice2 ?? this.falseVoice2;
  }
}

ConfigResponseDataDeFalseVoice $ConfigResponseDataDeFalseVoiceFromJson(
    Map<String, dynamic> json) {
  final ConfigResponseDataDeFalseVoice configResponseDataDeFalseVoice = ConfigResponseDataDeFalseVoice();
  final String? other = jsonConvert.convert<String>(json['other']);
  if (other != null) {
    configResponseDataDeFalseVoice.other = other;
  }
  final String? invalid = jsonConvert.convert<String>(json['invalid']);
  if (invalid != null) {
    configResponseDataDeFalseVoice.invalid = invalid;
  }
  final String? used = jsonConvert.convert<String>(json['used']);
  if (used != null) {
    configResponseDataDeFalseVoice.used = used;
  }
  final String? error = jsonConvert.convert<String>(json['error']);
  if (error != null) {
    configResponseDataDeFalseVoice.error = error;
  }
  return configResponseDataDeFalseVoice;
}

Map<String, dynamic> $ConfigResponseDataDeFalseVoiceToJson(
    ConfigResponseDataDeFalseVoice entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['other'] = entity.other;
  data['invalid'] = entity.invalid;
  data['used'] = entity.used;
  data['error'] = entity.error;
  return data;
}

extension ConfigResponseDataDeFalseVoiceExtension on ConfigResponseDataDeFalseVoice {
  ConfigResponseDataDeFalseVoice copyWith({
    String? other,
    String? invalid,
    String? used,
    String? error,
  }) {
    return ConfigResponseDataDeFalseVoice()
      ..other = other ?? this.other
      ..invalid = invalid ?? this.invalid
      ..used = used ?? this.used
      ..error = error ?? this.error;
  }
}

ConfigResponseDataDeTrueVoice $ConfigResponseDataDeTrueVoiceFromJson(
    Map<String, dynamic> json) {
  final ConfigResponseDataDeTrueVoice configResponseDataDeTrueVoice = ConfigResponseDataDeTrueVoice();
  final String? normal = jsonConvert.convert<String>(json['normal']);
  if (normal != null) {
    configResponseDataDeTrueVoice.normal = normal;
  }
  final String? other = jsonConvert.convert<String>(json['other']);
  if (other != null) {
    configResponseDataDeTrueVoice.other = other;
  }
  final String? yearCard1 = jsonConvert.convert<String>(json['yearCard1']);
  if (yearCard1 != null) {
    configResponseDataDeTrueVoice.yearCard1 = yearCard1;
  }
  final String? yearCard2 = jsonConvert.convert<String>(json['yearCard2']);
  if (yearCard2 != null) {
    configResponseDataDeTrueVoice.yearCard2 = yearCard2;
  }
  return configResponseDataDeTrueVoice;
}

Map<String, dynamic> $ConfigResponseDataDeTrueVoiceToJson(
    ConfigResponseDataDeTrueVoice entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['normal'] = entity.normal;
  data['other'] = entity.other;
  data['yearCard1'] = entity.yearCard1;
  data['yearCard2'] = entity.yearCard2;
  return data;
}

extension ConfigResponseDataDeTrueVoiceExtension on ConfigResponseDataDeTrueVoice {
  ConfigResponseDataDeTrueVoice copyWith({
    String? normal,
    String? other,
    String? yearCard1,
    String? yearCard2,
  }) {
    return ConfigResponseDataDeTrueVoice()
      ..normal = normal ?? this.normal
      ..other = other ?? this.other
      ..yearCard1 = yearCard1 ?? this.yearCard1
      ..yearCard2 = yearCard2 ?? this.yearCard2;
  }
}