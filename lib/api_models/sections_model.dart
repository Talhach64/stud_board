import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';


part 'sections_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SectionsModel {

  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'section_title')
  String sectionTitle;
  @JsonKey(name: 'session_title')
  String sessionTitle;
  String department;
  String program;
  String session;
  String type;
  @JsonKey(name: 'starting_year')
  String? startingYear;
  @JsonKey(name: 'ending_year')
  String endingYear;

  SectionsModel(
      {required this.id,
        required this.department,
        required this.program,
        required this.session,
        required this.sectionTitle,
        required this.sessionTitle,
        required this.type,
        this.startingYear,
        required this.endingYear});

  factory SectionsModel.fromJson(Map<String, dynamic> json) =>
      _$SectionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SectionsModelToJson(this);
}
