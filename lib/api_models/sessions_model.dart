import 'package:json_annotation/json_annotation.dart';
import 'package:stud_board/api_models/departments_model.dart';
import 'package:stud_board/api_models/program_model_extra.dart';
import 'package:stud_board/api_models/programs_model.dart';

part 'sessions_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SessionsModel {
  @JsonKey(name: '_id')
  String? id;

  @JsonKey(name: 'session_title')
  String sessionTitle;

  String type;
  @JsonKey(name: 'starting_year')
  String startingYear;

  @JsonKey(name: 'ending_year')
  String endingYear;

  SessionsModel(
      {required this.id,
      required this.sessionTitle,
      required this.type,
      required this.startingYear,
      required this.endingYear
      });

  factory SessionsModel.fromJson(Map<String, dynamic> json) =>
      _$SessionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionsModelToJson(this);
}
