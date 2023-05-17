// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sections_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionsModel _$SectionsModelFromJson(Map<String, dynamic> json) =>
    SectionsModel(
      id: json['_id'] as String?,
      sectionTitle: json['section_title'] as String,
    );

Map<String, dynamic> _$SectionsModelToJson(SectionsModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'section_title': instance.sectionTitle,
    };
