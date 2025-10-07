import 'package:flutter/material.dart';
import 'package:folkloria/common/style/colors/folkloria_colors.dart';
import 'package:folkloria/common/style/typography/folkloria_text_styles.dart';

class BookListEmptyWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  const BookListEmptyWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.fromLTRB(20.0, 10, 20.0, 120.0),
      decoration: BoxDecoration(
        border: Border.all(color: FolkloriaColors.primary, width: 2.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            SizedBox(height: 16),
            Text(title, style: FolkloriaTextStyles.titleLarge),
            SizedBox(height: 8),
            Text(
              subtitle,
              style: FolkloriaTextStyles.bodyLargeRegular,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
