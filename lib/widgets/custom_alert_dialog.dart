import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? positiveButtonText;
  final VoidCallback onPositivePressed;
  final String negativeButtonText;
  final VoidCallback? onNegativePressed;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.message,
    required this.positiveButtonText,
    required this.onPositivePressed,
    required this.negativeButtonText,
    this.onNegativePressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        if (negativeButtonText != null)
          TextButton(
            onPressed: onNegativePressed ?? () => Navigator.of(context).pop(),
            child: Text(negativeButtonText!),
          ),
        TextButton(
          onPressed: onPositivePressed,
          child: Text(positiveButtonText!),
        ),
      ],
    );
  }
}
