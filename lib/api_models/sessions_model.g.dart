// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sessions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionsModel _$SessionsModelFromJson(Map<String, dynamic> json) =>
    SessionsModel(
      id: json['_id'] as String?,
      sessionTitle: json['session_title'] as String,
      type: json['type'] as String,
      startingYear: json['starting_year'] as String,
      endingYear: json['ending_year'] as String,
    );

Map<String, dynamic> _$SessionsModelToJson(SessionsModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'session_title': instance.sessionTitle,
      'type': instance.type,
      'starting_year': instance.startingYear,
      'ending_year': instance.endingYear,
    };
