import 'package:flutter/material.dart';

import '../widgets/bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Home Screen'),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
