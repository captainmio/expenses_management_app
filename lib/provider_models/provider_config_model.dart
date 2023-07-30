import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../models/category_model.dart';
import '../services/categories.dart';

class ProviderConfigModel extends ChangeNotifier {
  int currentIndex = 0;

  List<CategoryModel> categories = [
    // CategoryModel(
    //   id: 1,
    //   title: 'Food',
    //   icon: Icons.local_grocery_store_outlined,
    // ),
    // CategoryModel(
    //   id: 2,
    //   title: 'Bills',
    //   icon: Icons.ad_units_outlined,
    // ),
    // CategoryModel(
    //   id: 3,
    //   title: 'Government',
    //   icon: Icons.business_center_outlined,
    // ),
    // CategoryModel(
    //   id: 4,
    //   title: 'Entertainment',
    //   icon: Icons.local_movies_outlined,
    // ),
    // CategoryModel(
    //   id: 5,
    //   title: 'Housing',
    //   icon: Icons.house,
    // ),
    // CategoryModel(
    //   id: 6,
    //   title: 'Healthcare',
    //   icon: Icons.local_hospital_outlined,
    // ),
    // CategoryModel(
    //   id: 7,
    //   title: 'Transportation',
    //   icon: FontAwesome.bus,
    // ),
    // CategoryModel(
    //   id: 8,
    //   title: 'Clothing',
    //   icon: Ionicons.shirt,
    // ),
  ];

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

    toAdd.addAll([
      CategoryModel(
        title: 'Add category',
        canDelete: 0,
        icon: Icons.add_box_outlined,
      ),
      ...result
    ]);

    categories = toAdd;
    notifyListeners();
  }
}
