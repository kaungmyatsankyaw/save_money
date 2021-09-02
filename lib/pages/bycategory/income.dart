import 'package:app/pages/bycategory/chart.dart';
import 'package:app/pages/bycategory/master.dart';
import 'package:app/providers/chart_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class IncomeByCategory extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    Provider.of<ChartProvider>(context,listen: false).setCtype('income');
    return MasterLayout(
      title: 'Income By Category',
      widget: 
          CircularChart(),
    );
  }
}
