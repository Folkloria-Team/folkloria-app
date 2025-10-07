import 'package:flutter/material.dart';
import 'package:folkloria/common/style/colors/folkloria_colors.dart';
import 'package:folkloria/common/style/typography/folkloria_text_styles.dart';
import 'package:folkloria/ui/screens/book/book_list_empty_widget.dart';
import 'package:folkloria/ui/widgets/book_card_widget.dart';
import 'package:folkloria/ui/widgets/book_tab_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:folkloria/providers/book/local_database_provider.dart';
import 'package:folkloria/common/static/navigation_route.dart';
import 'package:folkloria/common/static/constants.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        context.read<LocalDatabaseProvider>().loadAllFavoriteValue();
        context.read<LocalDatabaseProvider>().loadAllDownloadValue();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Buku Saya",
            style: FolkloriaTextStyles.titleLarge.copyWith(
              color: Theme.of(context).colorScheme.onTertiary,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.onSecondaryContainer,
        ),
        backgroundColor: Theme.of(context).colorScheme.onTertiary,
        body: Column(
          children: [
            // Tab Bar dengan styling custom
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              height: 48,
              decoration: BoxDecoration(
                color: FolkloriaColors.onSurfaceVariant,
                borderRadius: BorderRadius.circular(24),
              ),
              child: TabBarWidget(),
            ),
            // Tab Bar View dengan konten
            Expanded(
              child: TabBarView(
                children: [
                  // Tab Favorit
                  Consumer<LocalDatabaseProvider>(
                    builder: (context, value, child) {
                      final favoriteList = value.favoriteList ?? [];

                      return switch (favoriteList.isNotEmpty) {
                        true => GridView.builder(
                          padding: const EdgeInsets.fromLTRB(
                            16.0, // left
                            16.0, // top
                            16.0, // right
                            100.0, // bottom - jarak untuk bottom navigation
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, // 2 kolom
                                crossAxisSpacing: 16.0, // Jarak antar kolom
                                mainAxisSpacing: 16.0, // Jarak antar baris
                                childAspectRatio:
                                    0.65, // Rasio lebar:tinggi - optimized untuk grid card
                              ),
                          itemCount: favoriteList.length,
                          itemBuilder: (context, index) {
                            final book = favoriteList[index];

                            return BookCard(
                              book: book,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  NavigationRoute.detailRoute.name,
                                  arguments: book.id,
                                );
                              },
                            );
                          },
                        ),
                        _ => const BookListEmptyWidget(
                          imagePath: 'assets/images/illustration_book.png',
                          title: "Baca lagi nanti",
                          subtitle:
                              "Buku yang kamu simpan akan tersusun rapi di rak buku.",
                        ),
                      };
                    },
                  ),
                  // Tab Unduhan
                  Consumer<LocalDatabaseProvider>(
                    builder: (context, value, child) {
                      final downloadList = value.downloadList ?? [];

                      return switch (downloadList.isNotEmpty) {
                        true => GridView.builder(
                          padding: const EdgeInsets.fromLTRB(
                            16.0, // left
                            16.0, // top
                            16.0, // right
                            100.0, // bottom - jarak untuk bottom navigation
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, // 2 kolom
                                crossAxisSpacing: 16.0, // Jarak antar kolom
                                mainAxisSpacing: 16.0, // Jarak antar baris
                                childAspectRatio:
                                    0.65, // Rasio lebar:tinggi - optimized untuk grid card
                              ),
                          itemCount: downloadList.length,
                          itemBuilder: (context, index) {
                            final book = downloadList[index];

                            return BookCard(
                              book: book,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  NavigationRoute.detailRoute.name,
                                  arguments: book.id,
                                );
                              },
                            );
                          },
                        ),
                        _ => const BookListEmptyWidget(
                          imagePath: 'assets/images/illustration_open_book.png',
                          title: "Kamu belum mengunduh..",
                          subtitle:
                              "Unduh buku cerita untuk dibaca secara luring!",
                        ),
                      };
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
