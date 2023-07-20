import 'package:expenses_management_app/constants/page_lists.dart';
import 'package:expenses_management_app/provider_models/provider_page_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Home Screen"),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
