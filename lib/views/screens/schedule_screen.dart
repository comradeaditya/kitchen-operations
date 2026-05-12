import 'package:flutter/material.dart';
import 'package:kitchen_operations/views/screens/shelf_life_screen.dart';
import 'package:provider/provider.dart';
import 'package:kitchen_operations/app/app_theme.dart';
import 'package:kitchen_operations/viewmodels/schedule_viewmodel.dart';
import 'package:kitchen_operations/views/widgets/bottom_nav_bar.dart';
import 'package:kitchen_operations/views/widgets/shift_card.dart';
import 'package:kitchen_operations/views/screens/live_orders_screen.dart';
import 'package:kitchen_operations/views/screens/shelf_life_screen.dart';
import 'package:kitchen_operations/views/widgets/app_drawer.dart';

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
      drawer: const AppDrawer(activeScreen: 'Schedule'),
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: AppColors.textPrimary),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        automaticallyImplyLeading: false, //removes back arrow
        title: const Text(
          'Kitchen Operations',
          style: AppTextStyles.heading,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                const Icon(Icons.calendar_today_outlined,
                  size: 16, color: AppColors.textSecondary),
                const SizedBox(width: 4),
                Text('22-02-2023', style: AppTextStyles.caption),
              ],
            ),
          ),
        ],
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
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LiveOrdersScreen(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ShelfLifeScreen(),
              ),
            );
          } else {
            viewModel.changeTab(index);
          }
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
            onTap: () {
              if(index == 1) {
                //navigate to Live Order Screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LiveOrdersScreen(),
                  ),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShelfLifeScreen()),
                );
              } else {
                viewModel.changeTab(index);
              }
            },
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
      return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: viewModel.shifts.length,
        itemBuilder: (context, index) {
          return ShiftCard(shift: viewModel.shifts[index]);
        },
      );
    }
    return const Center(
      child: Text('Coming Soon'),
    );
  }
}