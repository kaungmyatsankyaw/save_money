import 'package:app/constant/valuse.dart';
import 'package:app/data_model/tab_bar_model.dart';
import 'package:app/pages/component/tabbar_component.dart';
import 'package:app/pages/report/component/by_day.dart';
import 'package:app/pages/report/component/by_month.dart';
import 'package:app/pages/report/component/by_yeart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Report extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarComponent(
      tabBarView: [ReportByDay(), ReportByMonth(), ReportByYear()],
      tabBar: [
        TabBarModel(
            title: 'Daily',
            iconData: FontAwesomeIcons.calendarDay,
            type: 'day'),
        TabBarModel(
            title: 'Monthly',
            iconData: FontAwesomeIcons.calendarAlt,
            type: 'month'),
        TabBarModel(
            title: 'Yearly',
            iconData: FontAwesomeIcons.calendarWeek,
            type: 'year'),
      ],
      title: StringValues.reportTitle,
    );
  }
}
