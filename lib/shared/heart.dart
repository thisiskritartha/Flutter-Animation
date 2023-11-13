import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation? _colorAnimation;
  Animation<double>? _sizeAnimation;
  late Animation _curve;
  bool isFav = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _curve = CurvedAnimation(parent: _controller!, curve: Curves.slowMiddle);

    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_curve as Animation<double>);

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(tween: Tween(begin: 30, end: 50), weight: 50),
        TweenSequenceItem(tween: Tween(begin: 50, end: 30), weight: 50),
      ],
    ).animate(_curve as Animation<double>);

    _controller!.addListener(() {
      print(_controller!.value);
      print(_colorAnimation!.value);
    });

    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      } else if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (BuildContext context, _) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation!.value,
            size: _sizeAnimation!.value,
          ),
          onPressed: () {
            isFav ? _controller!.reverse() : _controller!.forward();
          },
        );
      },
    );
  }
}
