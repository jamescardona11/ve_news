import 'package:flutter/material.dart';
import 'package:ve_news/config/theme/app_theme.dart';
import 'package:ve_news/presentation/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme(),
      home: HomeScreen(),
    );
  }
}
