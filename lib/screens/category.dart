import 'package:expenses_management_app/models/category_model.dart';
import 'package:expenses_management_app/services/categories.dart';
import 'package:expenses_management_app/widgets/category_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider_models/provider_config_model.dart';
import '../widgets/app_bar.dart';
import 'add_update_category.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    await Categories.getCategories().then((results) {
      Provider.of<ProviderConfigModel>(context, listen: false)
          .updateCategories(results);
    });
  }

  Widget _categoryListing(categories) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 120,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 5 / 4,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddUpdateCategoryScreen(
                            id: categories[index].id,
                            title: categories[index].title,
                            icon: categories[index].icon,
                            color: categories[index].color,
                            type: categories[index].type,
                            canDelete: categories[index].canDelete,
                          ),
                        ),
                      ).then((value) => _fetchCategories());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: CategoryBox(
                        title: categories[index].title,
                        icon: categories[index].icon,
                        color: categories[index].color,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final providerPageModel = Provider.of<ProviderConfigModel>(context);

    List<CategoryModel> categories = providerPageModel.getCategories;

    List<CategoryModel> expensesCategories =
        categories.where((category) => category.type != 'income').toList();

    List<CategoryModel> incomeCategories =
        categories.where((category) => category.type != 'expenses').toList();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const CustomAppBar(
          title: "Settings",
          center: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Align(
                alignment:
                    Alignment.centerLeft, // Align the "Icon" text to the left.
                child: Text(
                  "Add/Update Category",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Select a category and fine tune you budgeting plan to achieve what you need",
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 30,
              ),
              const TabBar(
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'Expenses',
                  ),
                  Tab(
                    text: 'Income',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _categoryListing(expensesCategories),
                    _categoryListing(incomeCategories)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
