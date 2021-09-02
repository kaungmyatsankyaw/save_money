import 'package:flutter/material.dart';

class GoalAchieve extends StatelessWidget {
  const GoalAchieve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration:
              BoxDecoration(color: Colors.green, shape: BoxShape.circle),
          width: 30,
          height: 30,
          child: Center(
              child: Icon(
            Icons.check,
            size: 20,
            color: Colors.white,
          )),
        ));
  }
}
