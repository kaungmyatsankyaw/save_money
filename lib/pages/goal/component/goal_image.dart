import 'package:flutter/material.dart';

class GoalImage extends StatelessWidget {
  final String imageName;
  final double containerWidth;
  final double containerHeight;
  final double imageWidth;
  final double imageHeight;
  final Color color;
  final bool isPadding;

  GoalImage(
      {required this.imageName,
      required this.imageWidth,
      required this.imageHeight,
      required this.containerHeight,
      required this.containerWidth,
      required this.color,
      this.isPadding = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isPadding ? EdgeInsets.all(14) : EdgeInsets.all(0),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      width: containerWidth,
      height: containerHeight,
      child: Center(
          child: Image.asset(
        'images/goal/$imageName.png',
        width: imageWidth,
        height: imageHeight,
      )),
    );
  }
}
