import 'package:flutter/material.dart';
import '../widgets/bottom_navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text("Home"),
        actions: [
          IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3))
                  ]),
              padding: const EdgeInsets.all(15),
              child: const Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Your Balance",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text("\$867.21",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox()
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
