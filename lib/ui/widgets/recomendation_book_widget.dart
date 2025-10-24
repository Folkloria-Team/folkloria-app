import 'package:flutter/material.dart';
import 'package:folkloria/data/models/book.dart';
import 'package:folkloria/data/models/story.dart';
import 'package:folkloria/ui/widgets/book_recomendation_card_widget.dart';
import 'package:folkloria/common/static/navigation_route.dart';

class RecomendationBook extends StatelessWidget {
  final List<Story> bookList;
  final String title;
  const RecomendationBook({
    super.key,
    required this.bookList,
    this.title = 'Rekomendasi Buku',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w800,
                  height: 1.27,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: TextButton.icon(
                onPressed: () {
                  // Navigator.pushNamed(
                  // context,
                  // NavigationRoute.recommendationRoute.name,
                  // );
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: const Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                  size: 16,
                ),
                iconAlignment: IconAlignment.end,
                label: const Text(
                  'Lihat Semua',
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
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: 250.0,
          child: bookList.isEmpty
              ? const Center(
                  child: Text(
                    'Tidak ada buku tersedia',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bookList.length,
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, index) {
                    final book = bookList[index];

                    return Container(
                      width: 140, // Fixed width to prevent overflow
                      margin: const EdgeInsets.only(right: 10.0),
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
