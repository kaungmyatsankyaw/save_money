import 'package:app/providers/cash_flow_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class BuildFilterWidget extends StatelessWidget {
  final List filterList = [
    {'text': 'All', 'color': Colors.grey, 'type': 'All'},
    {'text': 'Income', 'color': Colors.green, 'type': 'income'},
    {'text': 'Expense', 'color': Colors.red, 'type': 'outcome'},
  ];

  @override
  Widget build(BuildContext context) {
    CashFlowProvider provider =
        Provider.of<CashFlowProvider>(context, listen: false);

    getButtonStyle(Color color, String type) {
      return ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
          primary: color,
          visualDensity: type == provider.getFilterType
              ? VisualDensity(horizontal: 1.2, vertical: 1.6)
              : VisualDensity(),
          textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold));
    }

    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: filterList
              .map(
                (e) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: ElevatedButton(
                      style: getButtonStyle(e['color'], e['type']),
                      onPressed: () {
                        provider.setFilterType(e['type']);
                      },
                      child: Text(e['text'])),
                ),
              )
              .toList()),
    );
  }
}
