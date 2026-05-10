import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kitchen_operations/app/app_theme.dart';
import 'package:kitchen_operations/viewmodels/schedule_viewmodel.dart';
import 'package:kitchen_operations/views/widgets/bottom_nav_bar.dart';

class ScheduleScreen extends StatefulWidget{
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  //tracks which bottom nav item is active
  int _currentNavIndex = 3;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ScheduleViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        title: const Text(
          'Kitchen Operations',
          style: AppTextStyles.heading,
        ),
      ),
      body: Column(
        children: [
          _buildTabBar(viewModel),
          Expanded(
            child: _buildBody(viewModel),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentNavIndex, 
        onTap: (index) {
          setState(() {
          _currentNavIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildTabBar(ScheduleViewModel viewModel) {
    final tabs = [
      'Schedule', 'Live Orders', 'Shelf Life Items',
      'Preprepared Items', 'Leftover',
      'Purchase Confirmation', 'Current Stock'
    ];

    return Container(
      color: AppColors.surface,
      height: 44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          final isSelected = viewModel.selectedTabIndex == index;
          return GestureDetector(
            onTap: () => viewModel.changeTab(index),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.border,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                tabs[index],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isSelected 
                    ? AppColors.surface
                    : AppColors.textSecondary, 
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  Widget _buildBody(ScheduleViewModel viewModel) {
    
    //for now only schedule tab show content
    if(viewModel.selectedTabIndex == 0) {
      return const Center(
        child: Text('Schedule Content Here'),
      );
    }
    return const Center(
      child: Text('Coming Soon'),
    );
  }
}