import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum FinancialType { Income, Outcome }

class FinancialCategory {
  final String title;
  final String id;
  late IconData icon;
  late Color iconColor;
  final String description;
  final FinancialType type;
  final Color backgroundColor;

  FinancialCategory(
      {required this.id,
      required this.title,
      required this.icon,
      required this.type,
      required this.description,
      required this.backgroundColor,
      required this.iconColor});

  static final incomeCategoryList = [
    FinancialCategory(
        id: 'icome_1',
        title: 'Tip',
        icon: FontAwesomeIcons.lightbulb,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Income,
        backgroundColor: Colors.orange),
    FinancialCategory(
      id: 'icome_2',
      title: 'Salary',
      icon: FontAwesomeIcons.moneyCheck,
      iconColor: Colors.white,
      description: '',
      type: FinancialType.Income,
      backgroundColor: Colors.orange,
    ),
    FinancialCategory(
        id: 'icome_3',
        title: 'Save',
        icon: FontAwesomeIcons.dollarSign,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Income,
        backgroundColor: Colors.redAccent),
    FinancialCategory(
        id: 'icome_4',
        title: 'Profit',
        icon: FontAwesomeIcons.chartLine,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Income,
        backgroundColor: Colors.greenAccent),
    FinancialCategory(
        id: 'icome_5',
        title: 'Loan',
        icon: FontAwesomeIcons.landmark,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Income,
        backgroundColor: Colors.redAccent),
    FinancialCategory(
        id: 'icome_6',
        title: 'Bussiness',
        icon: FontAwesomeIcons.suitcase,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Income,
        backgroundColor: Colors.blue),
        FinancialCategory(
        id: 'income_7',
        title: 'Other',
        icon: FontAwesomeIcons.ellipsisH,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Outcome,
        backgroundColor: Colors.teal)
  ];

  static final outcomeCategoryList = [
    FinancialCategory(
        id: 'outcome_1',
        title: 'Bill',
        icon: FontAwesomeIcons.moneyBill,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Outcome,
        backgroundColor: Colors.orange),
    FinancialCategory(
        id: 'outcome_2',
        title: 'Food',
        icon: FontAwesomeIcons.bacon,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Outcome,
        backgroundColor: Colors.black),
    FinancialCategory(
        id: 'outcome_3',
        title: 'Drink',
        icon: FontAwesomeIcons.beer,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Outcome,
        backgroundColor: Colors.redAccent),
    FinancialCategory(
        id: 'outcome_4',
        title: 'Shopping',
        icon: FontAwesomeIcons.shoppingCart,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Outcome,
        backgroundColor: Colors.greenAccent),
    FinancialCategory(
        id: 'outcome_5',
        title: 'Bus Expense',
        icon: FontAwesomeIcons.bus,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Outcome,
        backgroundColor: Colors.redAccent),
    FinancialCategory(
        id: 'outcome_6',
        title: 'Train',
        icon: FontAwesomeIcons.train,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Outcome,
        backgroundColor: Colors.blue),
    FinancialCategory(
        id: 'outcome_7',
        title: 'Pet',
        icon: FontAwesomeIcons.paw,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Outcome,
        backgroundColor: Colors.grey),
    FinancialCategory(
        id: 'outcome_8',
        title: 'Book',
        icon: FontAwesomeIcons.book,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Outcome,
        backgroundColor: Colors.blueGrey),
    FinancialCategory(
        id: 'outcome_9',
        title: 'Gift',
        icon: FontAwesomeIcons.dumbbell,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Outcome,
        backgroundColor: Colors.blue),
    FinancialCategory(
        id: 'outcome_10',
        title: 'Yoga',
        icon: FontAwesomeIcons.personBooth,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Outcome,
        backgroundColor: Colors.green),
    FinancialCategory(
        id: 'outcome_11',
        title: 'Smoking',
        icon: FontAwesomeIcons.smoking,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Outcome,
        backgroundColor: Colors.pink),
    FinancialCategory(
        id: 'outcome_12',
        title: 'Game',
        icon: FontAwesomeIcons.gamepad,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Outcome,
        backgroundColor: Colors.blue),
    FinancialCategory(
        id: 'outcome_13',
        title: 'Cloth',
        icon: FontAwesomeIcons.tshirt,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Outcome,
        backgroundColor: Colors.grey),
    FinancialCategory(
        id: 'outcome_14',
        title: 'Fees',
        icon: FontAwesomeIcons.graduationCap,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Outcome,
        backgroundColor: Colors.greenAccent),
    FinancialCategory(
        id: 'outcome_15',
        title: 'Birth',
        icon: FontAwesomeIcons.birthdayCake,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Outcome,
        backgroundColor: Colors.red),
    FinancialCategory(
        id: 'outcome_16',
        title: 'Health',
        icon: FontAwesomeIcons.plus,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Outcome,
        backgroundColor: Colors.red),
    FinancialCategory(
        id: 'outcome_17',
        title: 'Travel',
        icon: FontAwesomeIcons.car,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Outcome,
        backgroundColor: Colors.blue),
    FinancialCategory(
        id: 'outcome_18',
        title: 'Tax',
        icon: FontAwesomeIcons.moneyBillWave,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Outcome,
        backgroundColor: Colors.purple),
    FinancialCategory(
        id: 'outcome_19',
        title: 'Other',
        icon: FontAwesomeIcons.ellipsisH,
        iconColor: Colors.white,
        description: '',
        type: FinancialType.Outcome,
        backgroundColor: Colors.teal),
  ];
}
