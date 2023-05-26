import 'package:json_annotation/json_annotation.dart';

part 'teacher_models.g.dart';

@JsonSerializable(explicitToJson: true)
class TeacherModel {
  @JsonKey(name: '_id')
  String id;
  String name;
  String email;
  String phoneNo;

  // String avatar;
  String role;
  List<Subject> subjects;

  TeacherModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNo,
    // required this.avatar,
    required this.role,
    required this.subjects,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) =>
      _$TeacherModelFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Subject {
  SubjectDetails subject;
  String lab_hours;
  String theory_hours;
  @JsonKey(name: '_id')
  String id;

  Subject({
    required this.subject,
    required this.lab_hours,
    required this.theory_hours,
    required this.id,
  });

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SubjectDetails {
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
  Department department;
  Program program;
  Session session;
  Semester semester;

  SubjectDetails({
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

  factory SubjectDetails.fromJson(Map<String, dynamic> json) =>
      _$SubjectDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectDetailsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Department {
  Location location;
  @JsonKey(name: '_id')
  String id;

  int no_of_programs;
  String department_abbreviation;
  String department_name;

  Department({
    required this.location,
    required this.id,
    required this.no_of_programs,
    required this.department_abbreviation,
    required this.department_name,
  });

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Location {
  double lat;
  double lng;

  Location({required this.lat, required this.lng});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Program {
  @JsonKey(name: '_id')
  String id;
  String program_title;
  String program_abbreviation;
  String type;
  String starting;
  String ending;
  String department;

  Program({
    required this.id,
    required this.program_title,
    required this.program_abbreviation,
    required this.type,
    required this.starting,
    required this.ending,
    required this.department,
  });

  factory Program.fromJson(Map<String, dynamic> json) =>
      _$ProgramFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Session {
  @JsonKey(name: '_id')
  String id;
  String session_title;
  String department;
  String program;
  String type;
  String ending_year;
  String starting_year;

  Session({
    required this.id,
    required this.session_title,
    required this.department,
    required this.program,
    required this.type,
    required this.starting_year,
    required this.ending_year,
  });

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Semester {
  @JsonKey(name: '_id')
  String id;
  String semester_title;
  String type;
  String department;
  String program;
  String session;
  String starting;
  String ending;

  Semester({
    required this.id,
    required this.semester_title,
    required this.department,
    required this.program,
    required this.session,
    required this.type,
    required this.starting,
    required this.ending,
  });

  factory Semester.fromJson(Map<String, dynamic> json) =>
      _$SemesterFromJson(json);

  Map<String, dynamic> toJson() => _$SemesterToJson(this);
}
