import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;

  const ScreenTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeOutSine,
      builder: (BuildContext context, double _value, Widget? child) {
        return Opacity(
          opacity: _value,
          child: Padding(
            padding: EdgeInsets.only(top: _value * 20),
            child: child,
          ),
        );
      },
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 36,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
