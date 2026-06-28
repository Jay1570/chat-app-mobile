import 'package:chathub/core/widgets/app_bar.dart';
import 'package:chathub/modules/conversation/conversation_list/widgets/conversation_actions.dart';
import 'package:chathub/modules/conversation/conversation_list/widgets/conversaton_panel.dart';
import 'package:chathub/modules/conversation/conversation_list/widgets/conversaton_search_bar.dart';
import 'package:chathub/modules/conversation/models/conversation.dart';
import 'package:flutter/material.dart';

class SinglePanelLayout extends StatelessWidget {
  const SinglePanelLayout({
    super.key,
    required this.searchController,
    required this.scrollController,
    required this.onConversationTap,
    required this.onSearchChange,
  });

  final TextEditingController searchController;
  final ScrollController scrollController;
  final ValueChanged<Conversation> onConversationTap;
  final ValueChanged<String> onSearchChange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatHubAppBar(
        title: 'Messages',
        actions: ConversationActions.build(),
        bottom: ConversationSearchBar(
          controller: searchController,
          onChange: onSearchChange,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit_outlined),
      ),
      body: SafeArea(
        child: ConversationPanel(
          searchController: searchController,
          scrollController: scrollController,
          onConversationTap: onConversationTap,
        ),
      ),
    );
  }
}
