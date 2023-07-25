import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';

class CustomColorPicker extends StatefulWidget {
  final Function(Color) onColorSelected;
  final Color? initialSelectedColor;
  const CustomColorPicker(
      {super.key, required this.onColorSelected, this.initialSelectedColor});

  @override
  State<CustomColorPicker> createState() => _CustomColorPickerState();
}

class _CustomColorPickerState extends State<CustomColorPicker> {
  late Color screenPickerColor;

  @override
  void initState() {
    super.initState();

    if (widget.initialSelectedColor != null) {
      setState(() {
        screenPickerColor = widget.initialSelectedColor!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Card(
          elevation: 2,
          child: ColorPicker(
            pickersEnabled: const {ColorPickerType.accent: false},
            enableShadesSelection: false,
            // Use the screenPickerColor as start color.
            color: screenPickerColor,
            // Update the screenPickerColor using the callback.
            onColorChanged: (Color color) {
              setState(() {
                screenPickerColor = color;
              });

              widget.onColorSelected(color);
            },
            width: 60,
            height: 60,
            borderRadius: 30,
            elevation: 0,
            hasBorder: false,
            runSpacing: 20,
            spacing: 5,
          ),
        ),
      ),
    );
  }
}
