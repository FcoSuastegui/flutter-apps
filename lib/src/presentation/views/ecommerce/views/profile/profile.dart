import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Profile Page', style: TextStyle(color: Colors.black)),
      ),
      body: const Center(child: Text('Profile Page')),
    );
  }
}
