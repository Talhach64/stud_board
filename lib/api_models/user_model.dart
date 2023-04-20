// import 'package:json_annotation/json_annotation.dart';
//
//
// part 'user_model.g.dart';
//
// @JsonSerializable(explicitToJson: true)
// class UserModel {
//
//   @JsonKey(name: '_id')
//   String? id;
//   String name;
//   String email;
//   String section;
//   String department;
//   String session;
//   String program;
//   String type;
//   @JsonKey(name: 'starting_year')
//   String? startingYear;
//   @JsonKey(name: 'ending_year')
//   String endingYear;
//
//   UserModel(
//       {required this.id,
//         required this.department,
//         required this.program,
//         required this.session,
//         required this.sectionTitle,
//         required this.sessionTitle,
//         required this.type,
//         this.startingYear,
//         required this.endingYear});
//
//   factory UserModel.fromJson(Map<String, dynamic> json) =>
//       _$UserModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$UserModelToJson(this);
// }