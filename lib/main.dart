import 'package:flutter/material.dart';
import 'app/app_theme.dart';
import 'views/screens/schedule_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kitchen Operations',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const ScheduleScreen(),      
    );
  }
}