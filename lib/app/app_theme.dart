import 'package:flutter/material.dart';

// Centralized color palette for the entire app
class AppColors {
  static const Color primary = Color(0xFF1C1C2E);
  static const Color background = Color(0xFFF4F4F6);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color border = Color(0xFFD0D5DD);
  static const Color textPrimary = Color(0xFF1C1C2E);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color warning = Color(0xFFFF4444);
  static const Color shiftGreen = Color(0xFFE8F5E9);
}

//Reusable text styles based on Figma design
class AppTextStyles{
  static const TextStyle heading = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static const TextStyle subheading = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );
}

class AppTheme {
  static ThemeData get lightTheme {
    return  ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'Inter',
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      tabBarTheme: const TabBarThemeData(
        labelColor: AppColors.surface,
        unselectedLabelColor: AppColors.textSecondary,
      ),
    );
  }
}