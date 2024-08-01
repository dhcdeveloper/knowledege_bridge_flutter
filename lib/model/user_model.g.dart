// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..id = (json['id'] as num).toInt()
  ..name = json['name'] as String?
  ..email = json['email'] as String?
  ..group = (json['group'] as num?)?.toInt()
  ..sex = (json['sex'] as num?)?.toInt()
  ..birthday = json['birthday'] as String?
  ..profilePicture = json['profile_picture'] as String?
  ..createdAt = json['created_at'] as String?
  ..updatedAt = (json['updated_at'] as num?)?.toInt()
  ..deletedAt = (json['deleted_at'] as num?)?.toInt();

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'group': instance.group,
      'sex': instance.sex,
      'birthday': instance.birthday,
      'profile_picture': instance.profilePicture,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };
