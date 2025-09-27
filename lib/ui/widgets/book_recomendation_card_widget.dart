import 'package:flutter/material.dart';
import 'package:folkloria/data/models/book.dart';
import 'package:folkloria/common/static/constants.dart';

class BookRecomendationCard extends StatelessWidget {
  final Book book;
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
      child: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Image.network(
                '$baseUrl/images/small/${book.pictureId}',
                width: 142,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8),
              Text(
                book.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  height: 1.43,
                  letterSpacing: 0.25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
