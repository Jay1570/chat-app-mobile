import 'package:chathub/core/network/api_client.dart';
import 'package:chathub/modules/conversation/models/conversation_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConversationApi {
  ConversationApi(this._client);

  final ApiClient _client;

  Future<ConversationListResponse> getConversations({
    String? search,
    String? cursor,
    String? cursorId,
    int limit = 20,
  }) => _client.get(
    '/conversations',
    queryParameters: {
      'search': ?search,
      'cursor': ?cursor,
      'cursorId': ?cursorId,
      'limit': limit,
    },
    fromJson: (json) => ConversationListResponse.fromJson(
      json as Map<String, dynamic>,
    ),
  );
}

final conversationApiProvider = Provider<ConversationApi>((ref) {
  return ConversationApi(ref.watch(apiClientProvider));
});
