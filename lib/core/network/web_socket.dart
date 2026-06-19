import 'dart:async';
import 'dart:convert';

import 'package:chathub/core/constants/base_url.dart';
import 'package:chathub/models/socket_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

enum SocketConnectionState {
  disconnected,
  connecting,
  connected,
  reconnecting,
}

class WebSocketService {
  WebSocketChannel? _channel;
  StreamSubscription<dynamic>? _channelSub;

  final _controller = StreamController<SocketEvent>.broadcast();
  final _stateController = StreamController<SocketConnectionState>.broadcast();

  SocketConnectionState _state = SocketConnectionState.disconnected;
  SocketConnectionState get state => _state;
  bool get isConnected => _state == SocketConnectionState.connected;

  Stream<SocketEvent> get events => _controller.stream;
  Stream<SocketConnectionState> get connectionState => _stateController.stream;

  String? _token;
  bool _connecting = false;
  bool _manuallyDisconnected = false;
  int _retryAttempt = 0;
  Timer? _retryTimer;

  static const _maxBackoff = Duration(seconds: 30);

  Future<void> connect({required String token}) async {
    _token = token;
    _manuallyDisconnected = false;
    await _connectInternal();
  }

  Future<void> _connectInternal() async {
    if (_channel != null || _connecting) return;
    _connecting = true;
    _setState(
      _retryAttempt == 0
          ? SocketConnectionState.connecting
          : SocketConnectionState.reconnecting,
    );

    try {
      final channel = WebSocketChannel.connect(
        Uri.parse('$wsUrl?token=$_token'),
      );
      await channel.ready;

      _channel = channel;
      _retryAttempt = 0;
      _setState(SocketConnectionState.connected);

      _channelSub = channel.stream.listen(
        _onMessage,
        onError: _onError,
        onDone: _onDone,
        cancelOnError: false,
      );
    } catch (e) {
      debugPrint("Socket connect failed: $e");
      _channel = null;
      _scheduleReconnect();
    } finally {
      _connecting = false;
    }
  }

  void _onMessage(dynamic raw) {
    try {
      final event = SocketEvent.fromJson(
        jsonDecode(raw as String) as Map<String, dynamic>,
      );
      if (!_controller.isClosed) _controller.add(event);
    } catch (e) {
      debugPrint("Socket parse error: $e");
    }
  }

  void _onError(Object error) {
    debugPrint("Socket error: $error");
    // Don't change state here; onDone will fire right after for most
    // transport-level errors and will drive the reconnect flow.
  }

  void _onDone() {
    _channelSub?.cancel();
    _channelSub = null;
    _channel = null;

    if (_manuallyDisconnected) {
      _setState(SocketConnectionState.disconnected);
      return;
    }

    _scheduleReconnect();
  }

  void _scheduleReconnect() {
    _retryTimer?.cancel();
    _setState(SocketConnectionState.reconnecting);

    final delaySeconds = (1 << _retryAttempt).clamp(1, _maxBackoff.inSeconds);
    _retryAttempt++;

    _retryTimer = Timer(Duration(seconds: delaySeconds), () {
      if (!_manuallyDisconnected) {
        _connectInternal();
      }
    });
  }

  void _setState(SocketConnectionState newState) {
    _state = newState;
    if (!_stateController.isClosed) _stateController.add(newState);
  }

  void send(SocketEvent event) {
    if (_channel == null || !isConnected) {
      throw StateError("Cannot send websocket event while disconnected.");
    }
    _channel?.sink.add(jsonEncode(event.toJson()));
  }

  Future<void> disconnect() async {
    _manuallyDisconnected = true;
    _retryTimer?.cancel();
    _retryAttempt = 0;
    await _channelSub?.cancel();
    await _channel?.sink.close();
    _channel = null;
    _setState(SocketConnectionState.disconnected);
  }

  Stream<T> where<T>(
    bool Function(SocketEvent event) test,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return events
        .where(test)
        .map(
          (e) => fromJson(e.data),
        );
  }

  Stream<T> onEventPrefix<T>(
    String prefix,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return where((e) => e.event.startsWith(prefix), fromJson);
  }

  Stream<T> onPattern<T>(
    Pattern pattern,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return where((e) => e.event.contains(pattern), fromJson);
  }

  Stream<T> onEvent<T>(
    String event,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return where((e) => e.event == event, fromJson);
  }

  Future<void> dispose() async {
    await disconnect();
    await _controller.close();
    await _stateController.close();
  }
}

final webSocketProvider = Provider<WebSocketService>((ref) {
  final service = WebSocketService();

  ref.onDispose(() {
    unawaited(service.dispose());
  });

  return service;
});

final socketConnectionStateProvider = StreamProvider<SocketConnectionState>((
  ref,
) {
  return ref.read(webSocketProvider).connectionState;
});
