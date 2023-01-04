import 'package:gateflow/generated/json/base/json_field.dart';
import 'package:gateflow/generated/json/events_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class EventsEntity {

	@JSONField(name: "Id")
	int? id;
	String? tag;
	String? content;
	String? deviceName;
	String? time;
  
  EventsEntity();

  factory EventsEntity.fromJson(Map<String, dynamic> json) => $EventsEntityFromJson(json);

  Map<String, dynamic> toJson() => $EventsEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}