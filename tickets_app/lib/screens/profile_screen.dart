import 'package:flutter/material.dart';
import '../core/all_file.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text('ProfileScreen').styled(color: C.bg),
          ],
        ),
      ),
    );
  }
}
