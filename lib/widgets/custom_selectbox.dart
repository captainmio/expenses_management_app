import 'package:expenses_management_app/models/widgets/custom_selectbox_model.dart';
import 'package:flutter/material.dart';

class CustomSelectBox extends StatefulWidget {
  final String label;
  final List<CustomSelectBoxModel> options;
  final void Function(String?) onChanged;
  final Function(String?)? validation;
  const CustomSelectBox({
    super.key,
    required this.label,
    required this.options,
    required this.onChanged,
    this.validation,
  });

  @override
  State<CustomSelectBox> createState() => _CustomSelectBoxState();
}

class _CustomSelectBoxState extends State<CustomSelectBox> {
  String selectedValue = '';

  @override
  void didUpdateWidget(CustomSelectBox oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if options have changed
    if (widget.options != oldWidget.options) {
      // Reset the selected value and trigger onChanged callback
      setState(() {
        selectedValue = '';
      });
      widget.onChanged(selectedValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: [
        DropdownMenuItem(
          value: '',
          enabled: false,
          child: Text(
            widget.label,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        ...widget.options
            .map<DropdownMenuItem<String>>((CustomSelectBoxModel option) {
          return DropdownMenuItem<String>(
            value: option.key,
            child: Text(option.value),
          );
        }).toList(),
      ],
      validator: (String? value) {
        return widget.validation!(value);
      },
      value: selectedValue,
      onChanged: (option) {
        setState(() {
          selectedValue = option!.toString();
        });
        widget.onChanged(selectedValue);
      },
    );
  }
}
