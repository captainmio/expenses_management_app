import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

const iconToUse = FontAwesome.bus;

class CategoryModel {
  final int? id;
  final String title;
  final IconData icon;
  final Color color;
  final String? type;
  final int canDelete;

  CategoryModel(
      {this.id,
      required this.title,
      required this.icon,
      required this.color,
      this.type,
      required this.canDelete});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        color: Color(json["color"]),
        icon: IconData(
          json["icon"],
          fontFamily: iconToUse.fontFamily,
          fontPackage: iconToUse.fontPackage,
        ),
        canDelete: json["canDelete"],
      );
}
