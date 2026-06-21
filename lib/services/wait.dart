import 'dart:js_interop';
import 'package:flutter/foundation.dart';
import 'package:web/web.dart' as web;

Future<void> waitForServiceWorker() async {
  if (kIsWeb) {
    await web.window.navigator.serviceWorker.ready.toDart;
  }
}
