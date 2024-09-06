import 'package:flutter/material.dart';
import 'package:tickets_app/core/extensions/img_ext.dart';
import '../core/all_file.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: C.bg,
      appBar: AppBar(
          backgroundColor: C.bg,
        title: const Text("Profile").styled(size: 30,weight: FontWeight.bold),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children:  [
              Card(
                color: C.card,
                child: ListTile(
                  leading: CircleAvatar(backgroundImage: Img.person1),
                  title:Text("data").styled(color: C.accent),
                 
                  subtitle: Text("data \ndata"), 
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
