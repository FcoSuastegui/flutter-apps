import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  const ButtonApp({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MaterialButton(
        onPressed: onPressed,
        height: 50,
        elevation: 0,
        splashColor: Colors.yellow[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Colors.yellow[800],
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
