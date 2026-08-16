import 'package:chathub/modules/conversation/message/message_screen.dart';
import 'package:chathub/modules/conversation/models/conversation.dart';
import 'package:material_ui/material_ui.dart';

class ChatPanel extends StatelessWidget {
  const ChatPanel({super.key, required this.conversation});

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    // replace with actual chat screen
    return MessageScreen(conversationId: conversation.id);
  }
}
