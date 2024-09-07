import 'package:flutter/material.dart';

class CustomAlertDialogWidget extends StatefulWidget {
  const CustomAlertDialogWidget({super.key});

  @override
  State<CustomAlertDialogWidget> createState() =>
      _CustomAlertDialogWidgetState();
}

class _CustomAlertDialogWidgetState extends State<CustomAlertDialogWidget> {
  bool isYesChange = false;
  bool isNoChange = false;

  @override
  //
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xffFFFFFF),
      shape: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffB98875)),
          borderRadius: BorderRadius.circular(7)),
      title: SizedBox(
        height: 120,
        width: 320,
        child: RichText(
            text: const TextSpan(children: [
          TextSpan(
              text: "Are you sure you want to delete",
              style: TextStyle(color: Colors.black, fontSize: 24)),
          TextSpan(
              text: " Espresso",
              style: TextStyle(color: Color(0xffB98875), fontSize: 24)),
          TextSpan(
              text: " from cart",
              style: TextStyle(color: Colors.black, fontSize: 24))
        ])),
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(isYesChange
                    ? const Color(0xffFFFFFF)
                    : const Color(0xffB98875)),
                minimumSize: const WidgetStatePropertyAll(Size(110, 50)),
                shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                    side: BorderSide(width: 2, color: Color(0xffB98875)),
                    borderRadius: BorderRadius.all(Radius.circular(24)))),
                backgroundColor: WidgetStatePropertyAll(isYesChange
                    ? const Color(0xffB98875)
                    : const Color(0xffFFFFFF))),
            onPressed: () {
              setState(() {
                isYesChange = !isYesChange;
              });
              Navigator.pop(context);
            },
            child: const Text(
              "Yes",
              style: TextStyle(fontSize: 20),
            )),
        ElevatedButton(
            style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(isNoChange
                    ? const Color(0xffFFFFFF)
                    : const Color(0xffB98875)),
                minimumSize: const WidgetStatePropertyAll(Size(110, 50)),
                shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                    side: BorderSide(width: 2, color: Color(0xffB98875)),
                    borderRadius: BorderRadius.all(Radius.circular(24)))),
                backgroundColor: WidgetStatePropertyAll(isNoChange
                    ? const Color(0xffB98875)
                    : const Color(0xffFFFFFF))),
            onPressed: () {
              setState(() {
                isNoChange = !isNoChange;
              });
              Navigator.pop(context);
            },
            child: const Text(
              "No",
              style: TextStyle(fontSize: 20),
            )),
      ],
    );
  }
}
