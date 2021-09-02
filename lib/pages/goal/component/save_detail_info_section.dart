import 'package:app/data_model/goal_category_model.dart';
import 'package:app/models/goals.dart';
import 'package:app/pages/goal/component/build_text.dart';
import 'package:app/pages/goal/component/goal_image.dart';
import 'package:app/utility/helper.dart';
import 'package:flutter/material.dart';

class SaveDetailInfoSection extends StatelessWidget {
  final GoalCategoryModel categoryModel;
  final GoalModel goalModel;

  SaveDetailInfoSection({required this.categoryModel, required this.goalModel});

  suggestSaveAmount() {
    var dateLong = Helper.calculateDateDiff(
        startDate: goalModel.start_date, endDate: goalModel.end_date);
    if (dateLong == 0) return goalModel.save_amount;
    return (goalModel.save_amount! / dateLong).round();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.2,
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GoalImage(
                  imageName: categoryModel.imageName,
                  imageWidth: 30,
                  imageHeight: 30,
                  containerHeight: 70,
                  containerWidth: 70,
                  color: categoryModel.bgColor),
              SizedBox(
                height: 10,
              ),
              Text(
                categoryModel.title.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.symmetric(vertical: 16),
          width: MediaQuery.of(context).size.width * 0.65,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BuildText(
                isAmount: true,
                txt1: 'Save Amount',
                txt2: goalModel.save_amount,
              ),
              BuildText(
                isAmount: true,
                txt1: 'Current Amount',
                txt2: goalModel.current_amount,
              ),
              BuildText(
                txt1: 'Start Date',
                txt2: goalModel.start_date.toString(),
              ),
              BuildText(
                txt1: 'End Date',
                txt2: goalModel.end_date.toString(),
              ),
              goalModel.achieve != 1
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Suggest Save Amount '),
                            Text('(Daily)')
                          ],
                        ),
                        Text(
                          suggestSaveAmount().toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  : Container()
            ],
          ),
        )
      ],
    );
  }
}
