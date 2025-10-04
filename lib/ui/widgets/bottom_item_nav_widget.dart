import 'package:flutter/material.dart';

class BottomItemNavWidget extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  const BottomItemNavWidget({
    super.key,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFFE2E5C2) // Hijau tua seperti di gambar
            : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(
        icon,
        color: isSelected ? const Color(0xFF1D1B20) : const Color(0xFF45492F),
        size: 24,
      ),
    );
  }
}
