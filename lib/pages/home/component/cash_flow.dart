import 'package:app/pages/bycategory/no_data.dart';
import 'package:app/pages/home/component/cash_flow/chart.dart';
import 'package:app/pages/home/component/cash_flow/customAppBar.dart';
import 'package:app/providers/cash_flow_provider.dart';
import 'package:app/utility/silver_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cash_flow/filter_widget.dart';
import 'cash_flow/silver_list.dart';

class CashFlow extends StatelessWidget {
  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        minHeight: 50.0,
        maxHeight: 60.0,
        child: Container(
            // color: Colors.teal,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                tileMode: TileMode.repeated,
                colors: <Color>[
                  Colors.black,
                  Colors.blueGrey,
                ],
              ),
            ),
            child: buildText(headerText, Colors.white)),
      ),
    );
  }

  SliverPersistentHeader makeRowHeader(ch) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
          minHeight: 65,
          maxHeight: 65,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                tileMode: TileMode.repeated,
                colors: <Color>[
                  Colors.white,
                  Colors.blueGrey,
                ],
              ),
            ),
            child: ch,
          )),
    );
  }

  buildText(String headerText, Color color) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: Text(
        headerText == 'All' ? 'All' : headerText,
        style:
            TextStyle(fontSize: 14, color: color, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CashFlowProvider>(
      builder: (_, value, w) => CustomScrollView(
          slivers: value.cashFlow.length != 0
              ? value.type != 'All'
                  ? [
                      CustomSilverAppBar(),
                      makeHeader('Data By Graph'),
                      SliverList(
                          delegate: SliverChildListDelegate(
                              value.type == 'Last' || value.type == 'Current'
                                  ? value.transList.length >= 3
                                      ? [
                                          Chart(
                                            cList: value.chartList,
                                          ),
                                        ]
                                      : [
                                          Container(
                                              height: 100,
                                              child: buildText(
                                                  'No Enough Info To Show Graph By',
                                                  Colors.black))
                                        ]
                                  : [NoData(top: 40, bottom: 30)])),
                      makeHeader('Record List By ${value.getType}'),
                      makeRowHeader(BuildFilterWidget()),
                      BuildSilverList(value: value),
                    ]
                  : [
                      CustomSilverAppBar(),
                      makeHeader('Record List By All'),
                      makeRowHeader(BuildFilterWidget()),
                      BuildSilverList(value: value),
                    ]
              : [
                  CustomSilverAppBar(),
                  SliverList(
                      delegate: SliverChildListDelegate([
                    NoData(
                      top: MediaQuery.of(context).size.height * 0.3,
                    )
                  ]))
                ]),
    );
  }
}
