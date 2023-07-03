import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  @JsonKey(name: '_id')
  String id;
  String name;
  String email;
  String phoneNo;
  String avatar;
  String role;


  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.avatar,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
