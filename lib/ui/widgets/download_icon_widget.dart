import 'package:flutter/material.dart';
import 'package:folkloria/data/models/story.dart';
import 'package:provider/provider.dart';
import 'package:folkloria/providers/detail/download_icon_provider.dart';
import 'package:folkloria/providers/book/local_database_provider.dart';

class DownloadIconWidget extends StatefulWidget {
  final Story book;

  const DownloadIconWidget({super.key, required this.book});

  @override
  State<DownloadIconWidget> createState() => _DownloadIconWidgetState();
}

class _DownloadIconWidgetState extends State<DownloadIconWidget> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final downloadProvider = context.watch<DownloadIconProvider>();
    final localDatabaseProvider = context.read<LocalDatabaseProvider>();

    final isDownloaded = downloadProvider.isStoryDownloaded(widget.book.id);

    return IconButton(
      onPressed: _isLoading
          ? null
          : () async {
              setState(() => _isLoading = true);

              try {
                await downloadProvider.toggleDownload(widget.book);
                await localDatabaseProvider.loadAllDownloadValue();

                // ✅ Ambil ulang status terbaru setelah toggle selesai
                final updatedIsDownloaded = downloadProvider.isStoryDownloaded(
                  widget.book.id,
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      updatedIsDownloaded
                          ? 'Buku berhasil diunduh dan bisa dibaca offline! ✅'
                          : 'Buku dihapus dari unduhan. 🗑️',
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              } catch (e) {
                debugPrint("⚠️ Error saat toggle download: $e");
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Terjadi kesalahan, coba lagi ya 😅"),
                  ),
                );
              } finally {
                setState(() => _isLoading = false);
              }
            },
      icon: _isLoading
          ? const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Icon(
              isDownloaded ? Icons.delete : Icons.download,
              color: isDownloaded
                  ? Colors.redAccent
                  : Theme.of(context).iconTheme.color,
            ),
      tooltip: isDownloaded ? "Hapus unduhan" : "Unduh buku",
    );
  }
}
