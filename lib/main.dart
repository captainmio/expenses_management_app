import 'package:expenses_management_app/screens/home.dart';
import 'package:flutter/material.dart';

import 'widgets/bottom_navbar.dart';
import 'constants/theme_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: customAmberColorSwatch,
      ),
    );
  }
}
