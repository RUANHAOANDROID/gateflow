import 'package:gateflow/generated/json/base/json_convert_content.dart';
import 'package:gateflow/models/devices_entity.dart';

DevicesEntity $DevicesEntityFromJson(Map<String, dynamic> json) {
	final DevicesEntity devicesEntity = DevicesEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		devicesEntity.code = code;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		devicesEntity.message = message;
	}
	final List<DevicesData>? data = jsonConvert.convertListNotNull<DevicesData>(json['data']);
	if (data != null) {
		devicesEntity.data = data;
	}
	return devicesEntity;
}

Map<String, dynamic> $DevicesEntityToJson(DevicesEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['message'] = entity.message;
	data['data'] =  entity.data?.map((v) => v.toJson()).toList();
	return data;
}

DevicesData $DevicesDataFromJson(Map<String, dynamic> json) {
	final DevicesData devicesData = DevicesData();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		devicesData.id = id;
	}
	final String? deviceId = jsonConvert.convert<String>(json['deviceId']);
	if (deviceId != null) {
		devicesData.deviceId = deviceId;
	}
	final String? deviceNo = jsonConvert.convert<String>(json['deviceNo']);
	if (deviceNo != null) {
		devicesData.deviceNo = deviceNo;
	}
	final String? deviceIp = jsonConvert.convert<String>(json['deviceIp']);
	if (deviceIp != null) {
		devicesData.deviceIp = deviceIp;
	}
	final String? serialNumber = jsonConvert.convert<String>(json['serialNumber']);
	if (serialNumber != null) {
		devicesData.serialNumber = serialNumber;
	}
	final String? deviceVersion = jsonConvert.convert<String>(json['deviceVersion']);
	if (deviceVersion != null) {
		devicesData.deviceVersion = deviceVersion;
	}
	final String? deviceStatus = jsonConvert.convert<String>(json['deviceStatus']);
	if (deviceStatus != null) {
		devicesData.deviceStatus = deviceStatus;
	}
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		devicesData.status = status;
	}
	return devicesData;
}

Map<String, dynamic> $DevicesDataToJson(DevicesData entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['deviceId'] = entity.deviceId;
	data['deviceNo'] = entity.deviceNo;
	data['deviceIp'] = entity.deviceIp;
	data['serialNumber'] = entity.serialNumber;
	data['deviceVersion'] = entity.deviceVersion;
	data['deviceStatus'] = entity.deviceStatus;
	data['status'] = entity.status;
	return data;
}