import 'package:expenses_management_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../constants/page_lists.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Add Transaction", center: true),
    );
  }
}
