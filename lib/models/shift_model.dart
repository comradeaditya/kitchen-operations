import 'employee_model.dart';

class ShiftModel {
  final String mealType;
  final String preparationTime;
  final String serveTime;
  final String? eventName;
  final List<EmployeeModel> employees;

  ShiftModel({
    required this.mealType,
    required this.preparationTime,
    required this.serveTime,
    this.eventName,
    required this.employees,
  });
}