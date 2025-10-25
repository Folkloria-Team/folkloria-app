import 'package:flutter/material.dart';
import 'package:folkloria/data/models/story.dart';

class BookRecomendationCard extends StatelessWidget {
  final Story book;
  final Function() onTap;

  const BookRecomendationCard({
    super.key,
    required this.book,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 140, // Fixed width to prevent overflow
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 140,
              height: 200,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://bekup-api.radifa.my.id/api${book.cover}',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: const Icon(
                        Icons.book,
                        size: 40,
                        color: Colors.grey,
                      ),
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: Colors.grey[200],
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: 140,
              child: Text(
                book.title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                  letterSpacing: 0.25,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
