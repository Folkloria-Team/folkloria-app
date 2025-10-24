import 'dart:async';

import 'package:flutter/material.dart';
import 'package:folkloria/providers/detail/download_icon_provider.dart';
import 'package:folkloria/ui/widgets/download_icon_widget.dart';
import 'package:provider/provider.dart';
import 'package:folkloria/data/models/book.dart';
import 'package:folkloria/providers/detail/favorite_icon_provider.dart';
import 'package:folkloria/providers/detail/book_detail_provider.dart';
import 'package:folkloria/ui/screens/detail/body_of_detail_screen_widget.dart';
import 'package:folkloria/common/static/book_detail_result_state.dart';
import 'package:folkloria/ui/widgets/favorite_icon_widget.dart';

class DetailScreen extends StatefulWidget {
  final String bookId;

  const DetailScreen({super.key, required this.bookId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      if (!mounted) return;
      context.read<BookDetailProvider>().fetchBookDetail(widget.bookId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // TODO: Tambahkan button icon share di sini nanti
        ],
      ),
      body: Consumer<BookDetailProvider>(
        builder: (context, value, child) {
          return switch (value.resultState) {
            BookDetailLoadingState() => const Center(
              child: CircularProgressIndicator(),
            ),
            BookDetailLoadedState(data: var bookDetail) =>
              BodyOfDetailScreenWidget(bookDetail: bookDetail),
            BookDetailErrorState(error: var message) => Center(
              child: Text(message),
            ),
            _ => const SizedBox(),
          };
        },
      ),
    );
  }
}
