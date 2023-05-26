import 'package:json_annotation/json_annotation.dart';
import 'package:stud_board/api_models/programs_model.dart';
import 'package:stud_board/api_models/semester_model.dart';
import 'package:stud_board/api_models/sessions_model.dart';
import 'departments_model.dart';

part 'subject_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SubjectModel {
  @JsonKey(name: '_id')
  String id;
  @JsonKey(name: 'subject_title')
  String subjectTitle;
  @JsonKey(name: 'subject_code')
  String subjectCode;
  @JsonKey(name: 'theory_hours')
  String theoryHours;
  @JsonKey(name: 'lab_hours')
  String labHours;

  DepartmentsModel department;
  ProgramsModel program;
  SessionsModel session;
  SemesterModel semester;

  SubjectModel(
      {required this.id,
      required this.subjectTitle,
      required this.subjectCode,
      required this.theoryHours,
      required this.labHours,
      required this.department,
      required this.program,
      required this.session,
      required this.semester});

  factory SubjectModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectModelToJson(this);
}

