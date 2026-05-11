import 'package:flutter/material.dart';
import 'package:kitchen_operations/app/app_theme.dart';
import 'package:kitchen_operations/models/order_model.dart';

class OrderCard extends StatelessWidget {
  final OrderModel order;

  const OrderCard({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          _buildOrderHeader(),
          const Divider(height: 1, color: AppColors.border),
          _buildItemsHeader(),
          ...order.items.map((item) => _buildItemRow(item)),
          _buildCancelButton(),
        ],
      ),
    );
  }

  Widget _buildOrderHeader() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildHeaderColumn('Order Id', order.orderId),
          _buildHeaderColumn('Room',order.room),
          _buildHeaderColumn('Order Status', order.orderStatus),
          _buildHeaderColumn('Timer',order.timer),
        ],
      ),
    );
  }

  Widget _buildHeaderColumn(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.caption),
        const SizedBox(height: 2),
        Text(value, style: AppTextStyles.subheading.copyWith(fontSize: 14)),
      ],
    );
  }

  Widget _buildItemsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(child: Text('Item Name', style: AppTextStyles.caption)),
          Text('Quantity', style: AppTextStyles.caption),
          const SizedBox(width: 16),
          Text('Assigned', style: AppTextStyles.caption),
          const SizedBox(width: 16),
          Text('Status', style: AppTextStyles.caption),
        ],
      ),
    );
  }

  Widget _buildItemRow(OrderItemModel item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(item.itemName, style: AppTextStyles.body),
          ),
          Text(item.quantity, style: AppTextStyles.body),
          const SizedBox(width: 16),
          //assigned or assign button
          item.assignedTo != null
          ? Text(item.assignedTo!, style: AppTextStyles.body)
          : GestureDetector(
            onTap: () {},
            child: Text(
              'Assign',
              style: AppTextStyles.body.copyWith(
                color: AppColors.successGreen,
              ),
            ),
          ),
          const SizedBox(width: 16),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.warning,
              side: BorderSide(color: AppColors.warning),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              minimumSize: const Size(0,0),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text('Cancel', style: TextStyle(fontSize: 11)),
          ),
        ],
      ),
    );
  }

  Widget _buildCancelButton() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Align(
        alignment: Alignment.centerRight,
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.warning,
            side: BorderSide(color: AppColors.warning),
          ),
          child: const Text("Cancel All"),
        ),
      ),
    );
  }
}