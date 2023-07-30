import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../models/category_model.dart';

List<CategoryModel> expensescategories = [
  CategoryModel(
    title: 'Food',
    color: Colors.red,
    icon: FontAwesome.shopping_cart,
    canDelete: 0,
  ),
  CategoryModel(
    title: 'Bills',
    color: Colors.blue,
    icon: FontAwesome.money,
    canDelete: 0,
  ),
  CategoryModel(
    title: 'Government',
    color: Colors.black,
    icon: FontAwesome.building,
    canDelete: 0,
  ),
  CategoryModel(
    title: 'Entertainment',
    color: Colors.orange,
    icon: FontAwesome.camera,
    canDelete: 0,
  ),
  CategoryModel(
    title: 'Housing',
    color: Colors.cyan,
    icon: FontAwesome.home,
    canDelete: 0,
  ),
  CategoryModel(
    title: 'Healthcare',
    color: Colors.teal,
    icon: FontAwesome.hospital_o,
    canDelete: 0,
  ),
  CategoryModel(
    title: 'Transportation',
    color: Colors.deepPurple,
    icon: FontAwesome.bus,
    canDelete: 0,
  ),
  CategoryModel(
    title: 'Clothing',
    color: Colors.pink,
    icon: FontAwesome.shirtsinbulk,
    canDelete: 0,
  ),
];
