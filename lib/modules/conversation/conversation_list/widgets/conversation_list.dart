import 'package:chathub/modules/conversation/conversation_list/widgets/conversation_tile.dart';
import 'package:chathub/modules/conversation/models/conversation.dart';
import 'package:flutter/material.dart';

class ConversationList extends StatelessWidget {
  const ConversationList({
    super.key,
    required this.conversations,
    required this.isLoadingMore,
    required this.scrollController,
    required this.onTap,
    this.selectedConversationId,
  });

  final List<Conversation> conversations;
  final bool isLoadingMore;
  final ScrollController scrollController;
  final ValueChanged<Conversation> onTap;
  final String? selectedConversationId;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      itemCount: conversations.length + (isLoadingMore ? 1 : 0),
      separatorBuilder: (_, _) => Divider(
        height: 1,
        indent: 72,
        color: Theme.of(context).colorScheme.outlineVariant.withValues(alpha: 0.5),
      ),
      itemBuilder: (context, index) {
        if (index == conversations.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        final conversation = conversations[index];
        return ConversationTile(
          conversation: conversation,
          isSelected: conversation.id == selectedConversationId,
          onTap: () => onTap(conversation),
        );
      },
    );
  }
}
