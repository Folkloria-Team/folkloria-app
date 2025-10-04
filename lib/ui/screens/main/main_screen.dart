import 'package:flutter/material.dart';
import 'package:folkloria/providers/main/index_nav_provider.dart';
import 'package:folkloria/ui/screens/favorite/favorite_screen.dart';
import 'package:folkloria/ui/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:folkloria/ui/screens/setting/setting_page.dart';
import 'package:folkloria/ui/widgets/bottom_item_nav_widget.dart';

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
            backgroundColor: const Color(0xFFF0EEE2),
            currentIndex: context.watch<IndexNavProvider>().indexBottomNavBar,
            onTap: (index) {
              context.read<IndexNavProvider>().setIndextBottomNavBar = index;
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(
              0xFF1D1B20,
            ), // Putih untuk text yang dipilih
            unselectedItemColor: const Color(
              0xFF45492F,
            ), // Hijau tua untuk text yang tidak dipilih
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: Colors.white, // Putih untuk label yang dipilih
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 11,
              color: Color(
                0xFF45492F,
              ), // Hijau tua untuk label yang tidak dipilih
            ),
            items: [
              BottomNavigationBarItem(
                icon: BottomItemNavWidget(
                  icon: Icons.location_on,
                  isSelected:
                      context.watch<IndexNavProvider>().indexBottomNavBar == 0,
                ),
                label: "Beranda",
                tooltip: "Beranda",
              ),
              BottomNavigationBarItem(
                icon: BottomItemNavWidget(
                  icon: Icons.bookmark_outline,
                  isSelected:
                      context.watch<IndexNavProvider>().indexBottomNavBar == 1,
                ),
                label: "Buku",
                tooltip: "Buku",
              ),
              BottomNavigationBarItem(
                icon: BottomItemNavWidget(
                  icon: Icons.person_outline,
                  isSelected:
                      context.watch<IndexNavProvider>().indexBottomNavBar == 2,
                ),
                label: "Profil",
                tooltip: "Profil",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
