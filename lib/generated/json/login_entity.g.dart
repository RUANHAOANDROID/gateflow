import 'package:gateflow/generated/json/base/json_convert_content.dart';
import 'package:gateflow/models/login_entity.dart';

LoginEntity $LoginEntityFromJson(Map<String, dynamic> json) {
	final LoginEntity loginEntity = LoginEntity();
	final String? userName = jsonConvert.convert<String>(json['userName']);
	if (userName != null) {
		loginEntity.userName = userName;
	}
	final String? passWord = jsonConvert.convert<String>(json['passWord']);
	if (passWord != null) {
		loginEntity.passWord = passWord;
	}
	return loginEntity;
}

Map<String, dynamic> $LoginEntityToJson(LoginEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['userName'] = entity.userName;
	data['passWord'] = entity.passWord;
	return data;
}