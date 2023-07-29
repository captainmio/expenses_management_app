import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

const iconToUse = FontAwesome.bus;

class CategoryModel {
  final int? id;
  final String title;
  final IconData icon;
  final Color? color;
  final int canDelete;

  CategoryModel(
      {this.id,
      required this.title,
      required this.icon,
      this.color,
      required this.canDelete});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        title: json["title"],
        color: Color(json["color"]),
        icon: IconData(
          json["icon"],
          fontFamily: iconToUse.fontFamily,
          fontPackage: iconToUse.fontPackage,
        ),
        canDelete: json["canDelete"],
      );
}
