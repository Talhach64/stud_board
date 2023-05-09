
import 'package:json_annotation/json_annotation.dart';
import 'package:stud_board/api_models/departments_model.dart';
import 'package:stud_board/api_models/programs_model.dart';
import 'package:stud_board/api_models/sessions_model.dart';


part 'sections_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SectionsModel {

  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'section_title')
  String sectionTitle;
  DepartmentsModel department;
  ProgramsModel program;
  SessionsModel session;
  // @JsonKey(name: 'session_title')
  // String sessionTitle;
  // String type;
  // @JsonKey(name: 'starting_year')
  // String? startingYear;
  // @JsonKey(name: 'ending_year')
  // String endingYear;

  SectionsModel(
      {required this.id,
        required this.department,
        required this.program,
        required this.session,
        required this.sectionTitle,
        });

  factory SectionsModel.fromJson(Map<String, dynamic> json) =>
      _$SectionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SectionsModelToJson(this);
}
