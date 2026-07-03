// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageListResponse _$MessageListResponseFromJson(Map<String, dynamic> json) =>
    _MessageListResponse(
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      readStatus: (json['readStatus'] as List<dynamic>)
          .map((e) => ReadStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessageListResponseToJson(
  _MessageListResponse instance,
) => <String, dynamic>{
  'messages': instance.messages,
  'readStatus': instance.readStatus,
};
