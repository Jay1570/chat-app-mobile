import 'package:chathub/core/error_handler.dart';
import 'package:chathub/modules/conversation/conversation_list/conversation_list_notifier.dart';
import 'package:chathub/modules/conversation/conversation_list/conversation_list_state.dart';
import 'package:chathub/modules/conversation/models/conversation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chathub/core/widgets/app_empty_state.dart';
import 'package:chathub/core/widgets/app_error_state.dart';
import 'package:chathub/modules/conversation/conversation_list/widgets/conversation_list.dart';

class ConversationPanel extends ConsumerWidget {
  const ConversationPanel({
    super.key,
    required this.searchController,
    required this.scrollController,
    required this.onConversationTap,
    this.selectedConversationId,
  });

  final TextEditingController searchController;
  final ScrollController scrollController;
  final ValueChanged<Conversation> onConversationTap;
  final String? selectedConversationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(conversationListProvider);

    return switch (state) {
      ConversationListState(isLoading: true) => const Center(
        child: CircularProgressIndicator(),
      ),

      ConversationListState(error: final error?) when error.isNotEmpty =>
        AppErrorState(
          message: resolveError(error).title,
          onRetry: () => ref.read(conversationListProvider.notifier).fetch(),
        ),

      ConversationListState(conversations: final conversations)
          when conversations.isEmpty =>
        AppEmptyState(
          icon: searchController.text.isNotEmpty
              ? Icons.search_off
              : Icons.chat_bubble_outline,
          title: searchController.text.isNotEmpty
              ? 'No conversations found'
              : 'No conversations yet',
          subtitle: searchController.text.isNotEmpty
              ? 'Try a different search term'
              : 'Start a new conversation',
        ),

      _ => ConversationList(
        conversations: state.conversations,
        isLoadingMore: state.isLoadingMore,
        scrollController: scrollController,
        selectedConversationId: selectedConversationId,
        onTap: onConversationTap,
      ),
    };
  }
}
