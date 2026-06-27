import 'package:chathub/modules/conversation/models/conversation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_response.freezed.dart';
part 'conversation_response.g.dart';

@freezed
abstract class ConversationListResponse with _$ConversationListResponse {
  const factory ConversationListResponse({
    required List<Conversation> conversations,
    String? nextCursor,
    String? nextCursorId,
  }) = _ConversationListResponse;

  factory ConversationListResponse.fromJson(Map<String, dynamic> json) =>
      _$ConversationListResponseFromJson(json);
}
