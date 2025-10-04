import 'package:flutter/material.dart';
import 'package:folkloria/ui/widgets/recomendation_book_widget.dart';
import 'package:provider/provider.dart';
import 'package:folkloria/providers/home/book_list_provider.dart';
import 'package:folkloria/ui/widgets/search_bar_widget.dart';
import 'package:folkloria/common/static/book_list_result_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      if (mounted) {
        context.read<BookListProvider>().fetchBookList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF45492F),
        elevation: 0,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Halo Alan',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Selamat datang!',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        titleSpacing: 20,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.purple.shade400,
              child: Text(
                'A',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration: ShapeDecoration(
              color: const Color(0xFFDDEA97) /* Schemes-Primary-Container */,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: const SearchBarWidget(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16.0,
              ),
              child: Consumer<BookListProvider>(
                builder: (context, value, child) {
                  return switch (value.resultState) {
                    BookListLoadingState() => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    BookListLoadedState(data: var bookList) =>
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              RecomendationBook(
                                title: 'Pulau Jawa',
                                bookList: bookList,
                              ),
                              SizedBox(height: 12),
                              RecomendationBook(
                                title: 'Pulau Sumatera',
                                bookList: bookList,
                              ),
                              SizedBox(height: 12),
                              RecomendationBook(
                                title: 'Pulau Kalimantan',
                                bookList: bookList,
                              ),
                              SizedBox(height: 48),
                            ],
                          ),
                        ),
                      ),
                    BookListErrorState(error: var message) => Center(
                      child: Text(message),
                    ),
                    _ => const SizedBox(),
                  };
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 84.0),
        child: FloatingActionButton.extended(
          onPressed: () {
            // Action when the button is pressed
          },
          backgroundColor: const Color(0xFF596420),
          icon: const Icon(Icons.location_on, color: Colors.white),
          label: Text(
            'Mode Peta',
            style: TextStyle(
              color: Colors.white,
              // fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
