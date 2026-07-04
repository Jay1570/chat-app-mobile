import 'package:chathub/core/network/api_client.dart';
import 'package:chathub/models/message.dart';
import 'package:chathub/modules/conversation/models/message_list_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageApi {
  MessageApi(this._client);

  final ApiClient _client;

  Future<MessageListResponse> getMessages(
    String conversationId, {
    String? cursor,
    int limit = 50,
  }) => _client.get(
    '/messages/$conversationId',
    queryParameters: {
      'cursor': ?cursor,
      'limit': limit,
    },
    fromJson: (json) => MessageListResponse.fromJson(
      json as Map<String, dynamic>,
    ),
  );

  Future<Message> sendMessage(
    String conversationId, {
    required String content,
  }) => _client.post(
    '/messages/$conversationId',
    data: {'content': content},
    fromJson: (json) => Message.fromJson(json as Map<String, dynamic>),
  );
}

final messageApiProvider = Provider<MessageApi>((ref) {
  return MessageApi(ref.watch(apiClientProvider));
});
