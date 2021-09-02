import 'package:app/models/goal_history.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SaveHistoryCard extends StatelessWidget {
  final GoalHistoryModel e;
  SaveHistoryCard({required this.e});
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Container(
          width: 35,
          height: 35,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.blueGrey),
          child: Icon(
            FontAwesomeIcons.dollarSign,
            size: 18,
            color: Colors.white,
          )),
      subtitle: Text(
        e.date.toString(),
        style: TextStyle(fontSize: 12),
      ),
      title: Text(
        e.amount.toString(),
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    ));
  }
}
