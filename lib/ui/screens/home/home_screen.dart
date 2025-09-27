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
        title: Text('Beranda', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xFF45492F),
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
                              RecomendationBook(bookList: bookList),
                              SizedBox(height: 20),
                              RecomendationBook(bookList: bookList),
                              SizedBox(height: 20),
                              RecomendationBook(bookList: bookList),
                              SizedBox(height: 20),
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
    );
  }
}
