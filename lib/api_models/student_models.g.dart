// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentModel _$StudentModelFromJson(Map<String, dynamic> json) => StudentModel(
      id: json['_id'] as String,
      department: json['department'] as String,
      program: Program.fromJson(json['program'] as Map<String, dynamic>),
      session: Session.fromJson(json['session'] as Map<String, dynamic>),
      section: json['section'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      rollNo: json['rollNo'] as String,
      phoneNo: json['phoneNo'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$StudentModelToJson(StudentModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'department': instance.department,
      'program': instance.program.toJson(),
      'session': instance.session.toJson(),
      'section': instance.section,
      'name': instance.name,
      'email': instance.email,
      'rollNo': instance.rollNo,
      'phoneNo': instance.phoneNo,
      'role': instance.role,
    };

RegisterStudentModel _$RegisterStudentModelFromJson(
        Map<String, dynamic> json) =>
    RegisterStudentModel(
      department: json['department'] as String?,
      program: json['program'] as String?,
      session: json['session'] as String?,
      section: json['section'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      rollNo: json['rollNo'] as String?,
      phoneNo: json['phoneNo'] as String?,
      password: json['password'] as String?,
      gender: json['gender'] as String?,
    );

Map<String, dynamic> _$RegisterStudentModelToJson(
        RegisterStudentModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'department': instance.department,
      'program': instance.program,
      'session': instance.session,
      'section': instance.section,
      'rollNo': instance.rollNo,
      'phoneNo': instance.phoneNo,
      'password': instance.password,
      'gender': instance.gender,
    };
