// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sections_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionsModel _$SectionsModelFromJson(Map<String, dynamic> json) =>
    SectionsModel(
      id: json['_id'] as String?,
      department: json['department'] as String,
      program: json['program'] as String,
      session: json['session'] as String,
      sectionTitle: json['section_title'] as String,
      sessionTitle: json['session_title'] as String,
      type: json['type'] as String,
      startingYear: json['starting_year'] as String?,
      endingYear: json['ending_year'] as String,
    );

Map<String, dynamic> _$SectionsModelToJson(SectionsModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'section_title': instance.sectionTitle,
      'session_title': instance.sessionTitle,
      'department': instance.department,
      'program': instance.program,
      'session': instance.session,
      'type': instance.type,
      'starting_year': instance.startingYear,
      'ending_year': instance.endingYear,
    };
