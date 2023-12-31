import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/bottom_navbar.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Budget"),
      body: Text('Budget Screen'),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
