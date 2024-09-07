import 'package:flutter/material.dart';
import 'package:tickets_app/core/all_file.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog(
      {super.key, required this.title, required this.content});
  final String title;
  final String content;

  void dismiss(BuildContext context) => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title).styled(size: 24, weight: FontWeight.w500),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Text(content).styled(size: 16, color: C.text2),
      ),
      actions: <Widget>[
        MyButton(text: 'OK', onPressed: () => dismiss(context))
      ],
    );
  }
}
