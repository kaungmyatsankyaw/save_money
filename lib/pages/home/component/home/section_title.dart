import 'package:app/utility/silver_list.dart';
import 'package:flutter/material.dart';

class HomeSectionTitle extends StatelessWidget {
  final String title;

  HomeSectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBarDelegate.makeRowHeader(
        Container(
          margin: EdgeInsets.all(20),
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
          ),
        ),
        isCenter: false);
  }
}
