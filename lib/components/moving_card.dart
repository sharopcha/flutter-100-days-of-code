import 'dart:math';

import 'package:flutter/material.dart';

class MovingCard extends StatefulWidget {
  const MovingCard({Key? key, required this.frontUrl, required this.backUrl})
      : super(key: key);

  final String frontUrl;
  final String backUrl;

  @override
  _MovingCardState createState() => _MovingCardState();
}

class _MovingCardState extends State<MovingCard>
    with SingleTickerProviderStateMixin {
  bool isFront = true;
  double verticalDrag = 0;

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragStart: (details) {
        controller.reset();

        setState(() {
          isFront = true;
          verticalDrag = 0;
        });
      },
      onVerticalDragUpdate: (details) {
        setState(() {
          verticalDrag += details.delta.dy;
          verticalDrag %= 360;
        });

        setImageSide();
      },
      onVerticalDragEnd: (details) {
        final double end = 360 - verticalDrag >= 180 ? 0 : 360;

        animation =
            Tween<double>(begin: verticalDrag, end: end).animate(controller)
              ..addListener(() {
                setState(() {
                  verticalDrag = animation.value;
                  setImageSide();
                });
              });
        controller.forward();
      },
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(verticalDrag / 180 * pi),
        alignment: Alignment.center,
        child: isFront
            ? Image.asset(widget.frontUrl)
            : Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateX(pi),
                child: Image.asset(widget.backUrl),
              ),
      ),
    );
  }

  void setImageSide() {
    if (verticalDrag <= 90 || verticalDrag >= 270) {
      isFront = true;
    } else {
      isFront = false;
    }
  }
}
