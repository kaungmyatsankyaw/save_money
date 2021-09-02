import 'package:app/data_model/goal_category_model.dart';
import 'package:app/pages/goal/component/goal_image.dart';
import 'package:flutter/material.dart';

class GoalCatgory extends StatelessWidget {
  final GoalCategoryModel model;

  GoalCatgory({required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          GoalImage(
              imageName: model.imageName,
              imageWidth: 35,
              imageHeight: 35,
              containerHeight: 65,
              containerWidth: 65,
              color: model.bgColor),
          SizedBox(
            height: 10,
          ),
          Text(
            model.title,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
