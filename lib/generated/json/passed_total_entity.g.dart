import 'package:gateflow/generated/json/base/json_convert_content.dart';
import 'package:gateflow/models/passed_total_entity.dart';

PassedTotalEntity $PassedTotalEntityFromJson(Map<String, dynamic> json) {
	final PassedTotalEntity passedTotalEntity = PassedTotalEntity();
	final int? sum = jsonConvert.convert<int>(json['sum']);
	if (sum != null) {
		passedTotalEntity.sum = sum;
	}
	final List<PassedTotalDeviceTotals>? deviceTotals = jsonConvert.convertListNotNull<PassedTotalDeviceTotals>(json['deviceTotals']);
	if (deviceTotals != null) {
		passedTotalEntity.deviceTotals = deviceTotals;
	}
	return passedTotalEntity;
}

Map<String, dynamic> $PassedTotalEntityToJson(PassedTotalEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['sum'] = entity.sum;
	data['deviceTotals'] =  entity.deviceTotals?.map((v) => v.toJson()).toList();
	return data;
}

PassedTotalDeviceTotals $PassedTotalDeviceTotalsFromJson(Map<String, dynamic> json) {
	final PassedTotalDeviceTotals passedTotalDeviceTotals = PassedTotalDeviceTotals();
	final String? date = jsonConvert.convert<String>(json['date']);
	if (date != null) {
		passedTotalDeviceTotals.date = date;
	}
	final String? deviceTag = jsonConvert.convert<String>(json['deviceTag']);
	if (deviceTag != null) {
		passedTotalDeviceTotals.deviceTag = deviceTag;
	}
	final String? deviceId = jsonConvert.convert<String>(json['deviceId']);
	if (deviceId != null) {
		passedTotalDeviceTotals.deviceId = deviceId;
	}
	final int? deviceSum = jsonConvert.convert<int>(json['device_sum']);
	if (deviceSum != null) {
		passedTotalDeviceTotals.deviceSum = deviceSum;
	}
	final double? proportion = jsonConvert.convert<double>(json['proportion']);
	if (proportion != null) {
		passedTotalDeviceTotals.proportion = proportion;
	}
	return passedTotalDeviceTotals;
}

Map<String, dynamic> $PassedTotalDeviceTotalsToJson(PassedTotalDeviceTotals entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['date'] = entity.date;
	data['deviceTag'] = entity.deviceTag;
	data['deviceId'] = entity.deviceId;
	data['device_sum'] = entity.deviceSum;
	data['proportion'] = entity.proportion;
	return data;
}