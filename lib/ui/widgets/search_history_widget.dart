import 'package:flutter/material.dart';

class SearchHistoryWidget extends StatelessWidget {
  final List<String> searchHistory;
  final VoidCallback? onClearHistory;
  final Function(String)? onHistoryItemTapped;

  const SearchHistoryWidget({
    super.key,
    required this.searchHistory,
    this.onClearHistory,
    this.onHistoryItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    if (searchHistory.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Pencarian Terakhir',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              if (onClearHistory != null)
                TextButton(
                  onPressed: onClearHistory,
                  child: const Text('Hapus', style: TextStyle(fontSize: 12)),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: searchHistory.take(5).map((query) {
              return GestureDetector(
                onTap: () {
                  if (onHistoryItemTapped != null) {
                    onHistoryItemTapped!(query);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 6.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(color: Colors.blue[200]!),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.history, size: 14, color: Colors.blue),
                      const SizedBox(width: 4),
                      Text(
                        query,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
