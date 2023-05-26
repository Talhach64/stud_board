

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
  // @JsonKey(name: 'no_of_programs')
  // int noOfPrograms;

  DepartmentsModel(
      {required this.id,
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
