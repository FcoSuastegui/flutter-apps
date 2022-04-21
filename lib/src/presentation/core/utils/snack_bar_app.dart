import 'package:flutter/material.dart';

class AppSnackBar {
  AppSnackBar({
    required this.context,
  });

  final BuildContext context;

  factory AppSnackBar.of(BuildContext context) {
    return AppSnackBar(context: context);
  }

  Future<void> success({
    required String title,
    Duration duration = const Duration(milliseconds: 800),
  }) async {
    final snackbar = SnackBar(
      content: Text(title),
      duration: const Duration(seconds: 5),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      /* action: SnackBarAction(
        label: 'Undo',
        onPressed: () {},
      ), */
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
