import 'package:gateflow/generated/json/base/json_field.dart';
import 'package:gateflow/generated/json/passed_total_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class PassedTotalEntity {

	int? sum;
	List<PassedTotalDeviceTotals>? deviceTotals;
  
  PassedTotalEntity();

  factory PassedTotalEntity.fromJson(Map<String, dynamic> json) => $PassedTotalEntityFromJson(json);

  Map<String, dynamic> toJson() => $PassedTotalEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
@JsonSerializable()
class PassedTotalDeviceTotals {

	String? date;
	String? deviceTag;
	String? deviceId;
	@JSONField(name: "device_sum")
	int? deviceSum;
	double? proportion;
  
  PassedTotalDeviceTotals();

  factory PassedTotalDeviceTotals.fromJson(Map<String, dynamic> json) => $PassedTotalDeviceTotalsFromJson(json);

  Map<String, dynamic> toJson() => $PassedTotalDeviceTotalsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}