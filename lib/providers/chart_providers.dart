import 'package:app/constant/db.dart';
import 'package:app/data_model/financial_category_model.dart';
import 'package:app/utility/database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartProvider extends ChangeNotifier {
  List<ChartSampleData> dataList = [];
  String type = 'All';
  String cType = 'income';
  DatabaseHandler databaseHandler = DatabaseHandler();
  var startDate;
  var endDate;
  var rangeStart;
  var rangeEnd;
  var sql;

  /// Get Query For PageType with No Filter
  getQuery() {
    sql = " select round(( cast(type.amount as FLOAT ) / cast(total.amount as FLOAT ) ) * 100) as ty,type.category_id as cate from (select sum(amount) as amount,category_id from ${DatabaseConstant.transTable} where type='" +
        getCtye +
        "' group by category_id) as type,( select sum(amount) as amount from ${DatabaseConstant.transTable} where type = '" +
        getCtye +
        "'  ) as total";

    return sql;
  }

  getQueryByRange(rS, rd) {
    var startDate = DateFormat('yyyy-MM-dd').format(rS);

    var endDate = DateFormat('yyyy-MM-dd').format(rd);

    var totalAmountSql =
        "(select sum(amount) as amount from ${DatabaseConstant.transTable} where type = '" +
            getCtye +
            "' and  date between '" +
            startDate +
            "' and '" +
            endDate +
            "') as total";

    var sql =
        " select round(( cast(type.amount as FLOAT ) / cast(total.amount as FLOAT ) ) * 100) as ty,type.category_id as cate from (select sum(amount) as amount,category_id from ${DatabaseConstant.transTable} where type='" +
            getCtye +
            "' and date between '" +
            startDate +
            "' and '" +
            endDate +
            "' group by category_id) as type," +
            totalAmountSql;

    return sql;
  }

  get getCtye {
    return cType;
  }

  get getType => type;
  get getDataList => dataList;

  setCtype(ty) {
    cType = ty;
    getByCategory();
  }

  setDataList(chartData) {
    dataList = chartData;
    notifyListeners();
  }

  setType(t) {
    if (t == 'All') {
      startDate = null;
      endDate = null;
      rangeStart = rangeStart;
      rangeEnd = rangeEnd;
    }
    type = t;
    notifyListeners();
  }

  get getRangeStart => rangeStart;
  get getRangeENd => rangeEnd;

  /// Set DateRange For Filter
  setDate(
      {required start,
      required end,
      required rangeStart,
      required rangeEnd}) async {
    startDate = start;
    endDate = end;
    rangeStart = rangeStart;
    rangeEnd = rangeEnd;
    var sql = getQueryByRange(rangeStart, rangeEnd);
    // Get.defaultDialog(content: Text(sql.toString()));
    var result = await getDataByRange(sql);

    formatList(result, getCtye);
  }

  /// Retrieve Data From DataBase
  getByCategory() async {
    type = 'All';
    startDate = null;
    endDate = null;
    var sql = getQuery();
    var db = await this.databaseHandler.initializeDB();
    var result = await db.rawQuery(sql);

    formatList(result, getCtye);
  }

  /// Retrieve Data From Database with DateRange
  getDataByRange(sql) async {
    var db = await this.databaseHandler.initializeDB();
    var result = await db.rawQuery(sql);
    return result;
  }

  /// Format Raw Result and Send To Provider
  formatList(result, ty) {
    var cList = getCateList(ty);
    List<ChartSampleData> dataList = [];

    result.forEach((e) {
      FinancialCategory cate =
          cList.where((c) => c.id == e['cate']).toList()[0];
      double amount = double.parse(e['ty'].toString());
      dataList.add(ChartSampleData(x: cate.title, y: amount));
    });

    setDataList(dataList);
  }

  /// Get Financial Category List by Page Type
  getCateList(ty) {
    var cList;
    switch (ty) {
      case 'income':
        cList = FinancialCategory.incomeCategoryList;
        break;
      case 'outcome':
        cList = FinancialCategory.outcomeCategoryList;
        break;
      default:
    }
    return cList;
  }
}

class ChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  ChartSampleData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close,
      this.low,
      this.high,
      this.volume});

  /// Holds x value of the datapoint
  final dynamic x;

  /// Holds y value of the datapoint
  final num? y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num? yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num? secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num? thirdSeriesYValue;

  /// Holds point color of the datapoint
  final Color? pointColor;

  /// Holds size of the datapoint
  final num? size;

  /// Holds datalabel/text value mapper of the datapoint
  final String? text;

  /// Holds open value of the datapoint
  final num? open;

  /// Holds close value of the datapoint
  final num? close;

  /// Holds low value of the datapoint
  final num? low;

  /// Holds high value of the datapoint
  final num? high;

  /// Holds open value of the datapoint
  final num? volume;
}
