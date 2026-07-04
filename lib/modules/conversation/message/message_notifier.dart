import 'package:chathub/core/constants/ws_events.dart';
import 'package:chathub/core/error_handler.dart';
import 'package:chathub/core/network/web_socket.dart';
import 'package:chathub/models/message.dart';
import 'package:chathub/modules/conversation/message/message_state.dart';
import 'package:chathub/services/api/conversation_api.dart';
import 'package:chathub/services/api/message_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageNotifier extends Notifier<MessageState> {
  final String _conversationId;

  MessageNotifier(this._conversationId);

  @override
  MessageState build() {
    Future.microtask(() {
      fetch();
      markConversationAsRead();
    });
    final wsService = ref.read(webSocketProvider);
    final sub = wsService
        .onEvent<Message>(
          WsEvents.messageNew(_conversationId),
          Message.fromJson,
        )
        .listen((message) {
          handleNewMessage(message);
        });

    ref.onDispose(() => sub.cancel());
    return const MessageState(isLoading: true);
  }

  Future<void> fetch() async {
    state = state.copyWith(isLoading: true);
    try {
      final result = await ref
          .read(messageApiProvider)
          .getMessages(_conversationId);
      state = state.copyWith(
        isLoading: false,
        messages: result.messages,
        readStatus: result.readStatus,
        nextCursor: result.messages.isNotEmpty
            ? result.messages.last.createdAt.toIso8601String()
            : null,
        conversation: result.conversation,
      );
    } catch (e, st) {
      state = state.copyWith(
        isLoading: false,
        error: resolveError(e).message,
      );
      if (kDebugMode) debugPrint('MessageNotifier fetch error: $e\n$st');
    }
  }

  Future<void> fetchMore() async {
    if (!state.hasMore || state.isLoadingMore) return;
    state = state.copyWith(isLoadingMore: true);
    try {
      final result = await ref
          .read(messageApiProvider)
          .getMessages(_conversationId, cursor: state.nextCursor);
      state = state.copyWith(
        isLoadingMore: false,
        messages: [...state.messages, ...result.messages],
        nextCursor: result.messages.isNotEmpty
            ? result.messages.last.createdAt.toIso8601String()
            : null,
        conversation: result.conversation,
      );
    } catch (e) {
      state = state.copyWith(isLoadingMore: false, error: e.toString());
    }
  }

  Future<void> markConversationAsRead() async {
    try {
      await ref
          .read(conversationApiProvider)
          .markConversationAsRead(conversationId: _conversationId);
    } catch (e, st) {
      if (kDebugMode) debugPrint('MessageNotifier mark as read error: $e\n$st');
    }
  }

  void handleNewMessage(Message message) {
    final messages = [message, ...state.messages];

    state = state.copyWith(messages: messages);
  }

  Future<void> sendMessage() async {
    try {
      if (state.message.isEmpty || state.isSending) return;
      state = state.copyWith(isSending: true);
      await ref
          .read(messageApiProvider)
          .sendMessage(
            _conversationId,
            content: state.message,
          );
      state = state.copyWith(message: "");
    } catch (e) {
      if (kDebugMode) debugPrint('sendMessage error: $e');
    } finally {
      state = state.copyWith(isSending: false);
    }
  }

  void setMessage(String message) {
    state = state.copyWith(message: message);
  }
}

final messageProvider = NotifierProvider.autoDispose
    .family<MessageNotifier, MessageState, String>(
      MessageNotifier.new,
    );
