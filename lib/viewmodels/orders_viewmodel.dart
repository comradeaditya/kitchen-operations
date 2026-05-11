import 'package:flutter/material.dart';
import 'package:kitchen_operations/data/mock_data.dart';
import 'package:kitchen_operations/models/order_model.dart';

class OrdersViewModel extends ChangeNotifier {
  final List<OrderModel> _orders = MockData.orders;

  List<OrderModel> get orders => _orders;
}