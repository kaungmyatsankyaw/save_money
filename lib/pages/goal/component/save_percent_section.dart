import 'package:app/models/goals.dart';
import 'package:app/pages/goal/component/save_percentage.dart';
import 'package:flutter/material.dart';

class SavePercentSection extends StatelessWidget {
  final Color color;
  final GoalModel model;

  SavePercentSection({required this.color, required this.model});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          width: MediaQuery.of(context).size.width * 0.25,
          child: Text(
            'Progress',
            style: TextStyle(fontWeight: FontWeight.w300),
          )),
      Container(
          width: MediaQuery.of(context).size.width * 0.7,
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
          margin: EdgeInsets.only(top: 10, bottom: 10),
          child: SavePercentage(
            color: color,
            saveAmount: model.save_amount ?? 0,
            currentAmount: model.current_amount ?? 0,
          )),
    ]);
  }
}
