import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConversationSearchBar extends ConsumerWidget
    implements PreferredSizeWidget {
  const ConversationSearchBar({
    super.key,
    required this.controller,
    required this.onChange,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChange;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      child: SearchBar(
        controller: controller,
        hintText: 'Search conversations...',
        leading: const Icon(Icons.search),
        onChanged: onChange,
        elevation: const WidgetStatePropertyAll(0),
        backgroundColor: WidgetStatePropertyAll(
          Theme.of(context).colorScheme.surfaceContainerHighest,
        ),
      ),
    );
  }
}
