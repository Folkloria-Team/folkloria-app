import 'package:flutter/material.dart';
import 'package:folkloria/common/style/typography/folkloria_text_styles.dart';
import 'package:folkloria/data/models/book.dart';
import 'package:folkloria/common/static/constants.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final Function() onTap;

  const BookCard({super.key, required this.book, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  '$baseUrl/images/small/${book.pictureId}',
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
          ),
          const SizedBox(height: 8),
          Text(
            book.name,
            style: FolkloriaTextStyles.bodyLargeBold,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 1),
          Text(
            book.city,
            style: FolkloriaTextStyles.bodyLargeMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
