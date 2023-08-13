import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final Icon? icon;
  final Function(String?)? validation;
  final int? maxLength;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    this.hintText,
    required this.controller,
    this.icon,
    this.validation,
    this.maxLength,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: widget.maxLength,
      controller: widget.controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: widget.hintText,
        prefixIcon: widget.icon,
        prefixIconConstraints: const BoxConstraints(minWidth: 60.0),
      ),
      validator: (String? value) {
        return widget.validation!(value);
      },
    );
  }
}
