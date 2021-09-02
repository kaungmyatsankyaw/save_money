import 'package:app/pages/report/component/report_list.dart';
import 'package:app/providers/report_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/extension/string_ext.dart';

class ReportMasterLayout extends StatelessWidget {
  final ReportProvider reportProvider = ReportProvider();

  getFunction(BuildContext context, {required type}) async {
    
    switch (type) {
      case 'day':
        return reportProvider.selectDate(context);

      case 'month':
        return reportProvider.selectMonth(context);

      case 'year':
        return await reportProvider.selectYear(context);
      // return DatePicker.show
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.4, color: Colors.grey))),
              height: 80,
              child: Consumer<ReportProvider>(builder: (_, prov, wz) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      prov.getShowDate,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            // backgroundColor: Colors.orange,
                            primary: Colors.black),
                        onPressed: () async {
                          var res =
                              await getFunction(context, type: prov.getType);

                          var format =
                              prov.formatDate(prov.getType, inputDate: res);
                          prov.setShowDate(format);
                          prov.getRecordListByType();
                        },
                        child: Text(
                          'Select ' + prov.getType.toString().capitalize(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ))
                  ],
                );
              })),
          Container(
            margin: EdgeInsets.only(top: 80),
            child: ReportList(),
          )
        ],
      ),
    );
  }
}
