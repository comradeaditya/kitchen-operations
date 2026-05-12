import 'package:flutter/material.dart';
import 'package:kitchen_operations/data/mock_data.dart';
import 'package:kitchen_operations/models/shelf_item_model.dart';

class ShelfViewModel extends ChangeNotifier{
  final List<ShelfItemModel> _shelfItems = MockData.shelfItems;

  List<ShelfItemModel> get shelfItems => _shelfItems;
}