// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_read_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReadStatus _$ReadStatusFromJson(Map<String, dynamic> json) => _ReadStatus(
  userId: json['userId'] as String,
  lastReadAt: json['lastReadAt'] as String?,
);

Map<String, dynamic> _$ReadStatusToJson(_ReadStatus instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'lastReadAt': instance.lastReadAt,
    };
