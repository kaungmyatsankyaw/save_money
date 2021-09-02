import 'package:app/constant/valuse.dart';
import 'package:app/controllers/exchange_rate.dart';
import 'package:app/pages/component/page_app_bar.dart';
import 'package:app/utility/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExchangeRate extends StatelessWidget {
  final ExchangeRateController _exchangeRateController =
      Get.put(ExchangeRateController());

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    _exchangeRateController.formatDate(picked);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Scaffold(
        appBar: NormalAppBar(
          titleText: StringValues.generalExchangeRate,
          buttonText: '',
          showBtn: false,
        ),
        body: Container(
          width: width * 0.9,
          margin: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: 10),
          child: SingleChildScrollView(
              child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    'Date - ' + _exchangeRateController.date.value,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                  onPressed: () => _selectDate(context),
                  child: Text('Choose Date'),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                'Central Bank Of Myanmar',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            GetBuilder<ExchangeRateController>(
              init: ExchangeRateController(),
              builder: (e) {
                if (e.exchangeRate['exchange'].isEmpty) {
                  return CircularProgressIndicator();
                }
                if (e.exchangeRate['no_data'] == true) {
                  return Container(
                    child: Center(
                      child: Text('No Data'),
                    ),
                  );
                }
                return Table(
                  border: TableBorder.all(),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    TableRow(
                      children: <Widget>[
                        Helper.buildTableHeader('Currency'),
                        Helper.buildTableHeader('Amount')
                      ],
                    ),
                    for (String key in e.exchangeRate['exchange'].keys)
                      TableRow(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          children: <Widget>[
                            Helper.buildTableCell(key),
                            Helper.buildTableCell(
                                e.exchangeRate['exchange'][key])
                          ])
                  ],
                );
              },
            )
          ])),
        ));
  }
}
