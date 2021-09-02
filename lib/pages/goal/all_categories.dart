import 'package:app/constant/valuse.dart';
import 'package:app/data_model/goal_category_model.dart';
import 'package:app/pages/component/goal_category.dart';
import 'package:app/pages/component/page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoalCatgories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;

    return Scaffold(
      appBar: NormalAppBar(
        titleText: StringValues.goalCategoryTitle,
        buttonText: '',
        showBtn: false,
      ),
      body: GridView.count(
          primary: true,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          crossAxisCount: 3,
          children: GoalCategoryModel.list
              .map<Widget>((e) => GestureDetector(
                    onTap: () {
                      if (args == null)
                        Get.toNamed(StringValues.goalByCategoryRoute,
                            arguments: {'cateId': e.cateId, 'title': e.title});
                      else
                        Get.back(result: e);
                    },
                    child: GoalCatgory(
                      model: e,
                    ),
                  ))
              .toList()),
    );
  }
}
