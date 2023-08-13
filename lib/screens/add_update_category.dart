import 'package:expenses_management_app/constants/icon_lists.dart';
import 'package:expenses_management_app/services/categories.dart';
import 'package:expenses_management_app/widgets/color_picker.dart';
import 'package:expenses_management_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import '../constants/theme_color.dart';
import '../widgets/app_bar.dart';
import '../widgets/custom_alert_dialog.dart';
import '../widgets/list_icon_tab_page.dart';

class AddUpdateCategoryScreen extends StatefulWidget {
  final int? id;
  final String title;
  final IconData icon;
  final String? type;
  final Color color;
  final int? canDelete;
  const AddUpdateCategoryScreen({
    super.key,
    this.id,
    required this.title,
    this.type,
    required this.icon,
    required this.color,
    this.canDelete,
  });

  @override
  State<AddUpdateCategoryScreen> createState() =>
      _AddUpdateCategoryScreenState();
}

class _AddUpdateCategoryScreenState extends State<AddUpdateCategoryScreen> {
  IconData? selectedIcon;
  Color? selectedColor;
  String categoryType = 'income';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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

  Future<void> _formSubmit() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      String name = categoryName.text;

      await Categories.searchCategoryByName(name).then(
        (result) {
          if (result == null) {
            if (widget.id == null) {
              Categories.createCategory(name, selectedIcon!.codePoint,
                      categoryType, selectedColor!.value)
                  .then((value) {
                _goBack();
              });
            } else {
              Categories.updateCategory(
                      widget.id!,
                      name,
                      selectedIcon!.codePoint,
                      categoryType,
                      selectedColor!.value)
                  .then((value) {
                _goBack();
              });
            }
          } else {
            _showCategoryNameExist(context);
          }
        },
      );
    }
  }

  void _goBack() {
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    if (widget.id == null) {
      _handleIconSelection(iconslists[0]);
      _handleColorSelected(Colors.red);
    } else {
      _updateCategory();
    }
  }

  void _updateCategory() {
    categoryName.text = widget.title;
    _handleIconSelection(widget.icon);
    _handleColorSelected(widget.color);
    setState(() {
      categoryType = widget.type!;
    });
  }

  List<IconButton> _displayDeleteButton(BuildContext context) {
    if (widget.canDelete == 1) {
      return [
        IconButton(
            onPressed: () {
              _showDeleteConfirmationDialog(context, widget.id!);
            },
            icon: const Icon(Icons.delete))
      ];
    }
    return [];
  }

  Future<void> _handleCategoryDelete(int id) async {
    await Categories.deleteCategory(id).then((value) {
      // remove the category to our list of category state
      _goBack();
      _goBack();
    });
  }

  void _showDeleteConfirmationDialog(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          title: 'Confirm Delete',
          message:
              'Are you sure you want to delete this Category? \n\n(Note: this will delete transaction as well)',
          positiveButtonText: 'Delete',
          onPositivePressed: () {
            _handleCategoryDelete(id);
          },
          negativeButtonText: 'Cancel',
        );
      },
    );
  }

  void _showCategoryNameExist(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          title: 'Category already exist',
          message: 'Please change category name',
          positiveButtonText: 'Okay',
          onPositivePressed: () async {
            _goBack();
          },
        );
      },
    );
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
              _formSubmit();
            },
            child: Text(
              (widget.id != null) ? 'Update' : 'Save',
              style: TextStyle(
                fontSize: buttonTextFontSize,
              ),
            ),
          ),
        ),
      ),
      appBar: CustomAppBar(
        title: headerTitle,
        center: true,
        actions: _displayDeleteButton(context),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextField(
                    hintText: 'Transaction',
                    controller: categoryName,
                    validation: _fieldValidator,
                    icon: Icon(
                      selectedIcon,
                      color: selectedColor,
                    ),
                    maxLength: 16,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                          groupValue: categoryType,
                          value: 'expenses',
                          onChanged: (value) {
                            _handleCategoryTypeSelection(value!);
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
                            _handleCategoryTypeSelection(value!);
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
                    alignment: Alignment
                        .centerLeft, // Align the "Icon" text to the left.
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
                    alignment: Alignment
                        .centerLeft, // Align the "Icon" text to the left.
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
              )),
        ),
      ),
    );
  }
}
