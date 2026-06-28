import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final connectivityProvider = StreamProvider<bool>((ref) async* {
  final connectivity = Connectivity();

  // Initial state
  final initial = await connectivity.checkConnectivity();
  yield initial.any((result) => result != ConnectivityResult.none);

  // Listen for changes
  yield* connectivity.onConnectivityChanged.map(
    (results) => results.any((result) => result != ConnectivityResult.none),
  );
});
