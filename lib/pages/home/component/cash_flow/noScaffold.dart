import 'package:app/pages/bycategory/no_data.dart';
import 'package:app/pages/component/page_app_bar.dart';
import 'package:flutter/material.dart';

class NoDataScaffold extends StatelessWidget {
  const NoDataScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAppBar(
        titleText: 'CashFlow',
        buttonText: '',
        showBtn: false,
      ),
      body: NoData(),
    );
  }
}
