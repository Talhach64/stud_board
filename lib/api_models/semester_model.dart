import 'package:json_annotation/json_annotation.dart';
part 'semester_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SemesterModel {
  @JsonKey(name: '_id')
  String id;
  @JsonKey(name: 'semester_title')
  String semesterTitle;
  String type;
  String starting;
  String ending;

  String? department;
  String? program;
  String? session;


  SemesterModel(
      {required this.id,
        required this.semesterTitle,
        required this.type,
        required this.starting,
        required this.ending,
        required this.department,
        required this.program,
        required this.session,
        });

  factory SemesterModel.fromJson(Map<String, dynamic> json) =>
      _$SemesterModelFromJson(json);

  Map<String, dynamic> toJson() => _$SemesterModelToJson(this);
}

