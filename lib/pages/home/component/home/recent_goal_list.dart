import 'package:app/pages/bycategory/no_data.dart';
import 'package:app/pages/component/goal_component.dart';
import 'package:app/providers/goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentGoal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      Consumer<GoalProvider>(builder: (_, prov, wz) {
        return prov.getGoalList.length == 0
            ? NoData(
                top: 10,
                bottom: 20,
              )
            : Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: prov.getGoalList
                      .take(3)
                      .map<Widget>((e) => GoalComponent(
                            goalModel: e,
                          ))
                      .toList(),
                ));
      }),
    ]));
  }
}
