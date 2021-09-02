import 'package:app/constant/valuse.dart';
import 'package:app/data_model/goal_category_model.dart';
import 'package:app/pages/bycategory/no_data.dart';
import 'package:app/pages/component/goal_category.dart';
import 'package:app/pages/component/goal_component.dart';
import 'package:app/pages/component/page_app_bar.dart';
import 'package:app/providers/goal_provider.dart';
import 'package:app/utility/silver_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'goal/index.dart';

class Goal extends StatefulWidget {
  @override
  _GoalState createState() => _GoalState();
}

class _GoalState extends State<Goal> {
  late List<GoalCategoryModel> cate = GoalCategoryModel.list;
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 0), () {
      Provider.of<GoalProvider>(context, listen: false).setFilter('All');
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.5;
    final double itemWidth = size.width / 2;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          title: Text(
            StringValues.goalPageTitle,
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            Container(
                margin: EdgeInsets.all(8),
                child: NormalAppBar.getButton(
                    routeName: StringValues.addGoalRoute,
                    iconData: FontAwesomeIcons.plusSquare,
                    buttonText: StringValues.goalAddTitle))
          ],
          pinned: true,
        ),
        SliverAppBarDelegate.makeRowHeader(CategoryRow()),
        SliverGrid.count(
            childAspectRatio: (itemWidth / itemHeight),
            crossAxisCount: 4,
            children: cate
                .take(4)
                .map((e) => Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      height: 100,
                      child: GestureDetector(
                          onTap: () {
                            Get.toNamed(StringValues.goalByCategoryRoute,
                                arguments: {
                                  'cateId': e.cateId,
                                  'title': e.title
                                });
                          },
                          child: GoalCatgory(model: e)),
                    ))
                .toList()),
        SliverAppBarDelegate.makeRowHeader(
          SectionTitle(),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Consumer<GoalProvider>(builder: (_, prov, wz) {
            return Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: prov.getGoalList.length == 0
                    ? NoData()
                    : prov.getFilter == "All"
                        ? Column(
                            children: prov.getGoalList
                                .map<Widget>((e) => GoalComponent(
                                      goalModel: e,
                                    ))
                                .toList(),
                          )
                        : Column(
                            children: prov.getGoalList
                                .where((e) => e.achieve == 1)
                                .map<Widget>((e) => GoalComponent(
                                      goalModel: e,
                                    ))
                                .toList(),
                          ));
          }),
        ]))
      ],
    );
  }
}
