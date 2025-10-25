import 'package:flutter/material.dart';
import 'package:folkloria/data/models/story.dart';
import 'package:provider/provider.dart';
import 'package:folkloria/providers/detail/favorite_icon_provider.dart';
import 'package:folkloria/providers/book/local_database_provider.dart';

class FavoriteIconWidget extends StatefulWidget {
  final Story book;

  const FavoriteIconWidget({super.key, required this.book});

  @override
  State<FavoriteIconWidget> createState() => _FavoriteIconWidgetState();
}

class _FavoriteIconWidgetState extends State<FavoriteIconWidget> {
  @override
  void initState() {
    super.initState();
    final localDatabaseProvider = context.read<LocalDatabaseProvider>();
    final favoriteIconProvider = context.read<FavoriteIconProvider>();

    Future.microtask(() async {
      // todo-03-action-03: change this action using LocalDatabaseProvider
      await localDatabaseProvider.loadFavoriteValueById(widget.book.id);
      final value = localDatabaseProvider.checkItemFavorite(widget.book.id);
      if (!mounted) return;
      favoriteIconProvider.isFavorited = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final localDatabaseProvider = context.read<LocalDatabaseProvider>();
        final favoriteIconProvider = context.read<FavoriteIconProvider>();
        final isFavorited = favoriteIconProvider.isFavorited;

        if (isFavorited) {
          localDatabaseProvider.removeFavoriteValueById(widget.book.id);
        } else {
          localDatabaseProvider.saveFavoriteValue(widget.book);
        }
        favoriteIconProvider.isFavorited = !isFavorited;
      },
      icon: Icon(
        context.watch<FavoriteIconProvider>().isFavorited
            ? Icons.favorite
            : Icons.favorite_outline,
      ),
    );
  }
}
