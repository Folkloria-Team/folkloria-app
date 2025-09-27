import 'package:flutter/material.dart';
import 'package:folkloria/data/models/book.dart';
import 'package:folkloria/ui/widgets/book_recomendation_card_widget.dart';
import 'package:folkloria/common/static/navigation_route.dart';

class RecomendationBook extends StatelessWidget {
  const RecomendationBook({super.key, required this.bookList});

  final List<Book> bookList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Rekomendasi Buku',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                height: 1.27,
              ),
            ),
            TextButton.icon(
              onPressed: () {
                // Navigator.pushNamed(
                // context,
                // NavigationRoute.recommendationRoute.name,
                // );
              },
              icon: const Icon(Icons.arrow_forward, color: Colors.black),
              iconAlignment: IconAlignment.end,
              label: const Text(
                'Lihat Semua',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  height: 1.33,
                  letterSpacing: 0.40,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 250.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: bookList.length,
            itemBuilder: (context, index) {
              final book = bookList[index];

              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: BookRecomendationCard(
                  book: book,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      NavigationRoute.detailRoute.name,
                      arguments: book.id,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
