import 'package:chathub/core/error_handler.dart';
import 'package:chathub/core/network/web_socket.dart';
import 'package:chathub/models/message.dart';
import 'package:chathub/modules/conversation/conversation_list/conversation_list_state.dart';
import 'package:chathub/services/api/conversation_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConversationListNotifier extends Notifier<ConversationListState> {
  @override
  ConversationListState build() {
    Future.microtask(() => fetch());
    final wsService = ref.read(webSocketProvider);
    final sub = wsService
        .onPattern<Message>(
          ':message:new',
          Message.fromJson,
        )
        .listen((message) {
          handleNewMessage(message);
        });

    ref.onDispose(() => sub.cancel());
    return const ConversationListState(isLoading: true);
  }

  Future<void> fetch({String? search}) async {
    state = state.copyWith(isLoading: true, clearCursor: true);
    try {
      final result = await ref
          .read(conversationApiProvider)
          .getConversations(
            search: search,
          );
      state = state.copyWith(
        isLoading: false,
        conversations: result.conversations,
        nextCursor: result.nextCursor,
        nextCursorId: result.nextCursorId,
      );
    } catch (e, st) {
      state = state.copyWith(isLoading: false, error: resolveError(e).message);
      if (kDebugMode) {
        debugPrint("Error happened during conversation list fecth: $e\n$st");
      }
    }
  }

  Future<void> fetchMore() async {
    if (!state.hasMore || state.isLoadingMore) return;
    state = state.copyWith(isLoadingMore: true);
    try {
      final result = await ref
          .read(conversationApiProvider)
          .getConversations(
            cursor: state.nextCursor,
            cursorId: state.nextCursorId,
          );
      state = state.copyWith(
        isLoadingMore: false,
        conversations: [...state.conversations, ...result.conversations],
        nextCursor: result.nextCursor,
        nextCursorId: result.nextCursorId,
      );
    } catch (e) {
      state = state.copyWith(isLoadingMore: false, error: e.toString());
    }
  }

  void handleNewMessage(Message message) {
    final conversations = state.conversations.toList();
    final index = conversations.indexWhere(
      (c) => c.id == message.conversationId,
    );

    if (index == -1) return;

    final updated = conversations[index].copyWith(
      lastMessage: message.isDeleted ? null : message.content,
      lastMessageAt: message.createdAt.toIso8601String(),
      lastMessageByUserId: message.senderId,
      lastMessageByUser: message.sender,
      unreadCount: conversations[index].unreadCount + 1,
    );

    conversations
      ..removeAt(index)
      ..insert(0, updated);

    state = state.copyWith(conversations: conversations);
  }
}

final conversationListProvider =
    NotifierProvider.autoDispose<
      ConversationListNotifier,
      ConversationListState
    >(
      ConversationListNotifier.new,
    );
