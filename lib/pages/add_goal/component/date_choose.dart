import 'package:app/providers/goal_provider.dart';
import 'package:app/utility/widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DateChoose extends StatelessWidget {
  final String dateText;
  final String type;
  final String date;

  DateChoose({required this.dateText, required this.type, required this.date});

  _selectDate(BuildContext context, {required String type}) async {
    FocusScope.of(context).unfocus();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: type == 'start'
          ? DateTime.now()
          : Provider.of<GoalProvider>(context, listen: false)
              .getStartOriginalDate,
      firstDate: type == 'start'
          ? DateTime.now()
          : Provider.of<GoalProvider>(context, listen: false)
              .getStartOriginalDate,
      lastDate: DateTime(2500),
    );
    Provider.of<GoalProvider>(context, listen: false).setDate(date: picked, ty: type);
  }

  @override
  Widget build(BuildContext context) {
    return WidgetBuilderHelper.buildColumn(
      widget1: WidgetBuilderHelper.buildText(dateText, FontWeight.bold),
      widget2: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: WidgetBuilderHelper.buildText(date, FontWeight.w500)),
       
          GestureDetector(
              onTap: () => _selectDate(context, type: type),
              child: FaIcon(FontAwesomeIcons.calendarAlt))
        ],
      ),
    );
  }
}
