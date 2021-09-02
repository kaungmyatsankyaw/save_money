import 'package:app/constant/db.dart';
import 'package:app/data_model/goal_category_model.dart';
import 'package:app/models/goal_history.dart';
import 'package:app/models/goals.dart';
import 'package:app/utility/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GoalProvider extends ChangeNotifier {
  var filter = 'All';
  var filterList = ['All', 'Achieved'];
  var startDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  var endDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  var startOriginalDate = DateTime.now();
  var showError = 0;
  List<GoalModel> goalList = [];
  List<GoalModel> goalByCategoryList = [];
  List<GoalHistoryModel> goalHistoryList = [];
  GoalModel goalDetail =
      GoalModel.withId(1, 'category_id', 0, 0, '2021-01-01', '2021-01-01', 1);
  GoalCategoryModel categoryModel = GoalCategoryModel(
      bgColor: Colors.grey.shade300,
      cateId: '',
      imageName: 'question-mark',
      title: '');
  DatabaseHandler databaseHandler = DatabaseHandler();

  /// Get CategoryModel
  get getCategoryModel => categoryModel;
  setCatgoryModel(model) {
    categoryModel = model;
    notifyListeners();
  }

  resetModel() {
    categoryModel = GoalCategoryModel(
        bgColor: Colors.grey.shade300,
        cateId: '',
        imageName: 'question-mark',
        title: '');
    notifyListeners();
  }

  /// Getter StartDate
  get getStartDate => startDate;
  get getStartOriginalDate => startOriginalDate;

  /// Getter  EndDate
  get getEndDate => endDate;

  setDate({date, required ty}) {
    var format = DateFormat('yyyy-MM-dd').format(date ?? DateTime.now());
    switch (ty) {
      case 'start':
        startDate = format;
        break;
      case 'end':
        endDate = format;
        break;
      default:
    }

    notifyListeners();
  }

  /// Setter & Getter Filter
  get getFilter => filter;
  setFilter(String f) {
    filter = f;
    notifyListeners();
  }

  /// Get All Goals
  getAllGoals() async {
    var db = await this.databaseHandler.initializeDB();
    var result = await db.rawQuery("select * from saves order by id desc");

    List<GoalModel> list = result.map((e) => GoalModel.fromMap(e)).toList();

    setGoalList(list);
  }

  setGoalList(list) {
    goalList = list;
    notifyListeners();
  }

  get getGoalList => goalList;

  /// Add Goal
  addGoal(BuildContext context, {required saveAmount}) async {
    Get.dialog(Center(
      child: CircularProgressIndicator(),
    ));

    var categoryId = getCategoryModel.cateId;
    GoalModel model = GoalModel.withOutId(
        categoryId, 0, int.parse(saveAmount), getStartDate, getEndDate, 0);
    var db = await this.databaseHandler.initializeDB();
    await db.insert(DatabaseConstant.saveTable, model.toMap());
    await getAllGoals();
    Future.delayed(Duration(seconds: 1), () async {
      categoryModel = GoalCategoryModel(
          bgColor: Colors.grey.shade300,
          cateId: '',
          imageName: 'question-mark',
          title: '');
      setDate(ty: 'start');
      setDate(ty: 'end');
      Get.back();
      Get.back();
    });
  }

  /// Get Goal By Category
  getGoalByCategory({required String cateId}) async {
    var db = await this.databaseHandler.initializeDB();
    var sql = "select * from saves where category_id = ?";
    var result = await db.rawQuery(sql, [cateId]);
    List<GoalModel> list = result.map((e) => GoalModel.fromMap(e)).toList();
    setGoalByCatgoryList(list);
  }

  /// Set Goal By CategoryList
  setGoalByCatgoryList(list) {
    goalByCategoryList = list;
    notifyListeners();
  }

  /// Get GoalByCategoryList
  get getGoalByCateogryList => goalByCategoryList;

  /// Get Detail Goal
  getGoalDetail(goalId) async {
    var db = await this.databaseHandler.initializeDB();
    var sql = "select * from saves where id=?";
    var result = await db.rawQuery(sql, [goalId]);

    GoalModel res = GoalModel.fromMap(result[0]);
    goalDetail = res;

    notifyListeners();
  }

  /// Get GoalDetail From Prov
  get getGoalDetailProv => goalDetail;

  /// Getter & Setter GoalHistroyList
  get getGoalHistroyList => goalHistoryList;
  setGoalHistoryList(l) {
    goalHistoryList = l;
    notifyListeners();
  }

  /// Get All History List
  getAllHistory({required saveId}) async {
    var db = await this.databaseHandler.initializeDB();
    var sql = "select * from save_history where save_id =? order by date desc";
    var res = await db.rawQuery(sql, [saveId]);
    List<GoalHistoryModel> l =
        res.map((e) => GoalHistoryModel.fromMap(e)).toList();
    setGoalHistoryList(l);
  }

  /// Insert Save History
  insertSaveHistory({required saveId, required amount, required date}) async {
    Get.dialog(Center(
      child: CircularProgressIndicator(),
    ));
    GoalHistoryModel model =
        GoalHistoryModel.withOutId(saveId.toInt(), int.parse(amount), date);
    var db = await this.databaseHandler.initializeDB();
    var updateSql =
        "update saves set current_amount = current_amount + ?,achieve = case when current_amount + ? = save_amount then 1 else 0 end where id = ?";
    await db.insert('save_history', model.toMap());
    await db.rawQuery(updateSql, [amount, amount, saveId]);
    await getAllHistory(saveId: saveId);
    await getGoalDetail(saveId);
    await getAllGoals();
    Future.delayed(Duration(seconds: 2), () {
      Get.back();
      Get.back();
    });
  }

  /// Delete Goal
  deleteGoal({required id}) async {
    Get.dialog(Center(
      child: CircularProgressIndicator(),
    ));
    var db = await this.databaseHandler.initializeDB();
    var sql = "delete from saves where id = ?";
    var historyDeleteSql = "delete from save_history where save_id=?";
    await db.rawQuery(sql, [id]);
    await db.rawQuery(historyDeleteSql, [id]);
    await getAllGoals();
    Future.delayed(Duration(seconds: 2), () {
      Get.back();
      Get.back();
    });
  }
}
