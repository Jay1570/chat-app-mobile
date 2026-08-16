import 'package:material_ui/material_ui.dart';

class ConversationActions {
  static List<Widget> build() => [
    IconButton(
      onPressed: () {},
      icon: const Badge(
        child: Icon(Icons.notifications_outlined),
      ),
    ),
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.edit_outlined),
    ),
  ];
}
