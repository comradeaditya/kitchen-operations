import 'package:flutter/material.dart';
import 'package:kitchen_operations/models/shelf_item_model.dart';
import 'package:provider/provider.dart';
import 'package:kitchen_operations/app/app_theme.dart';
import 'package:kitchen_operations/viewmodels/shelf_viewmodel.dart';
import 'package:kitchen_operations/viewmodels/schedule_viewmodel.dart';
import 'package:kitchen_operations/views/widgets/bottom_nav_bar.dart';

class ShelfLifeScreen  extends StatefulWidget {
  const ShelfLifeScreen({super.key});

  @override
  State<ShelfLifeScreen> createState() => _ShelfLifeScreenState();
}

class _ShelfLifeScreenState extends State<ShelfLifeScreen> {
  int _currentNavIndex = 3;

  @override
  Widget build(BuildContext context) {
    final shelfViewModel = Provider.of<ShelfViewModel>(context);
    final scheduleViewModel = Provider.of<ScheduleViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
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
                size: 16, color: AppColors.textSecondary
                ),
                const SizedBox(width: 4),
                Text('22-02-2023', style: AppTextStyles.caption),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildTabBar(scheduleViewModel, context),
          Expanded(
            child: _buildBody(shelfViewModel),
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

  Widget _buildTabBar(ScheduleViewModel viewModel, BuildContext context) {
    final tabs = [
      'Schedule', 'Live Orders', 'Shelf Life Items',
      'Preprepared Items', 'Leftover', 'Purchase Confirmation', 'Current Stock'
    ];

    return Container(
      color: AppColors.surface,
      height: 44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          //Shelf Life Items is index 2
          final isSelected = index == 2;
          return GestureDetector(
            onTap: () {
              if(index == 0) {
              //go back to Schedule
              Navigator.popUntil(context, (route) => route.isFirst);
              } else if (index == 1) {
              //go back to Live Orders
              Navigator.pop(context);
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

  Widget _buildBody(ShelfViewModel viewModel) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            //table header
            _buildTableHeader(),
            const Divider(height: 1, color: AppColors.border),
            //table rows
            ...viewModel.shelfItems.map(
              (item) => Column(
                children: [
                  _buildTableRow(item),
                  const Divider(height: 1, color: AppColors.border),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTableHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
           _buildHeaderCell('ID', flex: 2),
          _buildHeaderCell('Item Name', flex: 3),
          _buildHeaderCell('Type', flex: 2),
          _buildHeaderCell('Days Left', flex: 2),
          _buildHeaderCell('Available', flex: 2),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String title, {required int flex}) {
    return Expanded(
      flex: flex,
      child: Text(
        title,
        style: AppTextStyles.caption,
      ),
    );
  }

  Widget _buildTableRow(ShelfItemModel item) {
    //days left color - red if <= 3 days
    final daysColor = item.daysLeft<=3
    ? AppColors.warning
    : AppColors.textPrimary;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildRowCell(item.itemId, flex: 2),
              _buildRowCell(item.itemName, flex: 3),
              _buildRowCell(item.itemType, flex: 2),
              Expanded(
              flex: 2,
              child: Text(
                '${item.daysLeft} Days',
                style: AppTextStyles.body.copyWith(color: daysColor),
              ),
            ),
            _buildRowCell(item.availableQuantity, flex: 2),
            ],
          ),
          const SizedBox(height: 6),
          //action buttons on seperate line
          Row(
            children: [
              _buildActionButton('Set Offer', AppColors.primary),
              const SizedBox(width: 8),
              _buildActionButton('Remove', AppColors.warning),
            ],
          ),
        ],
      ),
    );
  }      

  Widget _buildRowCell(String value, {required int flex}) {
    return Expanded(
      flex: flex,
      child: Text(
        value, 
        style: AppTextStyles.body,
        overflow: TextOverflow.ellipsis, //cuts long text with ...
        maxLines: 1,
      ),
    );
  }

  Widget _buildActionButton(String label, Color color) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label, 
          style: const TextStyle(
            color: AppColors.surface,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}