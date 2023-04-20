// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentModel _$StudentModelFromJson(Map<String, dynamic> json) => StudentModel(
      id: json['_id'] as String?,
      department: json['department'] as String,
      program: json['program'] as String,
      session: json['session'] as String,
      section: json['section'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      rollNo: json['rollNo'] as String,
      phoneNo: json['phoneNo'] as String,
      avatar: json['avatar'] as String,
      role: json['role'] as String,
    );

Map<String, dynamic> _$StudentModelToJson(StudentModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'section': instance.section,
      'department': instance.department,
      'session': instance.session,
      'program': instance.program,
      'rollNo': instance.rollNo,
      'phoneNo': instance.phoneNo,
      'avatar': instance.avatar,
      'role': instance.role,
    };
