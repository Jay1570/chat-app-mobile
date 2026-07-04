import 'package:chathub/models/message.dart';
import 'package:chathub/modules/conversation/models/basic_conversation.dart';
import 'package:chathub/modules/conversation/models/message_read_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_list_response.freezed.dart';
part 'message_list_response.g.dart';

@freezed
abstract class MessageListResponse with _$MessageListResponse {
  const factory MessageListResponse({
    required List<Message> messages,
    required List<ReadStatus> readStatus,
    required BasicConversation conversation,
  }) = _MessageListResponse;

  factory MessageListResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageListResponseFromJson(json);
}
