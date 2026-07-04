import 'package:chathub/core/json_converters/int_converter.dart';
import 'package:chathub/models/basic_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

enum ConversationType {
  @JsonValue("direct")
  direct,

  @JsonValue("group")
  group,
}

@freezed
abstract class Conversation with _$Conversation {
  const factory Conversation({
    required String id,
    required String name,
    required ConversationType type,
    String? lastMessage,
    String? lastMessageByUserId,
    BasicUser? lastMessageByUser,
    String? lastMessageAt,
    @IntConverter() required int unreadCount,
    required List<BasicUser> otherUsers,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);
}
