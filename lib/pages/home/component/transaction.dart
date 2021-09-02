import 'package:app/constant/valuse.dart';
import 'package:app/controllers/transaction_controller.dart';
import 'package:app/pages/bycategory/no_data.dart';
import 'package:app/pages/component/page_app_bar.dart';
import 'package:app/pages/home/component/transaction/fab.dart';
import 'package:app/pages/home/component/transaction/search_section.dart';
import 'package:app/pages/home/component/transaction/trans_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Transaction extends StatefulWidget {
  @override
  State<Transaction> createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  final TransactionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: CustomFab(),
        appBar: NormalAppBar(
          titleText: 'Transaction',
          buttonText: 'View Report',
          showBtn: true,
          iconData: FontAwesomeIcons.chartLine,
          routeName: StringValues.reportRoute,
        ),
        body: 
        Obx(() => controller.recordList.length == 0
            ? NoData()
            : Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 80), child: TransList()),
                  Positioned(child: SearchSection())
                ],
              )));
  }
}
