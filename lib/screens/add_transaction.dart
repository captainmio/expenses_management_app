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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Transaction"),
        // leading: BackButton(
        //   color: Colors.red,
        //   onPressed: () => Navigator.pop(
        //     context,
        //     MaterialPageRoute(builder: (context) => screens[0]),
        //   ),
        // ),
      ),
    );
  }
}
