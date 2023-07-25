import 'package:expenses_management_app/constants/icon_lists.dart';
import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/list_icon_tab_page.dart';

class AddUpdateSettingScreen extends StatefulWidget {
  final int? id;
  final String title;
  final IconData icon;
  const AddUpdateSettingScreen(
      {super.key, this.id, required this.title, required this.icon});

  @override
  State<AddUpdateSettingScreen> createState() => _AddUpdateSettingScreenState();
}

class _AddUpdateSettingScreenState extends State<AddUpdateSettingScreen> {
  IconData? selectedIcon;

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill-in this field';
    }
    return null;
  }

  void _handleIconSelection(icon) {
    setState(
      () {
        selectedIcon = icon;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String headerTitle = 'Add Settings';
    if (widget.id != null) {
      headerTitle = 'Update Settings';
    }

    final TextEditingController categoryName = TextEditingController();
    String categoryType = 'expenses';

    return Scaffold(
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
                        // Do something when the checkbox is checked/unchecked.
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
                        // Do something when the checkbox is checked/unchecked.
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
                data: iconslists,
                displayNumber: 10,
                onItemSelected: _handleIconSelection,
                fillOnSelect: true,
                height: 220,
                spacing: 30.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
