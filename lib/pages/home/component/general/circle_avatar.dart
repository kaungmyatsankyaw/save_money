import 'package:flutter/material.dart';

class CustomCircelAvatar extends StatelessWidget {
  final String imageUrl;
  final double radius;
  CustomCircelAvatar({required this.imageUrl,this.radius=30});
  Widget build(BuildContext context) {
   
    return CircleAvatar(
      backgroundImage: NetworkImage(imageUrl),
      radius: radius,
    );
  }
}
