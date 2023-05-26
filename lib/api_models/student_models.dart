import 'package:json_annotation/json_annotation.dart';
import 'package:stud_board/api_models/teacher_models.dart';

part 'student_models.g.dart';

@JsonSerializable(explicitToJson: true)
class StudentModel {
  @JsonKey(name: '_id')
  String id;
  String department;
  Program program;
  Session session;
  String section;
  String name;
  String email;
  String rollNo;
  String phoneNo;
  String role;

  StudentModel({
    required this.id,
    required this.department,
    required this.program,
    required this.session,
    required this.section,
    required this.name,
    required this.email,
    required this.rollNo,
    required this.phoneNo,
    required this.role,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentModelFromJson(json);

  Map<String, dynamic> toJson() => _$StudentModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RegisterStudentModel {
  String? name;
  String? email;
  String? department;
  String? program;
  String? session;
  String? section;
  String? rollNo;
  String? phoneNo;
  String? password;
  String? gender;

  RegisterStudentModel({
    required this.department,
    required this.program,
    required this.session,
    required this.section,
    required this.name,
    required this.email,
    required this.rollNo,
    required this.phoneNo,
    required this.password,
     this.gender,
  });

  factory RegisterStudentModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterStudentModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterStudentModelToJson(this);
}
