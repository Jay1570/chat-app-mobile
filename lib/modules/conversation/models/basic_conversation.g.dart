// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BasicConversation _$BasicConversationFromJson(Map<String, dynamic> json) =>
    _BasicConversation(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$ConversationTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$BasicConversationToJson(_BasicConversation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$ConversationTypeEnumMap[instance.type]!,
    };

const _$ConversationTypeEnumMap = {
  ConversationType.direct: 'direct',
  ConversationType.group: 'group',
};
