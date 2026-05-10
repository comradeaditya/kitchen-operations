import 'package:flutter/material.dart';
import 'package:kitchen_operations/app/app_theme.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 10,
      unselectedFontSize: 10,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard_outlined),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.receipt_outlined),
          label: 'Take Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.food_bank_outlined),
          label: 'Prepare Order',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.kitchen_outlined),
          label: 'Kitchen Operation',
        ),
      ],
    );
  }
}