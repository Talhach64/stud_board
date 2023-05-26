

import 'package:json_annotation/json_annotation.dart';
import 'package:stud_board/api_models/subject_model.dart';
part 'subjects_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SubjectsModel {

  SubjectModel subject;

  @JsonKey(name : 'id')
  String id;
  @JsonKey(name: 'theory_hours')
  String theoryHours;
  @JsonKey(name: 'lab_hours')
  String labHours;
  SubjectsModel({required this.subject, required this.id,required this.labHours,required this.theoryHours});

  factory SubjectsModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectsModelToJson(this);
}