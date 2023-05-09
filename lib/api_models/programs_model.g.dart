// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'programs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgramsModel _$ProgramsModelFromJson(Map<String, dynamic> json) =>
    ProgramsModel(
      id: json['_id'] as String?,
      programTitle: json['program_title'] as String,
      programAbbreviation: json['program_abbreviation'] as String,
      type: json['type'] as String,
      department:
          DepartmentsModel.fromJson(json['department'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProgramsModelToJson(ProgramsModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'program_title': instance.programTitle,
      'program_abbreviation': instance.programAbbreviation,
      'type': instance.type,
      'department': instance.department.toJson(),
    };
