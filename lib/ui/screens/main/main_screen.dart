import 'package:flutter/material.dart';
import 'package:folkloria/providers/main/index_nav_provider.dart';
import 'package:folkloria/ui/screens/favorite/favorite_screen.dart';
import 'package:folkloria/ui/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:folkloria/ui/screens/setting/setting_page.dart';
// import 'package:floaty_nav_bar/floaty_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<IndexNavProvider>(
        builder: (context, value, child) {
          return switch (value.indexBottomNavBar) {
            0 => const HomeScreen(),
            1 => const FavoriteScreen(),
            _ => const SettingPage(),
          };
        },
      ),
      extendBody: true,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(80)),
          child: BottomNavigationBar(
            currentIndex: context.watch<IndexNavProvider>().indexBottomNavBar,
            onTap: (index) {
              context.read<IndexNavProvider>().setIndextBottomNavBar = index;
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                tooltip: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: "Favorites",
                tooltip: "Favorites",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Settings",
                tooltip: "Settings",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
