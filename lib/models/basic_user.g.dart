// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BasicUser _$BasicUserFromJson(Map<String, dynamic> json) => _BasicUser(
  id: json['id'] as String,
  name: json['name'] as String,
  imageUrl: json['imageUrl'] as String?,
);

Map<String, dynamic> _$BasicUserToJson(_BasicUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
    };
