import 'package:app/constant/db.dart';
import 'package:app/models/transaction.dart';
import 'package:app/utility/database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class ReportProvider extends ChangeNotifier {
  var type = 'day';
  late DateTime dateTime;
  var showDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  DatabaseHandler databaseHandler = DatabaseHandler();
  List<TransactionModel> recList = [];

  /// Getter & Setter Type
  get getType => type;
  setType(String ty) {
    type = ty;
    var format = formatDate(ty);
    setShowDate(format);
    notifyListeners();
  }

  formatDate(type, {inputDate}) {
    var format;
    switch (type) {
      case 'day':
        format = DateFormat('yyyy-MM-dd').format(inputDate ?? DateTime.now());
        break;
      case 'month':
        format = DateFormat('yyyy-MM').format(inputDate ?? DateTime.now());
        break;
      case 'year':
        format = DateFormat('yyyy').format(inputDate ?? DateTime.now());
        break;
      default:
    }

    return format.toString();
  }

  /// Getter & Setter ShowDate
  get getShowDate => showDate;
  setShowDate(forMat) {
    showDate = forMat.toString();
    notifyListeners();
  }

  /// Getter & Setter Record List
  get getrecList => recList;
  setRecList(list) {
    recList = list;
    notifyListeners();
  }

  /// Select Date
  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2500),
    );
    return picked;
  }

  selectMonth(BuildContext context) {
    return showMonthPicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 1, 5),
      lastDate: DateTime(DateTime.now().year + 1, 9),
      initialDate: DateTime.now(),
      locale: Locale("en"),
    );
  }

  /// Select Year
  selectYear(BuildContext context) async {
    
    var res = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 100, 1),
              lastDate: DateTime(DateTime.now().year + 100, 1),
              initialDate: DateTime.now(),
              selectedDate: DateTime.now(),
              onChanged: (DateTime dateTime) {
                Navigator.of(context).pop(dateTime);
              },
            ),
          ),
        );
      },
    );
    return res;
  }

  /// Get Record List By Type
  getRecordListByTypeQuery({ty}) {
    var type = ty ?? getType;
    var query = "";
    switch (type) {
      case 'day':
        query = "select * from ${DatabaseConstant.transTable} where date = ?";
        break;
      case 'month':
        query =
            "select * from ${DatabaseConstant.transTable}  where (strftime('%Y-%m', date) = ?)  order by id desc";
        break;
      case 'year':
        query =
            "select * from ${DatabaseConstant.transTable}  where (strftime('%Y', 'now') = ?)  order by id desc";
        break;
      default:
    }
    return query;
  }

  getRecordListByType({ty}) async {
    var db = await this.databaseHandler.initializeDB();
    var type = ty ?? getType;
    var sql = getRecordListByTypeQuery(ty: type);

    var result = await db.rawQuery(sql, [getShowDate]);

    List<TransactionModel> list =
        result.map((e) => TransactionModel.fromMap(e)).toList();

    setRecList(list);
  }
}
