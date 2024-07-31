import 'package:json_annotation/json_annotation.dart';

part 'UploadFile.g.dart';

@JsonSerializable()
class UploadFile {
  UploadFile();

  late String message;

  factory UploadFile.fromJson(Map<String, dynamic> json) =>
      _$UploadFileFromJson(json);

  Map<String, dynamic> toJson() => _$UploadFileToJson(this);
}
