import 'package:json_annotation/json_annotation.dart';

part 'attendance_models.g.dart';

@JsonSerializable(explicitToJson: true)
class AttendanceStudentDataModel {
  @JsonKey(name: '_id')
  String id;
  String? name;
  String? rollNo;
  bool present;
  bool leave;

  AttendanceStudentDataModel({
    required this.id,
    this.name,
    this.rollNo,
    required this.present,
    required this.leave,
  });

  factory AttendanceStudentDataModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceStudentDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceStudentDataModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AttendanceStudentsModel {
  String teacher;
  String department;
  String program;
  String session;
  String semester;
  String? section;
  String subject;
  String? subjectType;
  String? creditHours;
  DateTime date;
  List<AttendanceStudent> list;

  AttendanceStudentsModel({
    required this.teacher,
    required this.department,
    required this.program,
    required this.session,
    required this.semester,
    required this.section,
    required this.subject,
     this.subjectType,
     this.creditHours,
    required this.date,
     required this.list,
  });

  factory AttendanceStudentsModel.fromJson(Map<String, dynamic> json) =>
      _$AttendanceStudentsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceStudentsModelToJson(this);
}

@JsonSerializable()
class AttendanceStudent {
  String student;
  bool present;
  bool leave;

  AttendanceStudent({
    required this.student,
    required this.present,
    required this.leave,
  });

  factory AttendanceStudent.fromJson(Map<String, dynamic> json) =>
      _$AttendanceStudentFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceStudentToJson(this);
}
