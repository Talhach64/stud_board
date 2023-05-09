import 'package:json_annotation/json_annotation.dart';
import 'package:stud_board/api_models/departments_model.dart';

part 'programs_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProgramsModel {
  @JsonKey(name: '_id')
  String? id;

  @JsonKey(name: 'program_title')
  String programTitle;

  @JsonKey(name: 'program_abbreviation')
  String programAbbreviation;

  String type;
  DepartmentsModel department;

  ProgramsModel(
      {required this.id,
      required this.programTitle,
      required this.programAbbreviation,
      required this.type,
      required this.department});

  factory ProgramsModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramsModelToJson(this);
}
