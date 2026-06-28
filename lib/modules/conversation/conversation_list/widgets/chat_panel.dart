import 'package:chathub/modules/conversation/models/conversation.dart';
import 'package:flutter/material.dart';

class ChatPanel extends StatelessWidget {
  const ChatPanel({super.key, required this.conversation});

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    // replace with actual chat screen
    return const Center(child: Text('Chat panel'));
  }
}
