import 'package:expenses_management_app/constants/theme_color.dart';
import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  const CategoryBox({super.key});

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
            Icons.access_time_sharp,
            size: 50,
            color: fontColor,
          ),
          Text(
            'Category 1',
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
