import 'package:flutter/material.dart';
import 'package:folkloria/ui/widgets/book_tab_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:folkloria/providers/book/local_database_provider.dart';
import 'package:folkloria/common/static/navigation_route.dart';
import 'package:folkloria/ui/widgets/book_card_widget.dart';

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
      context.read<LocalDatabaseProvider>().loadAllFavoriteValue();
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
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color(0xFF45492F),
        ),
        body: Column(
          children: [
            // Tab Bar dengan styling custom
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF46483B),
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
                        true => ListView.builder(
                          padding: const EdgeInsets.all(8.0),
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
                        _ => Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).colorScheme.primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(
                                16.0,
                              ), // Ubah nilai ini untuk mengatur radius
                            ),
                            margin: const EdgeInsets.fromLTRB(20, 20, 20, 120),
                            padding: const EdgeInsets.all(24.0),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Image(
                                    image: AssetImage(
                                      'images/illustration_book.png',
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    "Baca lagi nanti",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Buku yang kamu simpan akan tersusun rapi di rak buku.",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      };
                    },
                  ),
                  // Tab Unduhan
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(
                          16.0,
                        ), // Ubah nilai ini untuk mengatur radius
                      ),
                      margin: const EdgeInsets.fromLTRB(20, 20, 20, 120),
                      padding: const EdgeInsets.all(24.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              image: AssetImage(
                                'images/illustration_open_book.png',
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              "Kamu belum mengunduh..",
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Unduh buku cerita untuk dibaca secara luring!",
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
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
