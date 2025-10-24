import 'package:flutter/material.dart';
import 'package:folkloria/data/models/story.dart';
import 'package:provider/provider.dart';
import 'package:folkloria/data/models/book.dart';
import 'package:folkloria/providers/detail/download_icon_provider.dart';
import 'package:folkloria/providers/book/local_database_provider.dart';

class DownloadIconWidget extends StatefulWidget {
  final Story book;

  const DownloadIconWidget({super.key, required this.book});

  @override
  State<DownloadIconWidget> createState() => _DownloadIconWidgetState();
}

class _DownloadIconWidgetState extends State<DownloadIconWidget> {
  @override
  void initState() {
    super.initState();
    final localDatabaseProvider = context.read<LocalDatabaseProvider>();
    final downloadIconProvider = context.read<DownloadIconProvider>();

    Future.microtask(() async {
      // todo-03-action-03: change this action using LocalDatabaseProvider
      await localDatabaseProvider.loadDownloadValueById(widget.book.id);
      final value = localDatabaseProvider.checkItemDownload(widget.book.id);
      if (!mounted) return;
      downloadIconProvider.isDownloaded = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final localDatabaseProvider = context.read<LocalDatabaseProvider>();
        final downloadIconProvider = context.read<DownloadIconProvider>();
        final isDownloadd = downloadIconProvider.isDownloaded;

        if (isDownloadd) {
          localDatabaseProvider.removeDownloadValueById(widget.book.id);
        } else {
          localDatabaseProvider.saveDownloadValue(widget.book);
        }
        downloadIconProvider.isDownloaded = !isDownloadd;
      },
      icon: Icon(
        context.watch<DownloadIconProvider>().isDownloaded
            ? Icons.delete
            : Icons.download,
      ),
    );
  }
}
