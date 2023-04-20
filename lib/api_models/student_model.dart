import 'package:json_annotation/json_annotation.dart';


part 'student_model.g.dart';

@JsonSerializable(explicitToJson: true)
class StudentModel {

  @JsonKey(name: '_id')
  String? id;
  String name;
  String email;
  String section;
  String department;
  String session;
  String program;
  String rollNo;
  String phoneNo;
  String avatar;
  String role;


  StudentModel(
      {required this.id,
        required this.department,
        required this.program,
        required this.session,
        required this.section,
        required this.name,
        required this.email,
        required this.rollNo,
        required this.phoneNo,
        required this.avatar,
        required this.role,

        });

  factory StudentModel.fromJson(Map<String, dynamic> json) =>
      _$StudentModelFromJson(json);

  Map<String, dynamic> toJson() => _$StudentModelToJson(this);
}