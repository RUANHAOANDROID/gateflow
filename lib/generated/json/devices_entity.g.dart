import 'package:gateflow/generated/json/base/json_convert_content.dart';
import 'package:gateflow/models/devices_entity.dart';

DevicesEntity $DevicesEntityFromJson(Map<String, dynamic> json) {
  final DevicesEntity devicesEntity = DevicesEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    devicesEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    devicesEntity.msg = msg;
  }
  final List<DevicesData>? data = (json['data'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<DevicesData>(e) as DevicesData).toList();
  if (data != null) {
    devicesEntity.data = data;
  }
  return devicesEntity;
}

Map<String, dynamic> $DevicesEntityToJson(DevicesEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension DevicesEntityExtension on DevicesEntity {
  DevicesEntity copyWith({
    int? code,
    String? msg,
    List<DevicesData>? data,
  }) {
    return DevicesEntity()
      ..code = code ?? this.code
      ..msg = msg ?? this.msg
      ..data = data ?? this.data;
  }
}

DevicesData $DevicesDataFromJson(Map<String, dynamic> json) {
  final DevicesData devicesData = DevicesData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    devicesData.id = id;
  }
  final String? tag = jsonConvert.convert<String>(json['tag']);
  if (tag != null) {
    devicesData.tag = tag;
  }
  final String? ip = jsonConvert.convert<String>(json['ip']);
  if (ip != null) {
    devicesData.ip = ip;
  }
  final String? sn = jsonConvert.convert<String>(json['sn']);
  if (sn != null) {
    devicesData.sn = sn;
  }
  final String? version = jsonConvert.convert<String>(json['version']);
  if (version != null) {
    devicesData.version = version;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    devicesData.status = status;
  }
  final String? addTime = jsonConvert.convert<String>(json['addTime']);
  if (addTime != null) {
    devicesData.addTime = addTime;
  }
  final String? updateTime = jsonConvert.convert<String>(json['updateTime']);
  if (updateTime != null) {
    devicesData.updateTime = updateTime;
  }
  return devicesData;
}

Map<String, dynamic> $DevicesDataToJson(DevicesData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['tag'] = entity.tag;
  data['ip'] = entity.ip;
  data['sn'] = entity.sn;
  data['version'] = entity.version;
  data['status'] = entity.status;
  data['addTime'] = entity.addTime;
  data['updateTime'] = entity.updateTime;
  return data;
}

extension DevicesDataExtension on DevicesData {
  DevicesData copyWith({
    int? id,
    String? tag,
    String? ip,
    String? sn,
    String? version,
    String? status,
    String? addTime,
    String? updateTime,
  }) {
    return DevicesData()
      ..id = id ?? this.id
      ..tag = tag ?? this.tag
      ..ip = ip ?? this.ip
      ..sn = sn ?? this.sn
      ..version = version ?? this.version
      ..status = status ?? this.status
      ..addTime = addTime ?? this.addTime
      ..updateTime = updateTime ?? this.updateTime;
  }
}