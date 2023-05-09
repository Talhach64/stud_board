import 'package:json_annotation/json_annotation.dart';

part 'program_model_extra.g.dart';

@JsonSerializable(explicitToJson: true)
class ProgramsModelExtra {
  @JsonKey(name: '_id')
  String? id;

  @JsonKey(name: 'program_title')
  String programTitle;

  @JsonKey(name: 'program_abbreviation')
  String programAbbreviation;

  String type;
  String starting;
  String ending;

  String? department;

  ProgramsModelExtra(
      {required this.id,
      required this.programTitle,
      required this.programAbbreviation,
      required this.type,
      required this.department,
      required this.starting,
      required this.ending});

  factory ProgramsModelExtra.fromJson(Map<String, dynamic> json) =>
      _$ProgramsModelExtraFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramsModelExtraToJson(this);
}
