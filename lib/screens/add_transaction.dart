import 'package:expenses_management_app/constants/theme_color.dart';
import 'package:expenses_management_app/models/widgets/custom_selectbox_model.dart';
import 'package:expenses_management_app/services/categories.dart';
import 'package:expenses_management_app/widgets/app_bar.dart';
import 'package:expenses_management_app/widgets/custom_selectbox.dart';
import 'package:expenses_management_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController category = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController amount = TextEditingController();
  List<CustomSelectBoxModel> categories = [];
  List<CustomSelectBoxModel> filteredCategories = [];
  String categoryType = 'expenses';

  List<DateTime?> selectedDateValue = [];

  final today = DateUtils.dateOnly(DateTime.now());

  final config = CalendarDatePicker2Config(
    selectedDayHighlightColor: themeColor,
    weekdayLabels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
  );

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    var results = await Categories.getCategories();

    for (var result in results) {
      categories.add(CustomSelectBoxModel(
          key: result.id.toString(),
          value: result.title,
          categoryType: result.type!));
    }

    setState(() {
      // filteredCategories = categories;

      filteredCategories = categories
          .where((item) => item.categoryType == categoryType)
          .toList();
    });
  }

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please fill-in this field';
    }
    return null;
  }

  String? _fieldCurrencyValidator(String? value) {
    try {
      double.parse(value!);
      return null;
    } catch (e) {
      return "Please input correct value";
    }
  }

  void _handleCategoryTypeSelection(String value) {
    setState(
      () {
        categoryType = value;

        // filter category
        filteredCategories = categories
            .where((item) => item.categoryType == categoryType)
            .toList();

        category.text = '';
      },
    );
  }

  Future<void> _formSubmit() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      print('validated');
    }
  }

  @override
  Widget build(BuildContext context) {
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
              'Save',
              style: TextStyle(
                fontSize: buttonTextFontSize,
              ),
            ),
          ),
        ),
      ),
      appBar: const CustomAppBar(title: "Add Transaction", center: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                Text(
                  'Category',
                  style: TextStyle(
                      fontSize: labelFontSize, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomSelectBox(
                    validation: _fieldValidator,
                    label: '-- Select Category --',
                    options: filteredCategories,
                    onChanged: (value) => {category.text = value!},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Name',
                    style: TextStyle(
                        fontSize: labelFontSize, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextField(
                  controller: name,
                  validation: _fieldValidator,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Amount',
                    style: TextStyle(
                        fontSize: labelFontSize, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextField(
                  controller: amount,
                  validation: _fieldCurrencyValidator,
                  icon: const Icon(Icons.attach_money),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Date',
                    style: TextStyle(
                        fontSize: labelFontSize, fontWeight: FontWeight.bold),
                  ),
                ),
                CalendarDatePicker2(
                  config: config,
                  value: selectedDateValue,
                  onValueChanged: (date) {
                    setState(() {
                      selectedDateValue = date;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
