import 'package:app/pages/component/page_app_bar.dart';
import 'package:app/providers/chart_providers.dart';
import 'package:app/utility/helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MasterLayout extends StatelessWidget {
  final String title;
  final Widget widget;

  MasterLayout({required this.title, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAppBar(
        titleText: title,
        buttonText: '',
        showBtn: false,
      ),
      body: Stack(children: [
        widget,
        Card(child: Consumer<ChartProvider>(builder: (_, chartProvider, wz) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: chartProvider.startDate == null ? 100 : 140,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Select Filter',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                    DropdownButton<String>(
                      value: chartProvider.type,
                      icon: const Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      underline: Container(
                        height: 2,
                        color: Colors.blue,
                      ),
                      onChanged: (String? newValue) async {
                        chartProvider.setType(newValue);

                        switch (newValue) {
                          case 'All':
                            return chartProvider.getByCategory();

                          case 'Range':
                            Helper.showDatePicker(context, prov: chartProvider);
                            return;
                          default:
                        }
                      },
                      items: <String>['All', 'Range']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                chartProvider.startDate != null
                    ? Container(
                        padding: EdgeInsets.all(14),
                        color: Colors.black26,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Helper.formatText(
                                chartProvider.startDate.toString(), 18.0),
                            Helper.formatText('-', 14),
                            Helper.formatText(
                                chartProvider.endDate.toString(), 18.0)
                          ],
                        ),
                      )
                    : Container()
              ],
            ),
          );
        }))
      ]),
    );
  }
}
