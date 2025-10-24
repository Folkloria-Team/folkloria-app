import 'package:flutter/material.dart';
import 'package:folkloria/data/models/story.dart';
// import 'package:folkloria/data/models/book_detail.dart';
import 'package:folkloria/data/models/story_detail.dart';
import 'package:folkloria/ui/screens/read/read_screen.dart';
import 'package:folkloria/providers/detail/download_icon_provider.dart';
import 'package:folkloria/ui/widgets/download_icon_widget.dart';
import 'package:provider/provider.dart';
import 'package:folkloria/data/models/book.dart';
import 'package:folkloria/providers/detail/favorite_icon_provider.dart';
import 'package:folkloria/providers/detail/book_detail_provider.dart';
import 'package:folkloria/common/static/book_detail_result_state.dart';
import 'package:folkloria/ui/widgets/favorite_icon_widget.dart';

class BodyOfDetailScreenWidget extends StatelessWidget {
  final StoryDetail bookDetail;
  const BodyOfDetailScreenWidget({super.key, required this.bookDetail});

  @override
  Widget build(BuildContext context) {
    final imageUrl = 'https://bekup-api.radifa.my.id/api${bookDetail.cover}';

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Gambar buku
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://bekup-api.radifa.my.id/api${bookDetail.cover}',
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.broken_image,
                    size: 100,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Judul buku
            Text(
              bookDetail.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),

            // Asal daerah
            Text(
              bookDetail.island,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
            ),
            const SizedBox(height: 24),

            // Tombol Action
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChangeNotifierProvider(
                  create: (context) => DownloadIconProvider(),
                  child: Consumer<BookDetailProvider>(
                    builder: (context, value, child) {
                      return switch (value.resultState) {
                        BookDetailLoadedState(data: var bookDetail) =>
                          DownloadIconWidget(
                            book: Story(
                              id: bookDetail.id,
                              provinceId: bookDetail.provinceId,
                              title: bookDetail.title,
                              sinopsis: bookDetail.sinopsis,
                              content: bookDetail.content,
                              cover: bookDetail.cover,
                              island: bookDetail.island,
                            ),
                          ),
                        _ => const SizedBox(),
                      };
                    },
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ReadScreen(bookDetail: bookDetail),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF566E3D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    "Baca Buku",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16),
                ChangeNotifierProvider(
                  create: (context) => FavoriteIconProvider(),
                  child: Consumer<BookDetailProvider>(
                    builder: (context, value, child) {
                      return switch (value.resultState) {
                        BookDetailLoadedState(data: var bookDetail) =>
                          FavoriteIconWidget(
                            book: Story(
                              id: bookDetail.id,
                              provinceId: bookDetail.provinceId,
                              title: bookDetail.title,
                              sinopsis: bookDetail.sinopsis,
                              content: bookDetail.content,
                              cover: bookDetail.cover,
                              island: bookDetail.island,
                            ),
                          ),
                        _ => const SizedBox(),
                      };
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Sinopsis
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Sinopsis",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              bookDetail.sinopsis,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
