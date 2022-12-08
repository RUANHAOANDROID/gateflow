import 'package:gateflow/generated/json/base/json_convert_content.dart';
import 'package:gateflow/models/response_entity.dart';

ResponseEntity $ResponseEntityFromJson(Map<String, dynamic> json) {
	final ResponseEntity responseEntity = ResponseEntity();
	final int? code = jsonConvert.convert<int>(json['code']);
	if (code != null) {
		responseEntity.code = code;
	}
	final String? msg = jsonConvert.convert<String>(json['msg']);
	if (msg != null) {
		responseEntity.msg = msg;
	}
	final String? data = jsonConvert.convert<String>(json['data']);
	if (data != null) {
		responseEntity.data = data;
	}
	return responseEntity;
}

Map<String, dynamic> $ResponseEntityToJson(ResponseEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] = entity.data;
	return data;
}