import 'package:chathub/models/basic_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation.freezed.dart';
part 'conversation.g.dart';

@freezed
abstract class Conversation with _$Conversation {
  const factory Conversation({
    required String id,
    required String name,
    required String type,
    String? lastMessage,
    String? lastMessageByUserId,
    BasicUser? lastMessageByUser,
    String? lastMessageAt,
    required int unreadCount,
    required List<BasicUser> otherUsers,
  }) = _Conversation;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);
}
