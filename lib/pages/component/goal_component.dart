import 'package:app/constant/valuse.dart';
import 'package:app/data_model/goal_category_model.dart';
import 'package:app/models/goals.dart';
import 'package:app/pages/goal/component/achieve_goal.dart';
import 'package:app/pages/goal/component/build_amount_text.dart';
import 'package:app/pages/goal/component/goal_image.dart';
import 'package:app/pages/goal/component/save_percentage.dart';
import 'package:app/utility/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class GoalComponent extends StatefulWidget {
  final GoalModel goalModel;

  GoalComponent({required this.goalModel});

  @override
  _GoalComponentState createState() => _GoalComponentState();
}

class _GoalComponentState extends State<GoalComponent> {
  late GoalCategoryModel? model;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    model = GoalCategoryModel.list
        .where((e) => e.cateId == widget.goalModel.categoryid)
        .toList()[0];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(StringValues.goalDetailRoute,
              arguments: {'id': widget.goalModel.id});
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(14),
                            child: GoalImage(
                                isPadding: true,
                                imageName: model!.imageName,
                                imageWidth: 20,
                                imageHeight: 20,
                                containerHeight: 45,
                                containerWidth: 45,
                                color: model!.bgColor),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model!.title,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              widget.goalModel.achieve == 0
                                  ? Text(
                                      Helper.calculateDateDiff(
                                                  startDate: widget
                                                      .goalModel.start_date,
                                                  endDate:
                                                      widget.goalModel.end_date)
                                              .toString() +
                                          ' Days Left',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300),
                                    )
                                  : Text('Goal Achieve',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300))
                            ],
                          ),
                        ],
                      ),
                      widget.goalModel.achieve == 1
                          ? GoalAchieve()
                          : Container()
                    ],
                  )),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 1),
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: SavePercentage(
                    saveAmount: widget.goalModel.save_amount,
                    currentAmount: widget.goalModel.current_amount,
                    color: model!.bgColor,
                  )),
              Container(
                margin: EdgeInsets.all(14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BuildAmountText(
                      amount: widget.goalModel.save_amount,
                    ),
                    BuildAmountText(
                      amount: widget.goalModel.current_amount,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
