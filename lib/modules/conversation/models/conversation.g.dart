// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Conversation _$ConversationFromJson(Map<String, dynamic> json) =>
    _Conversation(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      lastMessage: json['lastMessage'] as String?,
      lastMessageByUserId: json['lastMessageByUserId'] as String?,
      lastMessageByUser: json['lastMessageByUser'] == null
          ? null
          : BasicUser.fromJson(
              json['lastMessageByUser'] as Map<String, dynamic>,
            ),
      lastMessageAt: json['lastMessageAt'] as String?,
      unreadCount: (json['unreadCount'] as num).toInt(),
      otherUsers: (json['otherUsers'] as List<dynamic>)
          .map((e) => BasicUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConversationToJson(_Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'lastMessage': instance.lastMessage,
      'lastMessageByUserId': instance.lastMessageByUserId,
      'lastMessageByUser': instance.lastMessageByUser,
      'lastMessageAt': instance.lastMessageAt,
      'unreadCount': instance.unreadCount,
      'otherUsers': instance.otherUsers,
    };
