import 'package:flutter/material.dart';
import 'package:tickets_app/core/extensions/string_ext.dart';
import '../core/extensions/color_ext.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('LoginScreen').styled(color: C.accent),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => (),
                  child: Text('Navigate').styled(color: C.bg),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
