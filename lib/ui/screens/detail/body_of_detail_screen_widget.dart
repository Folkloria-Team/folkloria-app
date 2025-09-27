import 'package:flutter/material.dart';
import 'package:folkloria/data/models/book_detail.dart';
import 'package:folkloria/common/static/constants.dart';

class BodyOfDetailScreenWidget extends StatelessWidget {
  const BodyOfDetailScreenWidget({super.key, required this.bookDetail});

  final BookDetail bookDetail;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              '$baseUrl/images/large/${bookDetail.pictureId}',
              fit: BoxFit.cover,
            ),
            const SizedBox.square(dimension: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bookDetail.name,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        bookDetail.address,
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        bookDetail.city,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber),
                    const SizedBox.square(dimension: 4),
                    Text(
                      bookDetail.rating.toString(),
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox.square(dimension: 16),
            // Categories Section
            if (bookDetail.categories.isNotEmpty) ...[
              Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: bookDetail.categories
                      .map(
                        (category) => Chip(
                          label: Text(
                            category.name,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          backgroundColor: Colors.orange[600],
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox.square(dimension: 16),
            ],
            Text(
              bookDetail.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox.square(dimension: 24),
            // Menu Foods Section
            if (bookDetail.menu.foods.isNotEmpty) ...[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Menu Foods',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox.square(dimension: 12),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bookDetail.menu.foods.length,
                  itemBuilder: (context, index) {
                    final food = bookDetail.menu.foods[index];
                    return Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 12),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.restaurant_menu,
                                size: 32,
                                color: Colors.orange[600],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                food.name,
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox.square(dimension: 20),
            ],
            // Menu Drinks Section
            if (bookDetail.menu.drinks.isNotEmpty) ...[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Menu Drinks',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox.square(dimension: 12),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bookDetail.menu.drinks.length,
                  itemBuilder: (context, index) {
                    final drink = bookDetail.menu.drinks[index];
                    return Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 12),
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.local_drink,
                                size: 32,
                                color: Colors.blue[600],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                drink.name,
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
