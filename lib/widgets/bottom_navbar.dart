import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/page_lists.dart';
import '../constants/theme_color.dart';
import '../provider_models/provider_page_model.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final providerPageModel = Provider.of<ProviderPageModel>(context);

    void setItem(int index) {
      providerPageModel.updateCurrentIndex(index);
    }

    Widget addButton() {
      return Icon(
        Icons.add_circle_rounded,
        color: themeColor,
        size: 60,
      );
    }

    void onItemTapped(int index, BuildContext context) {
      if (index == 1) {
        // Handle "Add" menu item
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screens[1]),
        );
      } else {
        setItem(index);
      }
    }

    Widget bottomNavBar(BuildContext context) {
      return BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: addButton(),
            label: '',
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.query_stats), label: 'Stats'),
        ],
        selectedItemColor: themeColor,
        onTap: (index) => onItemTapped(index, context),
        currentIndex: providerPageModel.currentIndex,
      );
    }

    return bottomNavBar(context);
  }
}
