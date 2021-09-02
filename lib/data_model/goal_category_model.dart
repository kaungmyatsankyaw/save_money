import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class GoalCategoryModel {
  late String cateId;
  late String title;
  late String imageName;
  late Color bgColor;

  GoalCategoryModel(
      {required this.cateId,
      required this.title,
      required this.imageName,
      required this.bgColor});

  static List<GoalCategoryModel> list = [
    GoalCategoryModel(
        cateId: 'goal_1',
        title: 'Buy Phone',
        imageName: 'mobile-phone',
        bgColor: Colors.green),
    GoalCategoryModel(
        cateId: 'goal_2',
        title: 'Buy House',
        imageName: 'house',
        bgColor: HexColor('#451e3e')),
    GoalCategoryModel(
        cateId: 'goal_3',
        title: 'Buy Laptop',
        imageName: 'laptop',
        bgColor: Colors.orange),
    GoalCategoryModel(
        cateId: 'goal_4',
        title: 'Life Insurance',
        imageName: 'life-insurance',
        bgColor: Colors.teal),
    GoalCategoryModel(
        cateId: 'goal_5',
        title: 'House Repair',
        imageName: 'house-repair',
        bgColor: Colors.black),
    GoalCategoryModel(
        cateId: 'goal_6',
        title: 'Buy Car',
        imageName: 'car',
        bgColor: Colors.cyan),
    GoalCategoryModel(
        cateId: 'goal_7',
        title: 'Car Repair',
        imageName: 'car-repair',
        bgColor: HexColor('#4f5b66')),
    GoalCategoryModel(
        cateId: 'goal_8',
        title: 'Buy Clothes',
        imageName: 'clothes-rack',
        bgColor: Colors.orange),
    GoalCategoryModel(
        cateId: 'goal_9',
        title: 'Health',
        imageName: 'pharmacy',
        bgColor: Colors.red),
    GoalCategoryModel(
        cateId: 'goal_10',
        title: 'Car Insurace',
        imageName: 'protection',
        bgColor: Colors.deepOrange),
    GoalCategoryModel(
        cateId: 'goal_11',
        title: 'Travel',
        imageName: 'suitcase',
        bgColor: Colors.lightGreen),
    GoalCategoryModel(
        cateId: 'goal_12',
        title: 'University',
        imageName: 'graduation',
        bgColor: HexColor('#35a79c')),
    GoalCategoryModel(
        cateId: 'goal_13',
        title: 'Wedding',
        imageName: 'wedding',
        bgColor: Colors.teal),
    GoalCategoryModel(
        cateId: 'goal_14',
        title: 'Anniversary',
        imageName: 'anniversary',
        bgColor: Colors.pink),
    GoalCategoryModel(
        cateId: 'goal_15',
        title: 'Buy TV',
        imageName: 'television',
        bgColor: Colors.cyan),
    GoalCategoryModel(
        cateId: 'goal_16',
        title: 'Buy Motorcycle',
        imageName: 'motorbike',
        bgColor: HexColor('#c68642')),
    GoalCategoryModel(
        cateId: 'goal_17',
        title: 'Buy Bicycle',
        imageName: 'bicycle',
        bgColor: Colors.cyan),
    GoalCategoryModel(
        cateId: 'goal_18',
        title: 'Game',
        imageName: 'gamepad',
        bgColor: HexColor('#03396c')),
    GoalCategoryModel(
        cateId: 'goal_19',
        title: 'Buy Refrigerator',
        imageName: 'refrigerator',
        bgColor: HexColor('#4a4e4d')),
    GoalCategoryModel(
        cateId: 'goal_20',
        title: 'Buy AirCon',
        imageName: 'air-conditioner',
        bgColor: Colors.lime),
  ];
}
