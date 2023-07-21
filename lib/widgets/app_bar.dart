import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<IconButton>? actions;
  final bool center;
  const CustomAppBar(
      {super.key, required this.title, this.actions, this.center = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: center,
      title: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
      elevation: 0,
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
