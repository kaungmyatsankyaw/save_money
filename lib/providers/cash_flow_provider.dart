import 'package:app/constant/db.dart';
import 'package:app/models/transaction.dart';
import 'package:app/pages/home/component/cash_flow/chart.dart';
import 'package:app/utility/database.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CashFlowProvider extends ChangeNotifier {
  var cashFlow = [];
  var transList = [];
  List<ChartData> chartList = [];
  DatabaseHandler databaseHandler = DatabaseHandler();
  String type = 'All';
  String filterType = 'All';

  initFunc() {
    getCash();
    getTransListByFilter();
    getGraphData();
  }

  /// Setter and Getter CashFlow
  get getCashFlow => cashFlow;
  setCashFlow(list) {
    cashFlow = list;
    notifyListeners();
  }

  /// Setter and Getter FilterType
  get getFilterType => filterType;
  setFilterType(ty) {
    filterType = ty;
    notifyListeners();
  }

  /// Setter and Getter For TransList
  get getTransList => transList;
  setTransList(lis) {
    transList = lis;
    notifyListeners();
  }

  /// Setter and Getter Type
  get getType => type;
  setType(t) {
    type = t;
    setFilterType('All');
    getCash();
    getTransListByFilter();
    getGraphData();
    notifyListeners();
  }

  /// Setter and Getter ChartList
  get getChartList => chartList;
  setChartList(list) {
    chartList = list;
    notifyListeners();
  }

  /// Get Query By Filter
  getSumQuery() {
    var type = getType;
    var query;
    switch (type) {
      case 'All':
        query =
            "select sum(amount) as amount,type from ${DatabaseConstant.transTable}  group by ${DatabaseConstant.transTableFields['type']}";
        break;
      case 'Current':
        query =
            "select sum(amount) as amount,type from ${DatabaseConstant.transTable} where (strftime('%m', 'now') = strftime('%m', date)) and (strftime('%Y', 'now') = strftime('%Y', date)) group by ${DatabaseConstant.transTableFields['type']}";
        break;
      case 'Last':
        query =
            "select sum(amount) as amount,type from ${DatabaseConstant.transTable} where ( strftime('%m',date('now', 'start of month','-1 month')) = strftime('%m', date)) and (strftime('%Y', 'now') = strftime('%Y', date)) group by ${DatabaseConstant.transTableFields['type']}";
        break;
      default:
    }
    return query;
  }

  /// Get Cash
  getCash() async {
    var query = getSumQuery();
    var db = await this.databaseHandler.initializeDB();
    var result = await db.rawQuery(query);
    setCashFlow(result);
  }

  /// Get Trans List QUery By Filter
  getTransListQuery() {
    var type = getType;
    var query;
    switch (type) {
      case 'All':
        query = "select * from ${DatabaseConstant.transTable} order by id desc";
        break;
      case 'Current':
        query =
            "select * from ${DatabaseConstant.transTable}  where (strftime('%m', 'now') = strftime('%m', date)) and (strftime('%Y', 'now') = strftime('%Y', date)) order by id desc";
        break;
      case 'Last':
        query =
            "select * from ${DatabaseConstant.transTable} where ( strftime('%m',date('now', 'start of month','-1 month')) = strftime('%m', date)) and (strftime('%Y', 'now') = strftime('%Y', date)) order by id desc";
        break;
      default:
    }

    return query;
  }

  /// Get Trasn List By Filter
  getTransListByFilter() async {
    var query = getTransListQuery();

    var db = await this.databaseHandler.initializeDB();
    var result = await db.rawQuery(query);

    List<TransactionModel> list =
        result.map((e) => TransactionModel.fromMap(e)).toList();

    setTransList(list);
  }

  getGraphDataQuery() {
    var type = getType;
    var query;
    switch (type) {
      case 'All':
        query =
            "select *  from ${DatabaseConstant.transTable} group by type,date";
        break;
      case 'Current':
        query =
            " select sub.amount as amount,sub.date as date,sub.type as type from (select sum(amount) as amount,type,date from ${DatabaseConstant.transTable}  where (strftime('%m', 'now') = strftime('%m', date)) and (strftime('%Y', 'now') = strftime('%Y', date))   group by date,type) as sub";
        break;
      case 'Last':
        query =
            "select sub.amount as amount,sub.date as date,sub.type as type from (select sum(amount) as amount,type,date from ${DatabaseConstant.transTable} where ( strftime('%m',date('now', 'start of month','-1 month')) = strftime('%m', date)) and (strftime('%Y', 'now') = strftime('%Y', date)) group by date,type) as sub";
        break;
      default:
    }
    return query;
  }

  getGraphData() async {
    var query = getGraphDataQuery();
    var db = await this.databaseHandler.initializeDB();
    List<Map> result = await db.rawQuery(query);

    var y;
    var yValue;

    List<ChartData> cList = [];

    result.groupListsBy((e) => e['date']).forEach((key, v) {
      v.asMap().forEach((key, value) {
        if (value['type'] == 'income')
          yValue = value['amount'];
        else
          yValue = 0;
        if (value['type'] == 'outcome')
          y = value['amount'];
        else
          y = 0;
        DateTime tempDate =
            new DateFormat("yyyy-MM-dd").parse(value['date'].toString());

        ChartData chartData = ChartData(x: tempDate, y: y, yValue: yValue);

        cList.add(chartData);
      });
    });
    setChartList(cList);
  }
}
