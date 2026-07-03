import 'package:chathub/models/basic_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
abstract class Message with _$Message {
  const factory Message({
    required String id,
    required String conversationId,
    required String senderId,
    BasicUser? sender,
    required String content,
    required bool isEdited,
    required bool isDeleted,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
