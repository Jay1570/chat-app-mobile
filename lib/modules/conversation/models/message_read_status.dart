import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_read_status.freezed.dart';
part 'message_read_status.g.dart';

@freezed
abstract class ReadStatus with _$ReadStatus {
  const factory ReadStatus({
    required String userId,
    String? lastReadAt,
  }) = _ReadStatus;

  factory ReadStatus.fromJson(Map<String, dynamic> json) =>
      _$ReadStatusFromJson(json);
}
