import 'package:gateflow/generated/json/base/json_convert_content.dart';
import 'package:gateflow/models/ws_hds_entity.dart';

WsHdsEntity $WsHdsEntityFromJson(Map<String, dynamic> json) {
	final WsHdsEntity wsHdsEntity = WsHdsEntity();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		wsHdsEntity.name = name;
	}
	final String? total = jsonConvert.convert<String>(json['total']);
	if (total != null) {
		wsHdsEntity.total = total;
	}
	final String? used = jsonConvert.convert<String>(json['used']);
	if (used != null) {
		wsHdsEntity.used = used;
	}
	final String? proportion = jsonConvert.convert<String>(json['proportion']);
	if (proportion != null) {
		wsHdsEntity.proportion = proportion;
	}
	return wsHdsEntity;
}

Map<String, dynamic> $WsHdsEntityToJson(WsHdsEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['total'] = entity.total;
	data['used'] = entity.used;
	data['proportion'] = entity.proportion;
	return data;
}