// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sections_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionsModel _$SectionsModelFromJson(Map<String, dynamic> json) =>
    SectionsModel(
      id: json['_id'] as String?,
      department:
          DepartmentsModel.fromJson(json['department'] as Map<String, dynamic>),
      program: ProgramsModel.fromJson(json['program'] as Map<String, dynamic>),
      session: SessionsModel.fromJson(json['session'] as Map<String, dynamic>),
      sectionTitle: json['section_title'] as String,
    );

Map<String, dynamic> _$SectionsModelToJson(SectionsModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'section_title': instance.sectionTitle,
      'department': instance.department.toJson(),
      'program': instance.program.toJson(),
      'session': instance.session.toJson(),
    };
