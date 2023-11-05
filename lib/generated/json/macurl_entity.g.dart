import 'package:gateflow/generated/json/base/json_convert_content.dart';
import 'package:gateflow/models/macurl_entity.dart';

MacurlEntity $MacurlEntityFromJson(Map<String, dynamic> json) {
  final MacurlEntity macurlEntity = MacurlEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    macurlEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    macurlEntity.msg = msg;
  }
  final MacurlData? data = jsonConvert.convert<MacurlData>(json['data']);
  if (data != null) {
    macurlEntity.data = data;
  }
  return macurlEntity;
}

Map<String, dynamic> $MacurlEntityToJson(MacurlEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.toJson();
  return data;
}

extension MacurlEntityExtension on MacurlEntity {
  MacurlEntity copyWith({
    int? code,
    String? msg,
    MacurlData? data,
  }) {
    return MacurlEntity()
      ..code = code ?? this.code
      ..msg = msg ?? this.msg
      ..data = data ?? this.data;
  }
}

MacurlData $MacurlDataFromJson(Map<String, dynamic> json) {
  final MacurlData macurlData = MacurlData();
  final String? mac = jsonConvert.convert<String>(json['mac']);
  if (mac != null) {
    macurlData.mac = mac;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    macurlData.url = url;
  }
  return macurlData;
}

Map<String, dynamic> $MacurlDataToJson(MacurlData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['mac'] = entity.mac;
  data['url'] = entity.url;
  return data;
}

extension MacurlDataExtension on MacurlData {
  MacurlData copyWith({
    String? mac,
    String? url,
  }) {
    return MacurlData()
      ..mac = mac ?? this.mac
      ..url = url ?? this.url;
  }
}