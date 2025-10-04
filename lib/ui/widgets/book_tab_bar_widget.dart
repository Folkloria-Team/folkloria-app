import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: const [
        Tab(text: "Favorit"),
        Tab(text: "Unduhan"),
      ],
      labelColor: const Color(0xFF45492F),
      unselectedLabelColor: Colors.white,
      labelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 15,
      ),
      indicator: BoxDecoration(
        color: const Color(0xFFDDEA97),
        borderRadius: BorderRadius.circular(24),
      ),
      indicatorPadding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 4,
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
    );
  }
}
