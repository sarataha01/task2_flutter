import 'package:flutter/material.dart';

class TaskOptions extends StatelessWidget {
  final VoidCallback onPinPressed;
  final VoidCallback onDeletePressed;

  const TaskOptions({
    super.key,
    required this.onPinPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.push_pin),
          title: const Text('Pin'),
          onTap: onPinPressed,
        ),
        ListTile(
          leading: const Icon(Icons.delete),
          title: const Text('Delete'),
          onTap: onDeletePressed,
        ),
      ],
    );
  }
}
