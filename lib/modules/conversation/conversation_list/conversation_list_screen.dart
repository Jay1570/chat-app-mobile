import 'dart:async';

import 'package:chathub/core/utils/responsive.dart';
import 'package:chathub/modules/conversation/conversation_list/layouts/dual_panel_layout.dart';
import 'package:chathub/modules/conversation/conversation_list/layouts/single_panel_layout.dart';
import 'package:chathub/modules/conversation/models/conversation.dart';
import 'package:chathub/modules/conversation/conversation_list/conversation_list_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConversationListScreen extends ConsumerStatefulWidget {
  const ConversationListScreen({super.key});

  @override
  ConsumerState<ConversationListScreen> createState() =>
      _ConversationListScreenState();
}

class _ConversationListScreenState
    extends ConsumerState<ConversationListScreen> {
  final _searchController = TextEditingController();
  final _scrollController = ScrollController();
  Conversation? _selectedConversation;
  Timer? _searchDebounce;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(conversationListProvider.notifier).fetchMore();
    }
  }

  void _onConversationTap(Conversation conversation) {
    if (context.showDualPanel) {
      setState(() => _selectedConversation = conversation);
    } else {
      // push chat screen
    }
  }

  void _onSearchChanged(String query) {
    _searchDebounce?.cancel();

    _searchDebounce = Timer(
      const Duration(milliseconds: 400),
      () {
        ref.read(conversationListProvider.notifier).fetch(search: query);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return context.showDualPanel
        ? DualPanelLayout(
            selectedConversation: _selectedConversation,
            onConversationTap: _onConversationTap,
            searchController: _searchController,
            scrollController: _scrollController,
            onSearchChange: _onSearchChanged,
          )
        : SinglePanelLayout(
            searchController: _searchController,
            scrollController: _scrollController,
            onConversationTap: _onConversationTap,
            onSearchChange: _onSearchChanged,
          );
  }
}
