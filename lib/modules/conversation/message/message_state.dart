import 'package:chathub/models/message.dart';
import 'package:chathub/modules/conversation/models/message_read_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_state.freezed.dart';

@freezed
abstract class MessageState with _$MessageState {
  const MessageState._();

  const factory MessageState({
    @Default([]) List<Message> messages,
    @Default([]) List<ReadStatus> readStatus,
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    String? error,
    String? nextCursor,
  }) = _MessageState;

  bool get hasMore => nextCursor != null;
}
