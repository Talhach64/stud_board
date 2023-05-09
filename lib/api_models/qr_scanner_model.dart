import 'package:json_annotation/json_annotation.dart';
part 'qr_scanner_model.g.dart';

@JsonSerializable(explicitToJson: true)
class QRScannerModel {
  String? type;
  String? message;

  QRScannerModel({required this.type, required this.message});

  factory QRScannerModel.fromJson(Map<String, dynamic> json) =>
      _$QRScannerModelFromJson(json);

  Map<String, dynamic> toJson() => _$QRScannerModelToJson(this);
}
