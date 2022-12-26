import 'package:gateflow/generated/json/base/json_convert_content.dart';
import 'package:gateflow/models/events_entity.dart';

EventsEntity $EventsEntityFromJson(Map<String, dynamic> json) {
	final EventsEntity eventsEntity = EventsEntity();
	final int? id = jsonConvert.convert<int>(json['Id']);
	if (id != null) {
		eventsEntity.id = id;
	}
	final String? tag = jsonConvert.convert<String>(json['tag']);
	if (tag != null) {
		eventsEntity.tag = tag;
	}
	final String? content = jsonConvert.convert<String>(json['content']);
	if (content != null) {
		eventsEntity.content = content;
	}
	final String? time = jsonConvert.convert<String>(json['time']);
	if (time != null) {
		eventsEntity.time = time;
	}
	return eventsEntity;
}

Map<String, dynamic> $EventsEntityToJson(EventsEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['Id'] = entity.id;
	data['tag'] = entity.tag;
	data['content'] = entity.content;
	data['time'] = entity.time;
	return data;
}