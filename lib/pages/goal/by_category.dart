import 'package:app/constant/valuse.dart';
import 'package:app/pages/bycategory/no_data.dart';
import 'package:app/pages/component/goal_component.dart';
import 'package:app/pages/component/page_app_bar.dart';
import 'package:app/providers/goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class GoalByCategory extends StatefulWidget {
  @override
  _GoalByCategoryState createState() => _GoalByCategoryState();
}

class _GoalByCategoryState extends State<GoalByCategory> {
  var cateId = 0.toString(), title = '';
  @override
  void initState() {
    super.initState();
    var args = Get.arguments;
    cateId = args['cateId'];
    title = args['title'];
    // getData(cateId: cateId);
  }

  getData({required cateId}) async {
    await Provider.of<GoalProvider>(context, listen: false)
        .getGoalByCategory(cateId: cateId);
  }

  @override
  Widget build(BuildContext context) {
    getData(cateId: cateId);
    return Scaffold(
      appBar: NormalAppBar(
        titleText: StringValues.goalByCategoryTitle,
        buttonText: '',
        showBtn: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                color: Colors.blueGrey.shade500,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 30),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                )),
            Consumer<GoalProvider>(builder: (_, prov, wz) {
              return prov.getGoalByCateogryList.length == 0
                  ? Center(child: NoData())
                  : Column(
                      children: prov.getGoalByCateogryList
                          .map<Widget>((e) => GoalComponent(
                                goalModel: e,
                              ))
                          .toList(),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
