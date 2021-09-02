import 'package:app/providers/cash_flow_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectType extends StatelessWidget {
  const SelectType({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CashFlowProvider>(builder: (_, prov, wz) {
      return DropdownButton<String>(
        value: prov.type,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        underline: Container(
          height: 2,
          color: Colors.black26,
        ),
        onChanged: (String? newValue) {
          prov.setType(newValue);
        },
        items: <String>[
          'Current',
          'Last',
          'All',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: value != 'All' ? Text(value + ' Month') : Text(value),
          );
        }).toList(),
      );
    });
  }
}
