import 'package:json_annotation/json_annotation.dart';
import 'package:stud_board/api_models/teacher_models.dart';

part 'dpss_models.g.dart';

@JsonSerializable(explicitToJson: true)
class DepartmentsModel {
  LocationModel? location;
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'department_name')
  String departmentName;
  @JsonKey(name: 'department_abbreviation')
  String departmentAbbreviation;
  DepartmentsModel({
    required this.id,
    required this.departmentName,
    required this.departmentAbbreviation,
    // required this.noOfPrograms
  });

  factory DepartmentsModel.fromJson(Map<String, dynamic> json) =>
      _$DepartmentsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LocationModel {
  int lat;
  int lng;

  LocationModel({required this.lat, required this.lng});

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}

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

@JsonSerializable(explicitToJson: true)
class SectionsModel {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'section_title')
  String sectionTitle;

  SectionsModel({
    required this.id,
    required this.sectionTitle,

  });

  factory SectionsModel.fromJson(Map<String, dynamic> json) =>
      _$SectionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SectionsModelToJson(this);
}
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

  DepartmentsModel? department;
  Program? program;

  SessionsModel(
      {required this.id,
        required this.sessionTitle,
        required this.type,
        required this.startingYear,
        required this.endingYear,
        this.department,
        this.program,
      });

  factory SessionsModel.fromJson(Map<String, dynamic> json) =>
      _$SessionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionsModelToJson(this);
}
