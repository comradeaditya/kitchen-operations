import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kitchen_operations/app/app_theme.dart';
import 'package:kitchen_operations/viewmodels/schedule_viewmodel.dart';
import 'package:kitchen_operations/viewmodels/orders_viewmodel.dart';
import 'package:kitchen_operations/viewmodels/shelf_viewmodel.dart';
import 'package:kitchen_operations/views/screens/schedule_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ScheduleViewModel()),
        ChangeNotifierProvider(create: (_) => OrdersViewModel()),
        ChangeNotifierProvider(create: (_) => ShelfViewModel()),
      ],
      child: MaterialApp(
        title: 'Kitchen Operations',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const ScheduleScreen(),      
      ),
    );   
  }
}