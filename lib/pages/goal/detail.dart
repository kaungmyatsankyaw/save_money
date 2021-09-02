import 'package:app/constant/valuse.dart';
import 'package:app/pages/component/page_app_bar.dart';
import 'package:app/pages/goal/component/custom_fab.dart';
import 'package:app/pages/goal/component/detail_component.dart';
import 'package:app/providers/goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class GoalDetail extends StatefulWidget {
  @override
  _GoalDetailState createState() => _GoalDetailState();
}

class _GoalDetailState extends State<GoalDetail> {
  var id;
  @override
  void initState() {
    super.initState();
    var args = Get.arguments;
    id = args['id'];

    Provider.of<GoalProvider>(context, listen: false).getGoalDetail(id);
    Provider.of<GoalProvider>(context, listen: false).getAllHistory(saveId: id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAppBar(
        titleText: StringValues.goalDetailTitle,
        showBtn: false,
        buttonText: '',
      ),
      body: Consumer<GoalProvider>(builder: (_, prov, wz) {
        return DetailComponent(
          historyList: prov.goalHistoryList,
          goalModel: prov.getGoalDetailProv,
        );
      }),
      floatingActionButton: CustomFabDetail(
        saveId: id,
      ),
    );
  }
}
