import 'package:expenses_management_app/constants/theme_color.dart';
import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  final int? id;
  final String title;
  final IconData icon;
  const CategoryBox(
      {super.key, required this.title, required this.icon, this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: paleGreen,
          width: 2.0,
        ),
        // color: ,
      ),
      child: Column(
        children: [
          Icon(
            icon,
            size: 50,
            color: fontColor,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: fontColor,
            ),
          )
        ],
      ),
    );
  }
}
