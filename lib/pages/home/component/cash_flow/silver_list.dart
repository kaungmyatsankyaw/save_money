import 'package:app/data_model/financial_category_model.dart';
import 'package:app/models/transaction.dart';
import 'package:app/pages/home/component/transaction/trans.dart';
import 'package:app/providers/cash_flow_provider.dart';
import 'package:app/utility/helper.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class BuildSilverList extends StatelessWidget {
  final CashFlowProvider value;
  BuildSilverList({required this.value});

  @override
  Widget build(BuildContext context) {
    return SliverFixedExtentList(
        itemExtent: 160.0,
        delegate: SliverChildListDelegate(
          value.filterType == 'All'
              ? value.transList.map<Widget>((val) {
                  Map res = getTransFinan(val);
                  return newMethod(res['model'], res['cate']);
                }).toList()
              : value.transList
                  .where((e) => e.type == value.filterType)
                  .map((e) {
                  Map res = getTransFinan(e);

                  return newMethod(res['model'], res['cate']);
                }).toList(),
        ));
  }

  Container newMethod(TransactionModel model, FinancialCategory _cate) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.4))),
      height: 120,
      margin: EdgeInsets.symmetric(vertical: 3),
      padding: EdgeInsets.all(10),
      child: TransComponent(
        isDelete: false,
        i: math.Random().nextInt(100),
        model: model,
        cate: _cate,
      ),
    );
  }

  getTransFinan(transModel) {
    TransactionModel model = transModel;
    FinancialCategory cate = Helper.getIcon(
        categoryId: model.category.toString(), type: model.type.toString());
    return {'model': model, 'cate': cate};
  }
}
