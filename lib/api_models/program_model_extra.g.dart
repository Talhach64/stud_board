// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_model_extra.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgramsModelExtra _$ProgramsModelExtraFromJson(Map<String, dynamic> json) =>
    ProgramsModelExtra(
      id: json['_id'] as String?,
      programTitle: json['program_title'] as String,
      programAbbreviation: json['program_abbreviation'] as String,
      type: json['type'] as String,
      department: json['department'] as String?,
      starting: json['starting'] as String,
      ending: json['ending'] as String,
    );

Map<String, dynamic> _$ProgramsModelExtraToJson(ProgramsModelExtra instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'program_title': instance.programTitle,
      'program_abbreviation': instance.programAbbreviation,
      'type': instance.type,
      'starting': instance.starting,
      'ending': instance.ending,
      'department': instance.department,
    };
