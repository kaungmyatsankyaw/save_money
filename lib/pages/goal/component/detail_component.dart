import 'package:app/data_model/goal_category_model.dart';
import 'package:app/models/goal_history.dart';
import 'package:app/models/goals.dart';
import 'package:app/pages/bycategory/no_data.dart';
import 'package:app/pages/goal/component/achieve_goal.dart';
import 'package:app/pages/goal/component/save_detail_info_section.dart';
import 'package:app/pages/goal/component/save_history_card.dart';
import 'package:app/pages/goal/component/save_percent_section.dart';
import 'package:app/utility/helper.dart';
import 'package:app/utility/silver_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

// ignore: must_be_immutable
class DetailComponent extends StatefulWidget {
  GoalModel goalModel = GoalModel();
  List<GoalHistoryModel> historyList = [];

  DetailComponent({required this.goalModel, required this.historyList});

  @override
  _DetailComponentState createState() => _DetailComponentState();
}

class _DetailComponentState extends State<DetailComponent> {
  GoalCategoryModel categoryModel = GoalCategoryModel(
      bgColor: Colors.white, title: '', imageName: 'car', cateId: '');

  var dateDiff;

  initState() {
    super.initState();
  }

  SliverPersistentHeader makeRowHeader(ch,
      {Color color = Colors.white, bool achieve = true}) {
    return achieve == true
        ? SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
                minHeight: 45,
                maxHeight: 55,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      // tileMode: TileMode.decal,
                      colors: <Color>[HexColor('#2c3e50'), HexColor('#bdc3c7')],
                    ),
                  ),
                  child: ch,
                )),
          )
        : SliverPersistentHeader(
            pinned: true,
            delegate: SliverAppBarDelegate(
                minHeight: 45,
                maxHeight: 45,
                child: Container(
                  child: ch,
                )),
          );
  }

  /// Build Title Text With Style
  buildTitleText({required IconData iconData, required String title}) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Opacity(
            opacity: 0.7,
            child: Icon(
              iconData,
              color: Colors.white,
              size: 14,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var gList = GoalCategoryModel.list
        .where((e) => e.cateId == widget.goalModel.categoryid)
        .toList();

    if (gList.length != 0) {
      categoryModel = gList[0];
    }

    dateDiff = Helper.calculateDateDiff(
        startDate: widget.goalModel.start_date,
        endDate: widget.goalModel.end_date);

    return CustomScrollView(
      slivers: [
        widget.goalModel.achieve == 1
            ? makeRowHeader(Container(
                height: 50,
                color: Colors.green[400],
                child: Center(
                  child: Text(
                    'You achieved Goal',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ))
            : makeRowHeader(
                Container(
                  height: 50,
                  color: dateDiff <= 1 ? Colors.red : Colors.orange[800],
                  child: Center(
                    child: Text(
                      'You has $dateDiff days to achieve your goal',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                achieve: false),
        makeRowHeader(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTitleText(
                    title: 'Save Info', iconData: FontAwesomeIcons.infoCircle),
                widget.goalModel.achieve == 1 ? GoalAchieve() : Container()
              ],
            ),
            color: categoryModel.bgColor),
        SliverList(
            delegate: SliverChildListDelegate([
          Card(
            elevation: 2,
            borderOnForeground: false,
            child: Column(
              children: [
                SaveDetailInfoSection(
                  categoryModel: categoryModel,
                  goalModel: widget.goalModel,
                ),
                Divider(
                  thickness: 0.9,
                  color: Colors.grey[350],
                ),
                SavePercentSection(
                  color: categoryModel.bgColor,
                  model: widget.goalModel,
                )
              ],
            ),
          ),
        ])),
        makeRowHeader(
            buildTitleText(
                iconData: FontAwesomeIcons.history, title: 'History'),
            color: categoryModel.bgColor),
        SliverList(
          delegate: SliverChildListDelegate(widget.historyList.length > 0
              ? widget.historyList.map((e) => SaveHistoryCard(e: e)).toList()
              : [
                  NoData(
                    top: 20,
                  )
                ]),
        ),
      ],
    );
  }
}
