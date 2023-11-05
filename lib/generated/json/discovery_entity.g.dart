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
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    discoveryData.name = name;
  }
  final String? sn = jsonConvert.convert<String>(json['sn']);
  if (sn != null) {
    discoveryData.sn = sn;
  }
  final String? ip = jsonConvert.convert<String>(json['ip']);
  if (ip != null) {
    discoveryData.ip = ip;
  }
  final String? added = jsonConvert.convert<String>(json['added']);
  if (added != null) {
    discoveryData.added = added;
  }
  return discoveryData;
}

Map<String, dynamic> $DiscoveryDataToJson(DiscoveryData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['sn'] = entity.sn;
  data['ip'] = entity.ip;
  data['added'] = entity.added;
  return data;
}

extension DiscoveryDataExtension on DiscoveryData {
  DiscoveryData copyWith({
    String? name,
    String? sn,
    String? ip,
    String? added,
  }) {
    return DiscoveryData()
      ..name = name ?? this.name
      ..sn = sn ?? this.sn
      ..ip = ip ?? this.ip
      ..added = added ?? this.added;
  }
}