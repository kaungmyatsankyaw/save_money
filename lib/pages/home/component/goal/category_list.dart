import 'package:app/data_model/goal_category_model.dart';
import 'package:app/pages/component/goal_category.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.horizontal,
        children: GoalCategoryModel.list
            .take(5)
            .map((e) => Container(
                  width: MediaQuery.of(context).size.width * 0.26,
                  child: GoalCatgory(
                    model: e,
                  ),
                ))
            .toList());
  }
}
