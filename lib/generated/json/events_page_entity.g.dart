import 'package:gateflow/generated/json/base/json_convert_content.dart';
import 'package:gateflow/models/events_page_entity.dart';

EventsPageEntity $EventsPageEntityFromJson(Map<String, dynamic> json) {
	final EventsPageEntity eventsPageEntity = EventsPageEntity();
	final int? count = jsonConvert.convert<int>(json['count']);
	if (count != null) {
		eventsPageEntity.count = count;
	}
	final List<EventsPageData>? data = jsonConvert.convertListNotNull<EventsPageData>(json['data']);
	if (data != null) {
		eventsPageEntity.data = data;
	}
	return eventsPageEntity;
}

Map<String, dynamic> $EventsPageEntityToJson(EventsPageEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['count'] = entity.count;
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	return data;
}

EventsPageData $EventsPageDataFromJson(Map<String, dynamic> json) {
	final EventsPageData eventsPageData = EventsPageData();
	final int? id = jsonConvert.convert<int>(json['Id']);
	if (id != null) {
		eventsPageData.id = id;
	}
	final String? tag = jsonConvert.convert<String>(json['tag']);
	if (tag != null) {
		eventsPageData.tag = tag;
	}
	final String? content = jsonConvert.convert<String>(json['content']);
	if (content != null) {
		eventsPageData.content = content;
	}
	final String? deviceName = jsonConvert.convert<String>(json['deviceName']);
	if (deviceName != null) {
		eventsPageData.deviceName = deviceName;
	}
	final String? time = jsonConvert.convert<String>(json['time']);
	if (time != null) {
		eventsPageData.time = time;
	}
	return eventsPageData;
}

Map<String, dynamic> $EventsPageDataToJson(EventsPageData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['Id'] = entity.id;
	data['tag'] = entity.tag;
	data['content'] = entity.content;
	data['deviceName'] = entity.deviceName;
	data['time'] = entity.time;
	return data;
}