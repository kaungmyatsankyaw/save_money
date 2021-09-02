import 'package:app/constant/valuse.dart';
import 'package:app/pages/add_goal/component/add_form.dart';
import 'package:app/pages/add_goal/component/choose_category.dart';

import 'package:app/pages/component/page_app_bar.dart';
import 'package:app/providers/goal_provider.dart';
import 'package:app/utility/widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddGoal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Provider.of<GoalProvider>(context, listen: false).resetModel();
        Provider.of<GoalProvider>(context, listen: false).setFilter('All');
        Navigator.of(context).pop();
        return Future.value(false);
      },
      child: Scaffold(
          appBar: NormalAppBar(
            titleText: StringValues.goalAddTitle,
            buttonText: '',
            showBtn: false,
          ),
          body: WidgetBuilderHelper.buildLayout(
              context: context,
              widget1: ChooseCategory(),
              widget2: Opacity(
                opacity: 1,
                child: Container(
                    child: Text(
                  'Choose Category',
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.grey),
                )),
              ),
              widget3: GoalAddForm())),
    );
  }
}
