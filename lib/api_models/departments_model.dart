

import 'package:json_annotation/json_annotation.dart';
import 'package:stud_board/api_models/location_model.dart';

part 'departments_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DepartmentsModel {

  LocationModel? location;
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'department_name')
  String departmentName;
  @JsonKey(name: 'department_abbreviation')
  String departmentAbbreviation;
  @JsonKey(name: 'no_of_programs')
  int noOfPrograms;

  DepartmentsModel(
      {required this.id,
      required this.departmentName,
      required this.departmentAbbreviation,
      required this.noOfPrograms});

  factory DepartmentsModel.fromJson(Map<String, dynamic> json) =>
      _$DepartmentsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentsModelToJson(this);
}
