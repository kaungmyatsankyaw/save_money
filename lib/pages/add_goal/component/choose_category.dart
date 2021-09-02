import 'package:app/constant/valuse.dart';
import 'package:app/providers/goal_provider.dart';
import 'package:app/utility/widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ChooseCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Consumer<GoalProvider>(builder: (_, prov, wz) {
            return Row(children: [
              Container(
                  decoration: BoxDecoration(
                      color: prov.getCategoryModel.bgColor,
                      shape: BoxShape.circle),
                  width: 60,
                  height: 60,
                  child: Center(
                      child: Image.asset(
                    'images/goal/${prov.getCategoryModel.imageName}.png',
                    width: 30,
                    height: 30,
                  ))),
              SizedBox(
                width: 10,
              ),
              Text(
                prov.getCategoryModel.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ]);
          }),
          WidgetBuilderHelper.buildChooseCatgoryButton(func: () async {
            var result = await Get.toNamed(StringValues.goalCategoriesRoute,
                arguments: {'type': 'choose-cate'});
            Provider.of<GoalProvider>(context, listen: false)
                .setCatgoryModel(result);
          })
        ],
      ),
    );
  }
}
