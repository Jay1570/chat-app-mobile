import 'package:chathub/modules/conversation/models/conversation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'conversation_list_state.freezed.dart';

@freezed
abstract class ConversationListState with _$ConversationListState {
  const ConversationListState._();

  const factory ConversationListState({
    @Default([]) List<Conversation> conversations,
    String? nextCursor,
    String? nextCursorId,
    @Default(false) bool clearCursor,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    String? error,
  }) = _ConversationListState;

  bool get hasMore => nextCursor != null && nextCursorId != null;
}
