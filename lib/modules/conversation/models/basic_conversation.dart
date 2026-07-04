import 'package:chathub/modules/conversation/models/conversation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'basic_conversation.freezed.dart';
part 'basic_conversation.g.dart';

@freezed
abstract class BasicConversation with _$BasicConversation {
  const factory BasicConversation({
    required String id,
    required String name,
    required ConversationType type,
  }) = _BasicConversation;

  factory BasicConversation.fromJson(Map<String, dynamic> json) =>
      _$BasicConversationFromJson(json);
}
