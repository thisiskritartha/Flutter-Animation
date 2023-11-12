import 'package:flutter/material.dart';
import 'package:flutter_animation_lesson1/screens/home.dart';
import 'package:flutter_animation_lesson1/screens/sandbox.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trips',
      home: Home(),
    );
  }
}
