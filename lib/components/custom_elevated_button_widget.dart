import 'package:flutter/material.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  const CustomElevatedButtonWidget(
      {super.key, required this.icon, this.onPressed});
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(padding: EdgeInsets.zero,
            minimumSize: const Size(29, 29),
            shape: const CircleBorder(),
            backgroundColor: const Color(0xffB98875)),
        onPressed: onPressed,
        child: Icon(
          icon,
          color: Colors.white,
        ));
  }
}
