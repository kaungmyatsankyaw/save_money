import 'package:app/constant/valuse.dart';
import 'package:app/pages/home/component/cash_flow/selectType.dart';
import 'package:app/providers/cash_flow_provider.dart';
import 'package:app/utility/widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CustomSilverAppBar extends StatelessWidget {
  CustomSilverAppBar();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    return Consumer<CashFlowProvider>(
        builder: (_, value, w) => SliverAppBar(
          
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SelectType(),
                )
              ],
              title: Text(
                'CashFlow',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      //   begin: Alignment.center,
                      tileMode: TileMode.mirror,
                      colors: <Color>[Colors.white12, Colors.black26],
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 80, left: 10, right: 10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: value.cashFlow.map((e) {
                          return WidgetBuilderHelper.buildCard(
                              route: e['type'] == 'income'
                                  ? StringValues.incomeCategory
                                  : StringValues.expenseCategory,
                              width: width,
                              height: height,
                              gColor1: e['type'] == 'income'
                                  ? Colors.blueGrey
                                  : Colors.grey,
                              gColor2: e['type'] == 'income'
                                  ? Colors.black
                                  : Colors.black,
                              iconData: e['type'] == 'income'
                                  ? FontAwesomeIcons.solidArrowAltCircleLeft
                                  : FontAwesomeIcons.solidArrowAltCircleRight,
                              text: e['type'].toString().toUpperCase(),
                              amount: e['amount']);
                        }).toList()),
                  ),
                ),
              ),
              pinned: true,
              snap: false,
              floating: true,
              expandedHeight: value.cashFlow.length == 0 ? 0 : 250,
            ));

    //   SliverAppBar(
    //     actions: [
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 20),
    //         child: SelectType(),
    //       )
    //     ],
    //     title: Text(
    //       'CashFlow',
    //       style: TextStyle(color: Colors.black),
    //     ),
    //     backgroundColor: Colors.white,
    //     flexibleSpace: FlexibleSpaceBar(
    //       collapseMode: CollapseMode.parallax,
    //       background: Container(
    //         decoration: BoxDecoration(
    //           gradient: LinearGradient(
    //             //   begin: Alignment.center,
    //             tileMode: TileMode.mirror,
    //             colors: <Color>[Colors.white12, Colors.black26],
    //           ),
    //         ),
    //         child: Container(
    //           margin: EdgeInsets.only(top: 80, left: 10, right: 10),
    //           child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               children: cashFlow.map((e) {
    //                 return WidgetBuilderHelper.buildCard(
    //                     route: e['type'] == 'income'
    //                         ? StringValues.incomeCategory
    //                         : StringValues.expenseCategory,
    //                     width: width,
    //                     height: height,
    //                     gColor1:
    //                         e['type'] == 'income' ? Colors.blue : Colors.grey,
    //                     gColor2:
    //                         e['type'] == 'income' ? Colors.black : Colors.black45,
    //                     iconData: e['type'] == 'income'
    //                         ? FontAwesomeIcons.solidArrowAltCircleLeft
    //                         : FontAwesomeIcons.solidArrowAltCircleRight,
    //                     text: e['type'].toString().toUpperCase(),
    //                     amount: e['amount']);
    //               }).toList()),
    //         ),
    //       ),
    //     ),
    //     pinned: true,
    //     snap: false,
    //     floating: true,
    //     expandedHeight: cashFlow.length == 0 ? 0 : 250,
    //   );
    // }
  }
}
