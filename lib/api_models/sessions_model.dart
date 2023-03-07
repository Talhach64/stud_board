import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';


part 'sessions_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SessionsModel {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'section_title')
  String sectionTitle;
  String department;
  String program;
  String session;
  String type;
  @JsonKey(name: 'starting_year')
  String? startingYear;
  @JsonKey(name: 'ending_year')
  String endingYear;

  SessionsModel(
      {required this.id,
      required this.department,
      required this.program,
      required this.session,
      required this.sectionTitle,
      required this.type,
      this.startingYear,
      required this.endingYear});

  factory SessionsModel.fromJson(Map<String, dynamic> json) =>
      _$SessionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionsModelToJson(this);
}
