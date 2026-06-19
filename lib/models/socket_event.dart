import 'package:freezed_annotation/freezed_annotation.dart';

part 'socket_event.freezed.dart';
part 'socket_event.g.dart';

@freezed
abstract class SocketEvent with _$SocketEvent {
  const factory SocketEvent({
    required String event,
    required Map<String, dynamic> data
  }) = _SocketEvent;

  factory SocketEvent.fromJson(Map<String, dynamic> json) =>
      _$SocketEventFromJson(json);
}
