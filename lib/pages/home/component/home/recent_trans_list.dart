import 'package:app/controllers/transaction_controller.dart';
import 'package:app/data_model/financial_category_model.dart';
import 'package:app/models/transaction.dart';
import 'package:app/pages/bycategory/no_data.dart';
import 'package:app/pages/home/component/transaction/trans.dart';
import 'package:app/utility/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentTransList extends StatelessWidget {
  final TransactionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => SliverList(
        delegate: SliverChildListDelegate(controller.recordList.length == 0
            ? [
                NoData(
                  top: 10,
                  bottom: 20,
                )
              ]
            : controller.recordList.take(4).map((e) {
                TransactionModel model = e;
                FinancialCategory _cate = Helper.getIcon(
                    categoryId: model.category.toString(),
                    type: model.type.toString());
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: TransComponent(
                    i: e.id,
                    model: model,
                    cate: _cate,
                  ),
                );
              }).toList())));
  }
}
