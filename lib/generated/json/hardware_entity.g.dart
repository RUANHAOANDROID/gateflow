import 'package:gateflow/generated/json/base/json_convert_content.dart';
import 'package:gateflow/models/hardware_entity.dart';

HardwareEntity $HardwareEntityFromJson(Map<String, dynamic> json) {
  final HardwareEntity hardwareEntity = HardwareEntity();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    hardwareEntity.name = name;
  }
  final String? total = jsonConvert.convert<String>(json['total']);
  if (total != null) {
    hardwareEntity.total = total;
  }
  final String? used = jsonConvert.convert<String>(json['used']);
  if (used != null) {
    hardwareEntity.used = used;
  }
  final String? proportion = jsonConvert.convert<String>(json['proportion']);
  if (proportion != null) {
    hardwareEntity.proportion = proportion;
  }
  return hardwareEntity;
}

Map<String, dynamic> $HardwareEntityToJson(HardwareEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['total'] = entity.total;
  data['used'] = entity.used;
  data['proportion'] = entity.proportion;
  return data;
}
