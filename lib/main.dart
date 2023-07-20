import 'package:expenses_management_app/screens/add_item.dart';
import 'package:expenses_management_app/screens/budget.dart';
import 'package:expenses_management_app/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const AddItemScreen(),
    const BudgetScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    debugPrint(_selectedIndex.toString());

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _screens[_selectedIndex]),
    );
  }

  Widget _addButton() {
    return Icon(
      Icons.add_circle_rounded,
      color: Colors.amber[800],
      size: 60,
    );
  }

  Widget _BottomNavBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: _addButton(),
          label: '',
        ),
        const BottomNavigationBarItem(
            icon: Icon(Icons.query_stats), label: 'Stats'),
      ],
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: _BottomNavBar(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
