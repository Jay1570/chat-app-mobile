import 'package:chathub/core/constants/screen_breakpoints.dart';
import 'package:chathub/core/widgets/app_bar.dart';
import 'package:chathub/modules/conversation/conversation_list/widgets/chat_panel.dart';
import 'package:chathub/modules/conversation/conversation_list/widgets/conversation_actions.dart';
import 'package:chathub/modules/conversation/conversation_list/widgets/conversaton_panel.dart';
import 'package:chathub/modules/conversation/conversation_list/widgets/conversaton_search_bar.dart';
import 'package:chathub/modules/conversation/conversation_list/widgets/no_chat_selected_state.dart';
import 'package:chathub/modules/conversation/models/conversation.dart';
import 'package:flutter/material.dart';

class DualPanelLayout extends StatelessWidget {
  const DualPanelLayout({
    super.key,
    required this.selectedConversation,
    required this.onConversationTap,
    required this.searchController,
    required this.scrollController,
    required this.onSearchChange,
  });

  final Conversation? selectedConversation;
  final ValueChanged<Conversation> onConversationTap;
  final TextEditingController searchController;
  final ScrollController scrollController;
  final ValueChanged<String> onSearchChange;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: ChatHubAppBar(
        title: 'Messages',
        actions: ConversationActions.build(),
        bottom: ConversationSearchBar(
          controller: searchController,
          onChange: onSearchChange,
        ),
      ),
      body: SafeArea(
        child: Row(
          children: [
            SizedBox(
              width: Breakpoints.conversationListWidth,
              child: ConversationPanel(
                searchController: searchController,
                scrollController: scrollController,
                onConversationTap: onConversationTap,
                selectedConversationId: selectedConversation?.id,
              ),
            ),
            VerticalDivider(
              width: 1,
              color: colorScheme.outlineVariant,
            ),
            Expanded(
              child: selectedConversation == null
                  ? NoChatSelectedState()
                  : ChatPanel(conversation: selectedConversation!),
            ),
          ],
        ),
      ),
    );
  }
}
