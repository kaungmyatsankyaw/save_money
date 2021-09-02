import 'package:app/pages/report/component/master.dart';
import 'package:app/providers/report_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportByDay extends StatefulWidget {
  const ReportByDay({Key? key}) : super(key: key);

  @override
  _ReportByDayState createState() => _ReportByDayState();
}

class _ReportByDayState extends State<ReportByDay> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      var prov = Provider.of<ReportProvider>(context, listen: false);
      prov.setType('day');
      prov.getRecordListByType();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReportMasterLayout();
  }
}
