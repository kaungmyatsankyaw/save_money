import 'package:app/data_model/financial_category_model.dart';
import 'package:app/providers/chart_providers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Helper {
  /// Date Difference
  static calculateDateDiff({required startDate, required endDate}) {
    DateTime startFormat = new DateFormat("yyyy-MM-dd").parse(endDate);
    DateTime endFormat = DateTime.now();
    return startFormat.difference(endFormat).inDays;
  }

  /// Get Icon */
  static getIcon({required String categoryId, required String type}) {
    var cateList;
    switch (type) {
      case 'income':
        cateList = FinancialCategory.incomeCategoryList;
        break;
      case 'outcome':
        cateList = FinancialCategory.outcomeCategoryList;
        break;
      default:
    }
    FinancialCategory cate =
        cateList.where((c) => c.id == categoryId).toList()[0];

    return cate;
  }

  /// Get Color */
  static getColor({required String type}) {
    switch (type) {
      case 'income':
        return Colors.green;
      case 'outcome':
        return Colors.red;
    }
  }

  /// Format TextFieldData
  static Text formatText(String text, double fontSize) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
    );
  }

  /// Get Sign */
  static getSign({required String type}) {
    switch (type) {
      case 'income':
        return '+';
      case 'outcome':
        return '-';
    }
  }

  /// Get CustomDate */
  static getCustomDate(date) {
    final template = DateFormat('dd-MM-yyyy');

    return template.format(DateTime.fromMillisecondsSinceEpoch(date!.toInt()));
  }

  /// DateRange Picker */
  static showDatePicker(context, {required ChartProvider prov}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              height: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Flexible(
                      child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    child: SfDateRangePicker(
                      onSubmit: (args) {
                        Get.back();
                        DateTime rangeStartDate;
                        DateTime rangeEndDate;
                        if (args is PickerDateRange) {
                          rangeStartDate = args.startDate!;
                          rangeEndDate = args.endDate!;

                          var start =
                              DateFormat('dd/MM/yyyy').format(rangeStartDate);
                          var end =
                              DateFormat('dd/MM/yyyy').format(rangeEndDate);

                          Provider.of<ChartProvider>(context, listen: false)
                              .setDate(
                                  start: start,
                                  end: end,
                                  rangeStart: rangeStartDate,
                                  rangeEnd: rangeEndDate);
                          // prov.setDate(start: start, end: end);
                        }
                      },
                      onCancel: datePickeronCancel,
                      showActionButtons: true,
                      onSelectionChanged: datePickeronSelectionChanged,
                      selectionMode: DateRangePickerSelectionMode.range,
                      initialSelectedRange:
                          PickerDateRange(DateTime.now(), DateTime.now()),
                    ),
                  )),
                ],
              ),
            ),
          );
        });
  }

  static datePickeronSelectionChanged(
      DateRangePickerSelectionChangedArgs args) {}

  static datePickeronCancel() {
    Get.back();
  }

  /// Cash Flow Filter Button
  static Container buildFilterButton(
      String text, Color color, String ty, String provTy) {
    return Container(
      width: 95,
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border(
            bottom: ty == provTy
                ? BorderSide(color: Colors.black)
                : BorderSide(color: Colors.white)),
        color: color,
        // borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static buildTableHeader(String text) {
    return Container(
      height: 40,
      child: Center(
          child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
    );
  }

  static buildTableCell(String text,
      {height = 30,
      width = 128,
      Color tbColor = Colors.white,
      color = Colors.black,
      sign = '',
      FontWeight fontWeight = FontWeight.bold}) {
    return Container(
      // color: tbColor,
      height: height.toDouble(),
      width: width.toDouble(),
      child: Center(
          child: Text(
        sign + text,
        style: TextStyle(fontWeight: fontWeight, color: color),
      )),
    );
  }
}
