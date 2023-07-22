import 'package:flutter/material.dart';
import 'package:ve_news/config/theme/app_theme.dart';
import 'package:ve_news/presentation/intro/intro_screen.dart';

import 'config/di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
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
      home: IntroScreen(),
    );
  }
}
