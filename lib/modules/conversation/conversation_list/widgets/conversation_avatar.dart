import 'package:chathub/modules/conversation/models/conversation.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({
    super.key,
    required this.conversation,
  });

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (conversation.type == 'direct') {
      final other = conversation.otherUsers.firstOrNull;
      return CircleAvatar(
        radius: 24,
        backgroundColor: colorScheme.primaryContainer,
        child: Text(
          (other?.name ?? '?')[0].toUpperCase(),
          style: TextStyle(
            color: colorScheme.onPrimaryContainer,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    final others = conversation.otherUsers.take(2).toList();
    return SizedBox(
      width: 48,
      height: 48,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: colorScheme.secondaryContainer,
              child: Text(
                (others.elementAtOrNull(1)?.name ?? '?')[0].toUpperCase(),
                style: TextStyle(
                  color: colorScheme.onSecondaryContainer,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: colorScheme.primaryContainer,
              child: Text(
                (others.elementAtOrNull(0)?.name ?? '?')[0].toUpperCase(),
                style: TextStyle(
                  color: colorScheme.onPrimaryContainer,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
