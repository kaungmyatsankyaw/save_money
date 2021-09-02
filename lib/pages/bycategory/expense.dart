import 'package:app/pages/bycategory/chart.dart';
import 'package:app/pages/bycategory/master.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/providers/chart_providers.dart';

class ExpenseByCategory extends StatelessWidget {
  Widget build(BuildContext context) {
    Provider.of<ChartProvider>(context, listen: false).setCtype('outcome');
    return MasterLayout(
      title: 'Expense By Category',
      widget: CircularChart(),
    );
  }
}
