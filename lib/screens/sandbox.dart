import 'package:flutter/material.dart';

class Sandbox extends StatefulWidget {
  const Sandbox({Key? key}) : super(key: key);

  @override
  State<Sandbox> createState() => _SandboxState();
}

class _SandboxState extends State<Sandbox> {
  double _opacity = 1;
  double _margin = 0;
  double _width = 200;
  Color _color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        margin: EdgeInsets.all(_margin),
        width: _width,
        color: _color,
        duration: Duration(seconds: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => setState(() {
                _margin = 50;
              }),
              child: Text('Animated Margin'),
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                _color = Colors.purple;
              }),
              child: Text('Animated Color'),
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                _width = 400;
              }),
              child: Text('Animated Width'),
            ),
            ElevatedButton(
              onPressed: () => setState(() {
                _opacity = 0;
              }),
              child: Text('Animated Opacity'),
            ),
            AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 2),
              child: Text(
                'Hide Me',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
