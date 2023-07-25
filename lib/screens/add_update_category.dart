import 'package:expenses_management_app/constants/icon_lists.dart';
import 'package:expenses_management_app/widgets/color_picker.dart';
import 'package:flutter/material.dart';
import '../constants/theme_color.dart';
import '../widgets/app_bar.dart';
import '../widgets/list_icon_tab_page.dart';

class AddUpdateCategoryScreen extends StatefulWidget {
  final int? id;
  final String title;
  final IconData icon;
  const AddUpdateCategoryScreen(
      {super.key, this.id, required this.title, required this.icon});

  @override
  State<AddUpdateCategoryScreen> createState() =>
      _AddUpdateCategoryScreenState();
}

class _AddUpdateCategoryScreenState extends State<AddUpdateCategoryScreen> {
  IconData? selectedIcon;
  Color? selectedColor;

  String categoryType = 'income';
  final TextEditingController categoryName = TextEditingController();

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill-in this field';
    }
    return null;
  }

  void _handleIconSelection(dynamic icon) {
    setState(
      () {
        selectedIcon = icon;
      },
    );
  }

  void _handleColorSelected(Color color) {
    setState(
      () {
        selectedColor = color;
      },
    );
  }

  void _handleCategoryTypeSelection(String value) {
    setState(
      () {
        categoryType = value;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _handleIconSelection(iconslists[1]);
    _handleColorSelected(Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    String headerTitle = 'Add Category';
    if (widget.id != null) {
      headerTitle = 'Update Category';
    }

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
            onPressed: () {
              print(selectedColor);
              print(selectedIcon);
              print(categoryName.text);
              print(categoryType);
            },
            child: Text(
              'Save',
              style: TextStyle(
                fontSize: buttonTextFontSize,
              ),
            ),
          ),
        ),
      ),
      appBar: CustomAppBar(title: headerTitle, center: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: categoryName,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Category name',
                ),
                validator: (String? value) {
                  return _fieldValidator(value);
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      groupValue: categoryType,
                      value: 'expenses',
                      onChanged: (value) {
                        setState(() {
                          categoryType = value!;
                        });
                      },
                      title: const Text(
                        'Expenses',
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      groupValue: categoryType,
                      value: 'income',
                      onChanged: (value) {
                        setState(() {
                          categoryType = value!;
                        });
                      },
                      title: const Text('Income'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Align(
                alignment:
                    Alignment.centerLeft, // Align the "Icon" text to the left.
                child: Text(
                  'Icons',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListIconTabPage(
                initialSelectedItem: selectedIcon,
                data: iconslists,
                displayNumber: 10,
                onItemSelected: _handleIconSelection,
                height: 200,
                spacing: 30.0,
              ),
              const Align(
                alignment:
                    Alignment.centerLeft, // Align the "Icon" text to the left.
                child: Text(
                  'Color',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomColorPicker(
                onColorSelected: _handleColorSelected,
                initialSelectedColor: selectedColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
