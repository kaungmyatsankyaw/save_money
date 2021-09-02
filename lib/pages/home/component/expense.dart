import 'package:app/constant/valuse.dart';
import 'package:app/pages/component/page_app_bar.dart';
import 'package:flutter/material.dart';

class Expense extends StatelessWidget {
  const Expense({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAppBar(
        titleText: StringValues.expansePageTitle,
        buttonText: StringValues.expensePageBtnText,
       routeName: StringValues.addExpenseRoute,
      ),
      body: Container(
        child: Text('goal'),
      ),
    );
  }
}
