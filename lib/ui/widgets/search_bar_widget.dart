import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:folkloria/providers/home/book_list_provider.dart';
import 'package:folkloria/ui/widgets/search_history_widget.dart';
import 'dart:async';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Timer? _debounceTimer;
  bool _showHistory = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    _searchController.removeListener(_onSearchChanged);
    _focusNode.removeListener(_onFocusChanged);
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    setState(() {
      _showHistory = _focusNode.hasFocus && _searchController.text.isEmpty;
    });
  }

  void _onSearchChanged() {
    _debounceTimer?.cancel();

    setState(() {
      _showHistory = _focusNode.hasFocus && _searchController.text.isEmpty;
    });

    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      if (mounted) {
        final provider = context.read<BookListProvider>();
        provider.searchBooks(_searchController.text);
      }
    });
  }

  void _clearSearch() {
    _searchController.clear();
    if (mounted) {
      final provider = context.read<BookListProvider>();
      provider.clearSearch();
    }
  }

  void _selectHistoryItem(String query) {
    _searchController.text = query;
    _focusNode.unfocus();
    setState(() {
      _showHistory = false;
    });
    if (mounted) {
      final provider = context.read<BookListProvider>();
      provider.searchBooks(query);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: TextField(
            controller: _searchController,
            focusNode: _focusNode,
            decoration: InputDecoration(
              hintText: 'Cari buku, deskripsi, atau kota...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: Consumer<BookListProvider>(
                builder: (context, provider, child) {
                  if (provider.searchQuery.isNotEmpty) {
                    return IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: _clearSearch,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[200],
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 15.0,
              ),
            ),
          ),
        ),
        // Show search history when focused and text is empty
        if (_showHistory)
          Consumer<BookListProvider>(
            builder: (context, provider, child) {
              return SearchHistoryWidget(
                searchHistory: provider.searchHistory,
                onHistoryItemTapped: _selectHistoryItem,
                onClearHistory: () {
                  provider.clearSearchHistory();
                },
              );
            },
          ),
      ],
    );
  }
}
