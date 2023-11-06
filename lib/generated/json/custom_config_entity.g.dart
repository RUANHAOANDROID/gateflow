import 'package:gateflow/generated/json/base/json_convert_content.dart';
import 'package:gateflow/models/custom_config_entity.dart';

import '../../models/config_response_entity.dart';


CustomConfigEntity $CustomConfigEntityFromJson(Map<String, dynamic> json) {
  final CustomConfigEntity customConfigEntity = CustomConfigEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    customConfigEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    customConfigEntity.msg = msg;
  }
  final CustomConfigData? data = jsonConvert.convert<CustomConfigData>(
      json['data']);
  if (data != null) {
    customConfigEntity.data = data;
  }
  return customConfigEntity;
}

Map<String, dynamic> $CustomConfigEntityToJson(CustomConfigEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.toJson();
  return data;
}

extension CustomConfigEntityExtension on CustomConfigEntity {
  CustomConfigEntity copyWith({
    int? code,
    String? msg,
    CustomConfigData? data,
  }) {
    return CustomConfigEntity()
      ..code = code ?? this.code
      ..msg = msg ?? this.msg
      ..data = data ?? this.data;
  }
}

CustomConfigData $CustomConfigDataFromJson(Map<String, dynamic> json) {
  final CustomConfigData customConfigData = CustomConfigData();
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    customConfigData.url = url;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    customConfigData.code = code;
  }
  final ConfigResponseData? config = jsonConvert.convert<ConfigResponseData>(
      json['config']);
  if (config != null) {
    customConfigData.config = config;
  }
  return customConfigData;
}

Map<String, dynamic> $CustomConfigDataToJson(CustomConfigData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['url'] = entity.url;
  data['code'] = entity.code;
  data['config'] = entity.config?.toJson();
  return data;
}

extension CustomConfigDataExtension on CustomConfigData {
  CustomConfigData copyWith({
    String? url,
    String? code,
    ConfigResponseData? config,
  }) {
    return CustomConfigData()
      ..url = url ?? this.url
      ..code = code ?? this.code
      ..config = config ?? this.config;
  }
}

CustomConfigDataConfigDeFalseVoice $CustomConfigDataConfigDeFalseVoiceFromJson(
    Map<String, dynamic> json) {
  final CustomConfigDataConfigDeFalseVoice customConfigDataConfigDeFalseVoice = CustomConfigDataConfigDeFalseVoice();
  final String? other = jsonConvert.convert<String>(json['other']);
  if (other != null) {
    customConfigDataConfigDeFalseVoice.other = other;
  }
  final String? invalid = jsonConvert.convert<String>(json['invalid']);
  if (invalid != null) {
    customConfigDataConfigDeFalseVoice.invalid = invalid;
  }
  final String? used = jsonConvert.convert<String>(json['used']);
  if (used != null) {
    customConfigDataConfigDeFalseVoice.used = used;
  }
  final String? error = jsonConvert.convert<String>(json['error']);
  if (error != null) {
    customConfigDataConfigDeFalseVoice.error = error;
  }
  return customConfigDataConfigDeFalseVoice;
}

Map<String, dynamic> $CustomConfigDataConfigDeFalseVoiceToJson(
    CustomConfigDataConfigDeFalseVoice entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['other'] = entity.other;
  data['invalid'] = entity.invalid;
  data['used'] = entity.used;
  data['error'] = entity.error;
  return data;
}

extension CustomConfigDataConfigDeFalseVoiceExtension on CustomConfigDataConfigDeFalseVoice {
  CustomConfigDataConfigDeFalseVoice copyWith({
    String? other,
    String? invalid,
    String? used,
    String? error,
  }) {
    return CustomConfigDataConfigDeFalseVoice()
      ..other = other ?? this.other
      ..invalid = invalid ?? this.invalid
      ..used = used ?? this.used
      ..error = error ?? this.error;
  }
}

CustomConfigDataConfigDeTrueVoice $CustomConfigDataConfigDeTrueVoiceFromJson(
    Map<String, dynamic> json) {
  final CustomConfigDataConfigDeTrueVoice customConfigDataConfigDeTrueVoice = CustomConfigDataConfigDeTrueVoice();
  final String? normal = jsonConvert.convert<String>(json['normal']);
  if (normal != null) {
    customConfigDataConfigDeTrueVoice.normal = normal;
  }
  final String? other = jsonConvert.convert<String>(json['other']);
  if (other != null) {
    customConfigDataConfigDeTrueVoice.other = other;
  }
  final String? yearCard1 = jsonConvert.convert<String>(json['yearCard1']);
  if (yearCard1 != null) {
    customConfigDataConfigDeTrueVoice.yearCard1 = yearCard1;
  }
  final String? yearCard2 = jsonConvert.convert<String>(json['yearCard2']);
  if (yearCard2 != null) {
    customConfigDataConfigDeTrueVoice.yearCard2 = yearCard2;
  }
  return customConfigDataConfigDeTrueVoice;
}

Map<String, dynamic> $CustomConfigDataConfigDeTrueVoiceToJson(
    CustomConfigDataConfigDeTrueVoice entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['normal'] = entity.normal;
  data['other'] = entity.other;
  data['yearCard1'] = entity.yearCard1;
  data['yearCard2'] = entity.yearCard2;
  return data;
}

extension CustomConfigDataConfigDeTrueVoiceExtension on CustomConfigDataConfigDeTrueVoice {
  CustomConfigDataConfigDeTrueVoice copyWith({
    String? normal,
    String? other,
    String? yearCard1,
    String? yearCard2,
  }) {
    return CustomConfigDataConfigDeTrueVoice()
      ..normal = normal ?? this.normal
      ..other = other ?? this.other
      ..yearCard1 = yearCard1 ?? this.yearCard1
      ..yearCard2 = yearCard2 ?? this.yearCard2;
  }
}