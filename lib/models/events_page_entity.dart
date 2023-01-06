import 'package:gateflow/generated/json/base/json_field.dart';
import 'package:gateflow/generated/json/events_page_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class EventsPageEntity {

	int count=0;
	List<EventsPageData>? data;
  
  EventsPageEntity();

  factory EventsPageEntity.fromJson(Map<String, dynamic> json) => $EventsPageEntityFromJson(json);

  Map<String, dynamic> toJson() => $EventsPageEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class EventsPageData {

	@JSONField(name: "Id")
	int? id;
	String? tag;
	String? content;
	String? deviceName;
	String? time;
  
  EventsPageData();

  factory EventsPageData.fromJson(Map<String, dynamic> json) => $EventsPageDataFromJson(json);

  Map<String, dynamic> toJson() => $EventsPageDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}