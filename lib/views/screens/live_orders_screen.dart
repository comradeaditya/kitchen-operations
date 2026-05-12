import 'package:flutter/material.dart';
import 'package:kitchen_operations/views/screens/shelf_life_screen.dart';
import 'package:provider/provider.dart';
import 'package:kitchen_operations/app/app_theme.dart';
import 'package:kitchen_operations/viewmodels/orders_viewmodel.dart';
import 'package:kitchen_operations/viewmodels/schedule_viewmodel.dart';
import 'package:kitchen_operations/views/widgets/bottom_nav_bar.dart';
import 'package:kitchen_operations/views/widgets/order_card.dart';
import 'package:kitchen_operations/views/widgets/app_drawer.dart';

class LiveOrdersScreen extends StatefulWidget {
  const LiveOrdersScreen({super.key});

  @override
  State<LiveOrdersScreen> createState() => _LiveOrdersScreenState();
}

class _LiveOrdersScreenState extends State<LiveOrdersScreen> {
  int _currentNavIndex = 3;
  
  //tracks running orders vs (custom orders)
  int _selectedSubTab = 0;

  @override
  Widget build(BuildContext context) {
    final ordersViewModel = Provider.of<OrdersViewModel>(context);
    final scheduleViewModel = Provider.of<ScheduleViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: AppColors.textPrimary),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
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
              Text(
                '22-02-2023',
                style: AppTextStyles.caption,
              ),
            ],
          ),
        ),
      ],
    ),
    body: Column(
      children: [
        _buildTabBar(scheduleViewModel, context),
        _buildSubTabs(),
        Expanded(
          child: _buildBody(ordersViewModel),
        ),
      ],
    ),
    bottomNavigationBar: BottomNavBar(
      currentIndex: _currentNavIndex,
      onTap: (index) {
        if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ShelfLifeScreen(),
            ),
          );
        }
        setState(() {
          _currentNavIndex = index;
        });
      },
    ),
  );
  }

  Widget _buildTabBar(ScheduleViewModel viewModel, BuildContext context) {
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
          //Live Orders is index 1
          final isSelected = index == 1;
          return GestureDetector(
            onTap: () {
              if (index == 0) {
                //go back to Schedule screen
                Navigator.pop(context);
              } else if (index == 2) {
                //go to Shelf Life screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShelfLifeScreen(),
                  ),
                );
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

  Widget _buildSubTabs() {
    return Container(
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          _buildSubTab('Running Orders', 0),
          const SizedBox(width: 24),
          _buildSubTab('Ala Carte Menu', 1),
        ],
      ),
    );
  }

  Widget _buildSubTab(String title, int index) {
    final isSelected = _selectedSubTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSubTab = index;
        });
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 4),
          if(isSelected)
          Container(
            height: 2,
            width: 80,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }
  
  Widget _buildBody(OrdersViewModel viewModel) {
    if(_selectedSubTab == 0) {
      return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: viewModel.orders.length,
        itemBuilder: (context, index) {
          return OrderCard(order: viewModel.orders[index]);
        },
      );
    }
    return const Center(
      child: Text('Custom Menu (Ala Carte Menu Coming Soon)'),
    );
  }
}