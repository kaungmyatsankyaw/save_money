import 'package:app/constant/valuse.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GeneralModel {
  final IconData icon;
  final String text;
  final String routeName;

  GeneralModel(
      {required this.icon, required this.text, required this.routeName});

  static final settingList = [
    // GeneralModel(
    //     icon: FontAwesomeIcons.gasPump, text: StringValues.generalPetrolPrice,routeName: ''),
    GeneralModel(
        icon: FontAwesomeIcons.exchangeAlt,
        text: StringValues.generalExchangeRate,
        routeName: StringValues.exchangeRoute),
    GeneralModel(
        icon: FontAwesomeIcons.newspaper,
        text: StringValues.generalNews,
        routeName: StringValues.newRoute),
    // GeneralModel(
    // icon: FontAwesomeIcons.idCard, text: StringValues.generalContact,routeName: StringValues.contactRoute),
    GeneralModel(
        icon: FontAwesomeIcons.creditCard,
        text: StringValues.generalCard,
        routeName: StringValues.cardRoute),
    GeneralModel(
        icon: FontAwesomeIcons.tools,
        text: StringValues.generalSetting,
        routeName: StringValues.settingRoute),
  ];
}
