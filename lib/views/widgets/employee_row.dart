import 'package:flutter/material.dart';
import 'package:kitchen_operations/app/app_theme.dart';
import 'package:kitchen_operations/models/employee_model.dart';

class EmployeeRow extends StatelessWidget {
  final EmployeeModel employee;

  const EmployeeRow({
    super.key,
    required this.employee,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.shiftGreen,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          //hours per shift
          Text(
            employee.hoursPerShift,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(width: 12),
          //employee name
          Expanded(
            child: Text(
              employee.name,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          // divider
          Container(
            width: 1,
            height: 14,
            color: AppColors.border,
            margin: const EdgeInsets.symmetric(horizontal: 8),
          ),
          //role
          Text(
            employee.role,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}