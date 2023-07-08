import 'package:json_annotation/json_annotation.dart';
import 'package:stud_board/api_models/dpss_models.dart';
import 'package:stud_board/api_models/teacher_models.dart';

part 'sheets_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SheetsModel {
  @JsonKey(name: '_id')
  String id;
  String teacher;
  Department department;
  Program program;
  Session session;
  SectionsModel section;
  Semester semester;
  SubjectSheet subject;
  String subjectType;
  String creditHours;
  String date;

  SheetsModel({
    required this.id,
    required this.teacher,
    required this.department,
    required this.program,
    required this.session,
    required this.section,
    required this.semester,
    required this.subject,
    required this.subjectType,
    required this.creditHours,
    required this.date,
  });

  factory SheetsModel.fromJson(Map<String, dynamic> json) =>
      _$SheetsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SheetsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SubjectSheet {
  @JsonKey(name: '_id')
  String id;
  @JsonKey(name: 'subject_title')
  String subjectTitle;
  @JsonKey(name: 'subject_code')
  String subjectCode;
  @JsonKey(name: 'theory_hours')
  String theoryHours;
  @JsonKey(name: 'lab_hours')
  String labHours;
  String type;
  String department;
  String program;
  String session;
  String semester;

  SubjectSheet({
    required this.id,
    required this.subjectTitle,
    required this.type,
    required this.subjectCode,
    required this.theoryHours,
    required this.labHours,
    required this.department,
    required this.program,
    required this.session,
    required this.semester,
  });

  factory SubjectSheet.fromJson(Map<String, dynamic> json) =>
      _$SubjectSheetFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectSheetToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SheetByID {
  SheetID sheet;
  List<StudentSheets> list;

  SheetByID({
    required this.sheet,
    required this.list,
  });

  factory SheetByID.fromJson(Map<String, dynamic> json) =>
      _$SheetByIDFromJson(json);

  Map<String, dynamic> toJson() => _$SheetByIDToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SheetID {
  @JsonKey(name: '_id')
  String id;
  TeacherSheetModel teacher;
  Department department;
  Program program;
  Session session;
  Semester semester;
  SectionsModel section;
  SubjectSheet subject;
  String subjectType;
  String creditHours;
  String date;

  SheetID({
    required this.id,
    required this.teacher,
    required this.department,
    required this.program,
    required this.session,
    required this.section,
    required this.semester,
    required this.subject,
    required this.subjectType,
    required this.creditHours,
    required this.date,
  });

  factory SheetID.fromJson(Map<String, dynamic> json) =>
      _$SheetIDFromJson(json);

  Map<String, dynamic> toJson() => _$SheetIDToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ListStudent {
  List<StudentSheets> students;

  ListStudent({
    required this.students
  });

  factory ListStudent.fromJson(Map<String, dynamic> json) =>
      _$ListStudentFromJson(json);

  Map<String, dynamic> toJson() => _$ListStudentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TeacherSheetModel {
  @JsonKey(name: '_id')
  String id;
  String name;
  String email;
  String phoneNo;
  String password;

  // String avatar;
  String role;
  List<SubjectForSheet> subjects;

  TeacherSheetModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.password,
    // required this.avatar,
    required this.role,
    required this.subjects,
  });

  factory TeacherSheetModel.fromJson(Map<String, dynamic> json) =>
      _$TeacherSheetModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherSheetModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SubjectForSheet {
  String subject;
  String lab_hours;
  String theory_hours;
  @JsonKey(name: '_id')
  String id;

  SubjectForSheet({
    required this.subject,
    required this.lab_hours,
    required this.theory_hours,
    required this.id,
  });

  factory SubjectForSheet.fromJson(Map<String, dynamic> json) =>
      _$SubjectForSheetFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectForSheetToJson(this);
}
@JsonSerializable(explicitToJson: true)
class StudentSheets {
  @JsonKey(name: '_id')
  String id;
  @JsonKey(name: 'sheet')
  String sheetID;
  StudentSheetModel student;
  bool present;
  bool leave;
  String date;

  StudentSheets({
    required this.id,
    required this.sheetID,
    required this.student,
    required this.present,
    required this.leave,
    required this.date,
  });

  factory StudentSheets.fromJson(Map<String, dynamic> json) =>
      _$StudentSheetsFromJson(json);

  Map<String, dynamic> toJson() => _$StudentSheetsToJson(this);
}


@JsonSerializable(explicitToJson: true)
class StudentSheetModel {
  @JsonKey(name: '_id')
  String id;
  String department;
  String program;
  String session;
  String section;
  String name;
  String email;
  String rollNo;
  String phoneNo;
  String password;
  String role;

  StudentSheetModel({
    required this.id,
    required this.department,
    required this.program,
    required this.session,
    required this.section,
    required this.name,
    required this.email,
    required this.rollNo,
    required this.phoneNo,
    required this.password,
    required this.role,
  });

  factory StudentSheetModel.fromJson(Map<String, dynamic> json) =>
      _$StudentSheetModelFromJson(json);

  Map<String, dynamic> toJson() => _$StudentSheetModelToJson(this);
}
