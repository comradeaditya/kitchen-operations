import 'package:flutter/material.dart';
import 'package:kitchen_operations/app/app_theme.dart';
import 'package:kitchen_operations/models/shift_model.dart';
import 'package:kitchen_operations/views/widgets/employee_row.dart';

class ShiftCard extends StatelessWidget {
  final ShiftModel shift;

  const ShiftCard({
    super.key,
    required this.shift,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //meal type header
          Text(shift.mealType, style: AppTextStyles.subheading),
          const SizedBox(height: 8),
          //preparation and serve time row
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Preparation Time', style: AppTextStyles.caption),
                  Text(shift.preparationTime, style: AppTextStyles.body),
                ],
              ),
              const SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Serve Time', style: AppTextStyles.caption),
                  Text(shift.serveTime, style: AppTextStyles.body),
                ],
              ),
            ],
          ),
          //event name if exists
          if (shift.eventName != null) ...[
            const SizedBox(height: 8),
            Text(shift.eventName!, style: AppTextStyles.body),
          ],
          const SizedBox(height: 12),
          const Divider(color: AppColors.border),
          const SizedBox(height: 8),
          //employee rows
          ...shift.employees.map((employee) => EmployeeRow(employee: employee)),
        ],
      ),
    );
  }
}  