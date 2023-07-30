import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../models/category_model.dart';
import '../services/categories.dart';

class ProviderConfigModel extends ChangeNotifier {
  int currentIndex = 0;

  List<CategoryModel> categories = [];
  CategoryModel addCategory = CategoryModel(
    title: 'Add category',
    canDelete: 0,
    color: Colors.black,
    icon: Icons.add_box_outlined,
  );

  int get getCurrentIndex => currentIndex;
  List<CategoryModel> get getCategories => categories;

  void updateCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  Future<void> deletecategory(int id) async {
    categories.removeWhere((category) => category.id == id);
  }

  Future<void> updateCategories(List<CategoryModel> result) async {
    final List<CategoryModel> toAdd = [];

    toAdd.addAll([addCategory, ...result]);

    categories = toAdd;
    notifyListeners();
  }
}
