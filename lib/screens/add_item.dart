import 'package:flutter/material.dart';

import '../constants/page_lists.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
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
