import 'package:flutter/material.dart';

class OnBoardingDot extends StatelessWidget {
  const OnBoardingDot({
    Key? key,
    required this.currentIndex,
    this.colorDot = const Color(0xFF000000),
  }) : super(key: key);

  final bool currentIndex;
  final Color colorDot;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        color: colorDot,
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: currentIndex ? 20 : 10,
    );
  }
}
