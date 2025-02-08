import 'package:gateflow/generated/json/base/json_convert_content.dart';
import 'package:gateflow/models/discovery_entity.dart';

DiscoveryEntity $DiscoveryEntityFromJson(Map<String, dynamic> json) {
  final DiscoveryEntity discoveryEntity = DiscoveryEntity();
  final int? code = jsonConvert.convert<int>(json['code']);
  if (code != null) {
    discoveryEntity.code = code;
  }
  final String? msg = jsonConvert.convert<String>(json['msg']);
  if (msg != null) {
    discoveryEntity.msg = msg;
  }
  final List<DiscoveryData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<DiscoveryData>(e) as DiscoveryData)
      .toList();
  if (data != null) {
    discoveryEntity.data = data;
  }
  return discoveryEntity;
}

Map<String, dynamic> $DiscoveryEntityToJson(DiscoveryEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['code'] = entity.code;
  data['msg'] = entity.msg;
  data['data'] = entity.data.map((v) => v.toJson()).toList();
  return data;
}

extension DiscoveryEntityExtension on DiscoveryEntity {
  DiscoveryEntity copyWith({
    int? code,
    String? msg,
    List<DiscoveryData>? data,
  }) {
    return DiscoveryEntity()
      ..code = code ?? this.code
      ..msg = msg ?? this.msg
      ..data = data ?? this.data;
  }
}

DiscoveryData $DiscoveryDataFromJson(Map<String, dynamic> json) {
  final DiscoveryData discoveryData = DiscoveryData();
  final String? device_name = jsonConvert.convert<String>(json['device_name']);
  if (device_name != null) {
    discoveryData.device_name = device_name;
  }
  final String? device_sn = jsonConvert.convert<String>(json['device_sn']);
  if (device_sn != null) {
    discoveryData.device_sn = device_sn;
  }
  final String? device_ip = jsonConvert.convert<String>(json['device_ip']);
  if (device_ip != null) {
    discoveryData.device_ip = device_ip;
  }
  final String? device_type = jsonConvert.convert<String>(json['device_type']);
  if (device_type != null) {
    discoveryData.device_type = device_type;
  }
  final String? added = jsonConvert.convert<String>(json['added']);
  if (added != null) {
    discoveryData.added = added;
  }
  return discoveryData;
}

Map<String, dynamic> $DiscoveryDataToJson(DiscoveryData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['device_name'] = entity.device_name;
  data['device_sn'] = entity.device_sn;
  data['device_ip'] = entity.device_ip;
  data['device_type'] = entity.device_type;
  data['added'] = entity.added;
  return data;
}

extension DiscoveryDataExtension on DiscoveryData {
  DiscoveryData copyWith({
    String? device_name,
    String? device_sn,
    String? device_ip,
    String? device_type,
    String? added,
  }) {
    return DiscoveryData()
      ..device_name = device_name ?? this.device_name
      ..device_sn = device_sn ?? this.device_sn
      ..device_ip = device_ip ?? this.device_ip
      ..device_type = device_type ?? this.device_type
      ..added = added ?? this.added;
  }
}