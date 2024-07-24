import 'package:json_annotation/json_annotation.dart';

import 'User.dart';

part 'NetResponse.g.dart';

@JsonSerializable()
class NetResponse {

  NetResponse();

  late int response;
  late String? errorText;
  late User? responseData;

  factory NetResponse.fromJson(Map<String,dynamic> json) => _$NetResponseFromJson(json);
  Map<String, dynamic> toJson() => _$NetResponseToJson(this);
}
