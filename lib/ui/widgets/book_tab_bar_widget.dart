import 'package:flutter/material.dart';
import 'package:folkloria/common/style/colors/folkloria_colors.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: const [
        Tab(text: "Favorit"),
        Tab(text: "Unduhan"),
      ],
      labelColor: FolkloriaColors.onPrimaryContainer,
      unselectedLabelColor: FolkloriaColors.onPrimary,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 15,
      ),
      indicator: BoxDecoration(
        color: FolkloriaColors.primaryContainer,
        borderRadius: BorderRadius.circular(24),
      ),
      indicatorPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
    );
  }
}
