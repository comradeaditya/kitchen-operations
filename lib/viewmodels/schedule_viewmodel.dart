import 'package:flutter/material.dart';
import 'package:kitchen_operations/data/mock_data.dart';
import 'package:kitchen_operations/models/shift_model.dart';

class ScheduleViewModel extends ChangeNotifier{
  final List<ShiftModel> _shifts = MockData.shifts;

  List<ShiftModel> get shifts => _shifts;

  int _selectedTabIndex = 0;
  
  int get selectedTabIndex => _selectedTabIndex;

  //Notifies UI when tab selection changes
  void changeTab(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }
}