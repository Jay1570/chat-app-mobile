import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:mobile_app/secure_storage.dart";
import "package:mobile_app/core/constants/storage_keys.dart";

class ThemeSettings {
  const ThemeSettings({required this.mode, required this.seedColor});

  final ThemeMode mode;
  final int seedColor;
}

final themeProvider =
    NotifierProvider<ThemeNotifier, ThemeSettings>(
  ThemeNotifier.new,
);

class ThemeNotifier extends Notifier<ThemeSettings> {
  @override
  ThemeSettings build() {
    _load();

    return const ThemeSettings(
      mode: ThemeMode.system,
      seedColor: 0xFF2563EB,
    );
  }

  Future<void> _load() async {
    final storage = ref.read(
      secureStorageProvider,
    );

    final mode = await storage.read(
      key: themeModeStorageKey,
    );

    final color = await storage.read(
      key: themeColorStorageKey,
    );

    state = ThemeSettings(
      mode: ThemeMode.values.firstWhere(
        (e) => e.name == mode,
        orElse: () => ThemeMode.system,
      ),
      seedColor:
          int.tryParse(color ?? "") ??
          0xFF2563EB,
    );
  }

  Future<void> setThemeMode(
    ThemeMode mode,
  ) async {
    await ref
        .read(secureStorageProvider)
        .write(
          key: themeModeStorageKey,
          value: mode.name,
        );

    state = ThemeSettings(
      mode: mode,
      seedColor: state.seedColor,
    );
  }

  Future<void> setSeedColor(
    Color color,
  ) async {
    await ref
        .read(secureStorageProvider)
        .write(
          key: themeColorStorageKey,
          value: color.toARGB32().toString(),
        );

    state = ThemeSettings(
      mode: state.mode,
      seedColor: color.toARGB32(),
    );
  }
}
