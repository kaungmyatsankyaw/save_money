import 'package:app/data_model/financial_category_model.dart';
import 'package:app/models/transaction.dart';
import 'package:app/pages/bycategory/no_data.dart';

import 'package:app/providers/report_provider.dart';
import 'package:app/utility/helper.dart';
import 'package:app/utility/widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportList extends StatelessWidget {
  buildTableRow(TransactionModel e) {
    FinancialCategory _cate = Helper.getIcon(
        categoryId: e.category.toString(), type: e.type.toString());
    return TableRow(
        decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(color: Colors.black45, width: 0.2))),
        children: [
          Helper.buildTableCell(e.date.toString(),
              width: 60, fontWeight: FontWeight.normal),
          TableCell(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8),
              width: 20,
              height: 38,
              child: Row(
                children: [
                  WidgetBuilderHelper.buildCategoryIcon(
                      cate: _cate, width: 30, height: 30),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    _cate.title,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
          Helper.buildTableCell(e.amount.toString(),
              fontWeight: FontWeight.w400,
              sign: e.type.toString() == 'income' ? " + " : " - ",
              color: e.type.toString() == 'income' ? Colors.green : Colors.red,
              width: 40)
        ]);
  }

  getTotalAmount({required List list, required type}) {
    var _sum;
    var _list = list.where((e) => e.type == type);

    if (_list.length == 0)
      return 0;
    else
      _sum = _list
          .map((m) => m.amount.toInt())
          .reduce((a, b) => a.toInt() + b.toInt());

    return _sum;
  }

  getSummary({required list}) {
    var income = getTotalAmount(list: list, type: 'income');
    var expense = getTotalAmount(list: list, type: 'outcome');
    return income - expense;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReportProvider>(builder: (_, prov, wz) {
      return SingleChildScrollView(
        child: prov.getrecList.length == 0
            ? NoData()
            : Column(
                children: [
                  Table(
                      columnWidths: const <int, TableColumnWidth>{
                        0: FixedColumnWidth(120),
                        1: FlexColumnWidth(),
                        2: FixedColumnWidth(120),
                      },
                      defaultVerticalAlignment: TableCellVerticalAlignment.top,
                      children: <TableRow>[
                        TableRow(
                          children: <Widget>[
                            Helper.buildTableHeader('Date'),
                            Helper.buildTableHeader('Type'),
                            Helper.buildTableHeader('Amount')
                          ],
                        ),
                        for (int i = 0; i < prov.getrecList.length; i++)
                          buildTableRow(prov.getrecList[i]),
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      buildContainer(context, prov,
                          color: Colors.green,
                          text: 'Total Income :' +
                              getTotalAmount(
                                      list: prov.getrecList, type: 'income')
                                  .toString()),
                      buildContainer(context, prov,
                          color: Colors.red,
                          text: 'Total Expense : ' +
                              getTotalAmount(
                                      list: prov.getrecList, type: 'outcome')
                                  .toString()),
                    ],
                  ),
                  buildContainer(context, prov,
                      color: Colors.white,
                      textColor: Colors.black,
                      text: 'Summary : ' +
                          getSummary(list: prov.getrecList).toString(),
                      width: MediaQuery.of(context).size.width),
                ],
              ),
      );
    });
  }

  Container buildContainer(BuildContext context, ReportProvider prov,
      {required color, required text, width, textColor = Colors.white}) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width * 0.5,
      height: 60,
      decoration: BoxDecoration(
          color: color,
          border: Border(bottom: BorderSide(width: 0.7, color: Colors.grey))),
      child: Center(
          child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
      )),
    );
  }
}
