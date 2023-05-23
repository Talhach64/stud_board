import 'package:json_annotation/json_annotation.dart';

part 'student_model.g.dart';

@JsonSerializable(explicitToJson: true)
class StudentModel {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? email;
  String? section;
  String? department;
  String? session;
  String? program;
  String? rollNo;
  String? phoneNo;
  String? password;
  String? role;

  StudentModel({
    this.id,
    this.department,
    this.program,
    this.session,
    this.section,
    this.name,
    this.email,
    this.rollNo,
    this.phoneNo,
    this.password,
    this.role,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentModelFromJson(json);

  Map<String, dynamic> toJson() => _$StudentModelToJson(this);
}
