import 'package:flutter/material.dart';
import 'package:tickets_app/core/extensions/string_ext.dart';
import '../../core/extensions/color_ext.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            const Text('ReservationsScreen').styled(color: C.bg),
          ],
        ),
      ),
    );
  }
}
