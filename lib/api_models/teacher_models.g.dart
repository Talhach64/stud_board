// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeacherModel _$TeacherModelFromJson(Map<String, dynamic> json) => TeacherModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNo: json['phoneNo'] as String,
      role: json['role'] as String,
      subjects: (json['subjects'] as List<dynamic>)
          .map((e) => Subject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TeacherModelToJson(TeacherModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNo': instance.phoneNo,
      'role': instance.role,
      'subjects': instance.subjects.map((e) => e.toJson()).toList(),
    };

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
      subject: SubjectDetails.fromJson(json['subject'] as Map<String, dynamic>),
      lab_hours: json['lab_hours'] as String,
      theory_hours: json['theory_hours'] as String,
      id: json['_id'] as String,
    );

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'subject': instance.subject.toJson(),
      'lab_hours': instance.lab_hours,
      'theory_hours': instance.theory_hours,
      '_id': instance.id,
    };

SubjectForSheet _$SubjectForSheetFromJson(Map<String, dynamic> json) =>
    SubjectForSheet(
      subject: json['subject'] as String,
      lab_hours: json['lab_hours'] as String,
      theory_hours: json['theory_hours'] as String,
      id: json['_id'] as String,
    );

Map<String, dynamic> _$SubjectForSheetToJson(SubjectForSheet instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'lab_hours': instance.lab_hours,
      'theory_hours': instance.theory_hours,
      '_id': instance.id,
    };

SubjectDetails _$SubjectDetailsFromJson(Map<String, dynamic> json) =>
    SubjectDetails(
      id: json['_id'] as String,
      subjectTitle: json['subject_title'] as String,
      type: json['type'] as String,
      subjectCode: json['subject_code'] as String,
      theoryHours: json['theory_hours'] as String,
      labHours: json['lab_hours'] as String,
      department:
          Department.fromJson(json['department'] as Map<String, dynamic>),
      program: Program.fromJson(json['program'] as Map<String, dynamic>),
      session: Session.fromJson(json['session'] as Map<String, dynamic>),
      semester: Semester.fromJson(json['semester'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubjectDetailsToJson(SubjectDetails instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'subject_title': instance.subjectTitle,
      'subject_code': instance.subjectCode,
      'theory_hours': instance.theoryHours,
      'lab_hours': instance.labHours,
      'type': instance.type,
      'department': instance.department.toJson(),
      'program': instance.program.toJson(),
      'session': instance.session.toJson(),
      'semester': instance.semester.toJson(),
    };

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      id: json['_id'] as String,
      no_of_programs: json['no_of_programs'] as int,
      department_abbreviation: json['department_abbreviation'] as String,
      department_name: json['department_name'] as String,
    );

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'location': instance.location.toJson(),
      '_id': instance.id,
      'no_of_programs': instance.no_of_programs,
      'department_abbreviation': instance.department_abbreviation,
      'department_name': instance.department_name,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

Program _$ProgramFromJson(Map<String, dynamic> json) => Program(
      id: json['_id'] as String,
      program_title: json['program_title'] as String,
      program_abbreviation: json['program_abbreviation'] as String,
      type: json['type'] as String,
      starting: json['starting'] as String,
      ending: json['ending'] as String,
      department: json['department'] as String,
    );

Map<String, dynamic> _$ProgramToJson(Program instance) => <String, dynamic>{
      '_id': instance.id,
      'program_title': instance.program_title,
      'program_abbreviation': instance.program_abbreviation,
      'type': instance.type,
      'starting': instance.starting,
      'ending': instance.ending,
      'department': instance.department,
    };

Session _$SessionFromJson(Map<String, dynamic> json) => Session(
      id: json['_id'] as String,
      session_title: json['session_title'] as String,
      department: json['department'] as String,
      program: json['program'] as String,
      type: json['type'] as String,
      starting_year: json['starting_year'] as String,
      ending_year: json['ending_year'] as String,
    );

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      '_id': instance.id,
      'department': instance.department,
      'program': instance.program,
      'type': instance.type,
      'ending_year': instance.ending_year,
      'starting_year': instance.starting_year,
      'session_title': instance.session_title,
    };

Semester _$SemesterFromJson(Map<String, dynamic> json) => Semester(
      id: json['_id'] as String,
      semester_title: json['semester_title'] as String,
      department: json['department'] as String,
      program: json['program'] as String,
      session: json['session'] as String,
      type: json['type'] as String,
      starting: json['starting'] as String,
      ending: json['ending'] as String,
    );

Map<String, dynamic> _$SemesterToJson(Semester instance) => <String, dynamic>{
      '_id': instance.id,
      'semester_title': instance.semester_title,
      'type': instance.type,
      'department': instance.department,
      'program': instance.program,
      'session': instance.session,
      'starting': instance.starting,
      'ending': instance.ending,
    };
