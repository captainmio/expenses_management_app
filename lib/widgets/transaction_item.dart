import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final double amount;
  final Icon icon;
  final String description;

  const TransactionItem({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    int descrptionMaxLength = 42;
    String subtextTrim = description.length > descrptionMaxLength
        ? '${description.substring(0, descrptionMaxLength)}...'
        : description;

    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        child: icon,
      ),
      title: Text(title),
      subtitle: Text(subtextTrim),
      trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Text('\$ $amount'),
        ),
        const Icon(Icons.arrow_forward_ios)
      ]),
    );
  }
}
