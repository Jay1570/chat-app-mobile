// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConversationListResponse _$ConversationListResponseFromJson(
  Map<String, dynamic> json,
) => _ConversationListResponse(
  conversations: (json['conversations'] as List<dynamic>)
      .map((e) => Conversation.fromJson(e as Map<String, dynamic>))
      .toList(),
  nextCursor: json['nextCursor'] as String?,
  nextCursorId: json['nextCursorId'] as String?,
);

Map<String, dynamic> _$ConversationListResponseToJson(
  _ConversationListResponse instance,
) => <String, dynamic>{
  'conversations': instance.conversations,
  'nextCursor': instance.nextCursor,
  'nextCursorId': instance.nextCursorId,
};
