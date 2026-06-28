import 'package:chathub/core/error_handler.dart';
import 'package:chathub/modules/conversation/conversation_list/conversation_list_state.dart';
import 'package:chathub/services/api/conversation_api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConversationListNotifier extends Notifier<ConversationListState> {
  @override
  ConversationListState build() {
    Future.microtask(() => fetch());
    // fetch();
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
}

final conversationListProvider =
    NotifierProvider.autoDispose<
      ConversationListNotifier,
      ConversationListState
    >(
      ConversationListNotifier.new,
    );
