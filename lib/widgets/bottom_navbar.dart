import 'package:flutter/material.dart';

import '../screens/add_item.dart';
import '../screens/budget.dart';
import '../screens/home.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const AddItemScreen(),
    const BudgetScreen(),
  ];

  void setItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTapped(int index, BuildContext context) {
    setItem(index);
    if (index == 1) {
      // Handle "Add" menu item
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => _screens[_selectedIndex]),
      ).then((value) => setItem(0));
    }
  }

  Widget _addButton() {
    return Icon(
      Icons.add_circle_rounded,
      color: Colors.amber[800],
      size: 60,
    );
  }

  Widget _bottomNavBar(BuildContext context) {
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
      onTap: (index) => _onItemTapped(index, context),
      currentIndex: _selectedIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _bottomNavBar(context);
  }
}
