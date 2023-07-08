// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dpss_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartmentsModel _$DepartmentsModelFromJson(Map<String, dynamic> json) =>
    DepartmentsModel(
      id: json['_id'] as String?,
      departmentName: json['department_name'] as String,
      departmentAbbreviation: json['department_abbreviation'] as String,
    )..location = json['location'] == null
        ? null
        : LocationModel.fromJson(json['location'] as Map<String, dynamic>);

Map<String, dynamic> _$DepartmentsModelToJson(DepartmentsModel instance) =>
    <String, dynamic>{
      'location': instance.location?.toJson(),
      '_id': instance.id,
      'department_name': instance.departmentName,
      'department_abbreviation': instance.departmentAbbreviation,
    };

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      lat: json['lat'] as int,
      lng: json['lng'] as int,
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

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

SectionsModel _$SectionsModelFromJson(Map<String, dynamic> json) =>
    SectionsModel(
      id: json['_id'] as String?,
      sectionTitle: json['section_title'] as String,
      department: json['department'] as String,
      program: json['program'] as String,
      session: json['session'] as String,
    );

Map<String, dynamic> _$SectionsModelToJson(SectionsModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'section_title': instance.sectionTitle,
      'department': instance.department,
      'program': instance.program,
      'session': instance.session,
    };

SessionsModel _$SessionsModelFromJson(Map<String, dynamic> json) =>
    SessionsModel(
      id: json['_id'] as String?,
      sessionTitle: json['session_title'] as String,
      type: json['type'] as String,
      startingYear: json['starting_year'] as String,
      endingYear: json['ending_year'] as String,
      department: json['department'] == null
          ? null
          : DepartmentsModel.fromJson(
              json['department'] as Map<String, dynamic>),
      program: json['program'] == null
          ? null
          : Program.fromJson(json['program'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionsModelToJson(SessionsModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'session_title': instance.sessionTitle,
      'type': instance.type,
      'starting_year': instance.startingYear,
      'ending_year': instance.endingYear,
      'department': instance.department?.toJson(),
      'program': instance.program?.toJson(),
    };
