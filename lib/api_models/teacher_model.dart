import 'package:json_annotation/json_annotation.dart';

part 'teacher_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TeacherModel {
  @JsonKey(name: '_id')
  String id;
  String name;
  String email;
  String phoneNo;
  String role;

  TeacherModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.role,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) =>
      _$TeacherModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherModelToJson(this);
}




// @JsonSerializable(explicitToJson: true)
// class TeacherModel {
//   @JsonKey(name: '_id')
//   String id;
//   String name;
//   String email;
//   String phoneNo;
//   String avatar;
//   String role;
//   List<Subject> subjects;
//   DateTime createdAt;
//   DateTime updatedAt;
//
//   TeacherModel({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.phoneNo,
//     required this.avatar,
//     required this.role,
//     required this.subjects,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory TeacherModel.fromJson(Map<String, dynamic> json) =>
//       _$TeacherModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$TeacherModelToJson(this);
// }
//
// @JsonSerializable(explicitToJson: true)
// class Subject {
//   SubjectDetails subject;
//   String lab_hours;
//   String theory_hours;
//   String id;
//
//   Subject({
//     required this.subject,
//     required this.lab_hours,
//     required this.theory_hours,
//     required this.id,
//   });
//
//   factory Subject.fromJson(Map<String, dynamic> json) =>
//       _$SubjectFromJson(json);
//
//   Map<String, dynamic> toJson() => _$SubjectToJson(this);
// }
//
// @JsonSerializable(explicitToJson: true)
// class SubjectDetails {
//   @JsonKey(name: '_id')
//   String id;
//   String subject_title;
//   String type;
//   String subject_code;
//   String theory_hours;
//   String lab_hours;
//   Department department;
//   Program program;
//   Session session;
//   Semester semester;
//   List<dynamic> change_history;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int __v;
//
//   SubjectDetails({
//     required this.id,
//     required this.subject_title,
//     required this.type,
//     required this.subject_code,
//     required this.theory_hours,
//     required this.lab_hours,
//     required this.department,
//     required this.program,
//     required this.session,
//     required this.semester,
//     required this.change_history,
//     required this.createdAt,
//     required this.updatedAt,
//
//   });
//
//   factory SubjectDetails.fromJson(Map<String, dynamic> json) =>
//       _$SubjectDetailsFromJson(json);
//
//   Map<String, dynamic> toJson() => _$SubjectDetailsToJson(this);
// }
//
// @JsonSerializable(explicitToJson: true)
// class Department {
//   Location location;
//   List<dynamic> change_history;
//   @JsonKey(name: '_id')
//   String id;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int no_of_programs;
//   String department_abbreviation;
//   String department_name;
//
//   Department({
//     required this.location,
//     required this.change_history,
//     required this.id,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.no_of_programs,
//     required this.department_abbreviation,
//     required this.department_name,
//   });
//
//   factory Department.fromJson(Map<String, dynamic> json) =>
//       _$DepartmentFromJson(json);
//
//   Map<String, dynamic> toJson() => _$DepartmentToJson(this);
// }
//
// @JsonSerializable(explicitToJson: true)
// class Location {
//   double lat;
//   double lng;
//
//   Location({required this.lat, required this.lng});
//
//   factory Location.fromJson(Map<String, dynamic> json) =>
//       _$LocationFromJson(json);
//
//   Map<String, dynamic> toJson() => _$LocationToJson(this);
// }
//
// @JsonSerializable(explicitToJson: true)
// class Program {
//   @JsonKey(name: '_id')
//   String id;
//   String program_title;
//   String program_abbreviation;
//   String type;
//   DateTime starting;
//   DateTime ending;
//   String department;
//   List<dynamic> change_history;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int __v;
//
//   Program({
//     required this.id,
//     required this.program_title,
//     required this.program_abbreviation,
//     required this.type,
//     required this.starting,
//     required this.ending,
//     required this.department,
//     required this.change_history,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.__v,
//   });
//
//   factory Program.fromJson(Map<String, dynamic> json) =>
//       _$ProgramFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ProgramToJson(this);
// }
//
// @JsonSerializable(explicitToJson: true)
// class Session {
//   @JsonKey(name: '_id')
//   String id;
//   String session_title;
//   String session_code;
//   DateTime starting;
//   DateTime ending;
//   List<dynamic> change_history;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int __v;
//
//   Session({
//     required this.id,
//     required this.session_title,
//     required this.session_code,
//     required this.starting,
//     required this.ending,
//     required this.change_history,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.__v,
//   });
//
//   factory Session.fromJson(Map<String, dynamic> json) =>
//       _$SessionFromJson(json);
//
//   Map<String, dynamic> toJson() => _$SessionToJson(this);
// }
//
// @JsonSerializable(explicitToJson: true)
// class Semester {
//   @JsonKey(name: '_id')
//   String id;
//   String semester_title;
//   String semester_code;
//   DateTime starting;
//   DateTime ending;
//   List<dynamic> change_history;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int __v;
//
//   Semester({
//     required this.id,
//     required this.semester_title,
//     required this.semester_code,
//     required this.starting,
//     required this.ending,
//     required this.change_history,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.__v,
//   });
//
//   factory Semester.fromJson(Map<String, dynamic> json) =>
//       _$SemesterFromJson(json);
//
//   Map<String, dynamic> toJson() => _$SemesterToJson(this);
// }
