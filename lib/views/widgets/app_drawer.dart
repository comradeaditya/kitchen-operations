import 'package:flutter/material.dart';
import 'package:kitchen_operations/app/app_theme.dart';

class AppDrawer  extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primary,

      child: Column(
        children: [
          //drawer header
          _buildDrawerHeader(),
          const SizedBox(height: 16),
          //menu items
          _buildMenuItem(
            context,
            icon: Icons.dashboard_outlined,
            title: 'Dashboard',
            onTap: () => Navigator.pop(context),
          ),
          _buildMenuItem(
            context,
            icon: Icons.calendar_today_outlined,
            title: 'Schedule',
            isActive: true,
            onTap: () => Navigator.pop(context),
          ),
          _buildMenuItem(
            context,
            icon: Icons.receipt_outlined,
            title: 'Live Orders',
            onTap: () => Navigator.pop(context),
          ),
          _buildMenuItem(
            context,
            icon: Icons.kitchen_outlined,
            title: 'Shelf Life Items',
            onTap: () => Navigator.pop(context),
          ),
          _buildMenuItem(
            context,
            icon: Icons.food_bank_outlined,
            title: 'Preprepared Items',
            onTap: () => Navigator.pop(context),
          ),
          _buildMenuItem(
            context,
            icon: Icons.inventory_outlined,
            title: 'Current Stock',
            onTap: () => Navigator.pop(context),
          ),
          const Spacer(),
          //logout button
          _buildMenuItem(
            context,
            icon: Icons.logout_outlined,
            title: 'Logout',
            onTap: () => Navigator.pop(context),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 60, left: 20, bottom: 20),
      child: Row(
        children: [
          //avatar
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.surface.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Icon(
              Icons.person_outlined,
              color: AppColors.surface,
              size: 28,
            ),
          ),
          const SizedBox(width: 12),
          //user info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Rajeev Singh',
                style: TextStyle(
                  color: AppColors.surface,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Head Chef',
                style: TextStyle(
                  color: AppColors.surface.withValues(alpha: 0.7),
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
      required IconData icon,
      required String title,
      bool isActive = false,
      required VoidCallback onTap,
    }) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isActive
            ? AppColors.surface.withValues(alpha: 0.15)
            : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Icon(icon, color: AppColors.surface, size: 20),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.surface,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    }
    }