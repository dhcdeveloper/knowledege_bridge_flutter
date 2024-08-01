import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {

  User();

  late int id;
  late String? name;
  late String? email;
  late int? group;
  late int? sex;
  late String? birthday;
  late String? profilePicture;
  late String? createdAt;
  late int? updatedAt;
  late int? deletedAt;

  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
