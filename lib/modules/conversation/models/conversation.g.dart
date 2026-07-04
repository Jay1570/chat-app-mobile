// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Conversation _$ConversationFromJson(Map<String, dynamic> json) =>
    _Conversation(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$ConversationTypeEnumMap, json['type']),
      lastMessage: json['lastMessage'] as String?,
      lastMessageByUserId: json['lastMessageByUserId'] as String?,
      lastMessageByUser: json['lastMessageByUser'] == null
          ? null
          : BasicUser.fromJson(
              json['lastMessageByUser'] as Map<String, dynamic>,
            ),
      lastMessageAt: json['lastMessageAt'] as String?,
      unreadCount: const IntConverter().fromJson(json['unreadCount']),
      otherUsers: (json['otherUsers'] as List<dynamic>)
          .map((e) => BasicUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ConversationToJson(_Conversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$ConversationTypeEnumMap[instance.type]!,
      'lastMessage': instance.lastMessage,
      'lastMessageByUserId': instance.lastMessageByUserId,
      'lastMessageByUser': instance.lastMessageByUser,
      'lastMessageAt': instance.lastMessageAt,
      'unreadCount': const IntConverter().toJson(instance.unreadCount),
      'otherUsers': instance.otherUsers,
    };

const _$ConversationTypeEnumMap = {
  ConversationType.direct: 'direct',
  ConversationType.group: 'group',
};
