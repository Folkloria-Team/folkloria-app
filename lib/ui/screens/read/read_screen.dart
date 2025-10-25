import 'package:flutter/material.dart';
import 'package:folkloria/data/models/story_detail.dart';
import 'package:folkloria/ui/screens/read/result_screen.dart';

class ReadScreen extends StatefulWidget {
  final StoryDetail bookDetail;

  const ReadScreen({super.key, required this.bookDetail});

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_hasNavigated) return; // biar gak double trigger
      if (!_scrollController.hasClients) return;

      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;

      // Kalau scroll-nya sudah mendekati bawah (atau kalau konten terlalu pendek)
      if (maxScroll < 200 || currentScroll >= maxScroll - 50) {
        _hasNavigated = true;

        // Pastikan widget masih aktif
        if (!mounted) return;

        Future.delayed(const Duration(milliseconds: 400), () {
          if (!mounted) return;

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => ResultScreen(
                title: widget.bookDetail.title,
                region: widget.bookDetail.island,
              ),
            ),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final imageUrl =
        'https://bekup-api.radifa.my.id/api${widget.bookDetail.cover}';

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 300,
                      color: Colors.grey[700],
                      child: const Icon(
                        Icons.broken_image,
                        size: 80,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.4),
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.4),
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black.withValues(alpha: 0.4),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.black.withValues(alpha: 0.4),
                          child: IconButton(
                            icon: const Icon(Icons.share, color: Colors.white),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  color: theme.colorScheme.surface.withValues(alpha: 0.15),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.bookDetail.title,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.bookDetail.island,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: theme.colorScheme.surface,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: Text(
                    widget.bookDetail.content,
                    style: theme.textTheme.bodyLarge?.copyWith(height: 1.6),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
