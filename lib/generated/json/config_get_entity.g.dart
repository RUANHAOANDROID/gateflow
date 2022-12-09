import 'package:gateflow/generated/json/base/json_convert_content.dart';
import 'package:gateflow/models/config_get_entity.dart';

ConfigGetEntity $ConfigGetEntityFromJson(Map<String, dynamic> json) {
	final ConfigGetEntity configGetEntity = ConfigGetEntity();
	final String? configUrl = jsonConvert.convert<String>(json['configUrl']);
	if (configUrl != null) {
		configGetEntity.configUrl = configUrl;
	}
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		configGetEntity.id = id;
	}
	return configGetEntity;
}

Map<String, dynamic> $ConfigGetEntityToJson(ConfigGetEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['configUrl'] = entity.configUrl;
	data['id'] = entity.id;
	return data;
}