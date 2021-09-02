// import 'package:app/pages/home/component/goal/section_title.dart';
import 'package:app/pages/home/component/home/custom_silver_appbar.dart';
// import 'package:app/pages/home/component/home/home_slider.dart';
import 'package:app/pages/home/component/home/recent_trans_list.dart';
import 'package:app/pages/home/component/home/section_title.dart';
// import 'package:app/pages/home/index.dart';
// import 'package:app/utility/silver_list.dart';
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'home/recent_goal_list.dart';

class HomeComponent extends StatelessWidget {
  const HomeComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        CustomSilverAppBar(),
        // HomeSlider(),
        HomeSectionTitle(title: 'Recent Goals'),
        RecentGoal(),
        HomeSectionTitle(title: 'Recent Transactions'),
        RecentTransList(),
      ],
    );
  }
}
