import 'package:app/controllers/transaction_controller.dart';
import 'package:app/data_model/financial_category_model.dart';
import 'package:app/models/transaction.dart';
import 'package:app/pages/bycategory/no_data.dart';
import 'package:app/pages/home/component/transaction/trans.dart';
import 'package:app/utility/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransList extends StatelessWidget {
  final TransactionController controller = Get.find();

  getList() {
    var list;

    if (controller.searchString.value == '')
      list = controller.recordList.value;
    else
      list = controller.recordList.value
          .where((e) => e.category == controller.searchString.value);

    if (list.length == 0) {
      return [NoData()];
    }

    List<Widget> res = list.map<Widget>((e) {
      TransactionModel model = e;
      FinancialCategory _cate = Helper.getIcon(
          categoryId: model.category.toString(), type: model.type.toString());

      return Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: TransComponent(
                i: e.id,
                model: model,
                cate: _cate,
              )),
          Divider(color: Colors.grey, height: 3)
        ],
      );
    }).toList();
    return res;
  }

  @override
  Widget build(BuildContext context) {
    controller.setSearchString('');
    return Obx(() => ListView(children: getList()));
  }
}
