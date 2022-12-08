import 'package:gateflow/generated/json/base/json_field.dart';
import 'package:gateflow/generated/json/login_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class LoginEntity {

	String? userName;
	String? passWord;
  
  LoginEntity();

  factory LoginEntity.fromJson(Map<String, dynamic> json) => $LoginEntityFromJson(json);

  Map<String, dynamic> toJson() => $LoginEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}