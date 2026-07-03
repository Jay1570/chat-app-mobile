// lib/modules/conversation/message/message_screen.dart
import 'package:chathub/core/auth/auth_notifier.dart';
import 'package:chathub/core/utils/time_utils.dart';
import 'package:chathub/core/widgets/app_bar.dart';
import 'package:chathub/core/widgets/app_empty_state.dart';
import 'package:chathub/core/widgets/app_error_state.dart';
import 'package:chathub/main.dart';
import 'package:chathub/models/message.dart';
import 'package:chathub/modules/conversation/message/message_notifier.dart';
import 'package:chathub/modules/conversation/message/message_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MessageScreen extends ConsumerStatefulWidget {
  const MessageScreen({super.key, required this.conversationId});

  final String conversationId;

  @override
  ConsumerState<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends ConsumerState<MessageScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(messageProvider(widget.conversationId).notifier).fetchMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(messageProvider(widget.conversationId));

    return Scaffold(
      appBar: ChatHubAppBar(
        title: widget
            .conversationId, // replace with conversation name once API ready
        leading: BackButton(
          onPressed: () => rootNavigatorKey.currentContext?.pop(),
        ),
      ),
      body: SafeArea(
        child: switch (state) {
          MessageState(isLoading: true) => const Center(
            child: CircularProgressIndicator(),
          ),

          MessageState(error: final error?) when error.isNotEmpty =>
            AppErrorState(
              message: error,
              onRetry: () => ref
                  .read(messageProvider(widget.conversationId).notifier)
                  .fetch(),
            ),

          MessageState(messages: final messages) when messages.isEmpty =>
            const AppEmptyState(
              icon: Icons.chat_bubble_outline,
              title: 'No messages yet',
              subtitle: 'Send a message to start the conversation',
            ),

          _ => _MessageList(
            state: state,
            conversationId: widget.conversationId,
            scrollController: _scrollController,
          ),
        },
      ),
    );
  }
}

class _MessageList extends StatelessWidget {
  const _MessageList({
    required this.state,
    required this.conversationId,
    required this.scrollController,
  });

  final MessageState state;
  final String conversationId;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      reverse: true,
      itemCount: state.messages.length + (state.isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == state.messages.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        return _MessageBubble(
          message: state.messages[index],
          conversationId: conversationId,
        );
      },
    );
  }
}

class _MessageBubble extends ConsumerWidget {
  const _MessageBubble({
    required this.message,
    required this.conversationId,
  });

  final Message message;
  final String conversationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(authProvider).value;
    final isMe = message.senderId == currentUser?.id;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isMe
              ? colorScheme.primary
              : colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isMe ? 16 : 4),
            bottomRight: Radius.circular(isMe ? 4 : 16),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: isMe
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            if (!isMe && message.sender != null)
              Text(
                message.sender!.name,
                style: textTheme.labelSmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (!isMe && message.sender != null) const SizedBox(height: 2),
            Text(
              message.isDeleted ? 'This message was deleted' : message.content,
              style: textTheme.bodyMedium?.copyWith(
                color: isMe ? colorScheme.onPrimary : colorScheme.onSurface,
                fontStyle: message.isDeleted
                    ? FontStyle.italic
                    : FontStyle.normal,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              TimeUtils.timeAgo(message.createdAt),
              style: textTheme.labelSmall?.copyWith(
                color: isMe
                    ? colorScheme.onPrimary.withValues(alpha: 0.7)
                    : colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
