

import 'package:json_annotation/json_annotation.dart';
part 'login_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginModel {

  // @JsonKey(name : '_id')
  String email;
  String password;

  LoginModel({required this.email, required this.password});

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}