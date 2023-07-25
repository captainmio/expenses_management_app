import 'package:expenses_management_app/models/category_model.dart';
import 'package:expenses_management_app/widgets/category_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider_models/provider_config_model.dart';
import '../widgets/app_bar.dart';
import 'add_update_setting.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerPageModel = Provider.of<ProviderConfigModel>(context);
    List<CategoryModel> categories = providerPageModel.categories;
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Settings",
        center: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 13 / 9,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddUpdateSettingScreen(
                                      id: categories[index].id,
                                      title: categories[index].title,
                                      icon: categories[index].icon,
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: CategoryBox(
                            title: categories[index].title,
                            icon: categories[index].icon),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
