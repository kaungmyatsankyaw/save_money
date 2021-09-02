import 'package:app/data_model/tab_bar_model.dart';
import 'package:app/providers/report_provider.dart';
import 'package:app/utility/widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabBarComponent extends StatefulWidget {
  final String title;
  final List<Widget> tabBarView;
  final List<TabBarModel> tabBar;

  TabBarComponent(
      {required this.title, required this.tabBarView, required this.tabBar});

  @override
  _TabBarComponentState createState() => _TabBarComponentState();
}

class _TabBarComponentState extends State<TabBarComponent>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: widget.tabBar.length, vsync: this);

    _tabController.addListener(() {
      Future.delayed(Duration.zero, () {
        checkView(context);
      });
    });
  }

  checkView(BuildContext context) {
    switch (widget.title) {
      case 'Report':
        var prov = Provider.of<ReportProvider>(context, listen: false);
        prov.setType(widget.tabBar[_tabController.index].type.toString());
        prov.getRecordListByType();
        break;
      case 'News':
        return;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ReportProvider>(context, listen: false)
        .getRecordListByType(ty: 'day');

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        bottom: TabBar(
            onTap: (int i) {
              checkView(context);
              _tabController.animateTo(_tabController.index);
            },
            controller: _tabController,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(0), // Creates border
                color: Colors.blueGrey),
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.blue,
            tabs: widget.tabBar
                .map<Widget>((tabBarModel) => WidgetBuilderHelper.buildTab(
                    tabBarModel.title, tabBarModel.iconData))
                .toList()),
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _tabController,
          children: widget.tabBarView.map<Widget>((e) => e).toList()),
    );
  }
}
