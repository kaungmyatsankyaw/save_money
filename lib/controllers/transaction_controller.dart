import 'package:app/constant/db.dart';
import 'package:app/constant/valuse.dart';
import 'package:app/data_model/financial_category_model.dart';
import 'package:app/models/transaction.dart';
import 'package:app/providers/cash_flow_provider.dart';
import 'package:app/utility/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransactionController extends GetxController {
  DatabaseHandler databaseHandler = DatabaseHandler();

  var incomeSelect = ''.obs;
  var outcomeSelect = ''.obs;
  var showDate = ''.obs;
  var showError = 0.obs;
  var intDate = ''.obs;
  var recordList = [].obs;
  var searchString = ''.obs;
  var select = FinancialCategory(
          backgroundColor: Colors.black,
          title: '',
          description: '',
          icon: FontAwesomeIcons.arrowAltCircleLeft,
          iconColor: Colors.black,
          id: '',
          type: FinancialType.Outcome)
      .obs;

  onInit() {
    formatDate();

    super.onInit();
    getAllRecords();
    clearSelect();
  }

  clearSelect() {
    select.value = FinancialCategory(
        backgroundColor: Colors.black,
        title: '',
        description: '',
        icon: FontAwesomeIcons.question,
        iconColor: Colors.white,
        id: '',
        type: FinancialType.Outcome);
  }

  /// Show Transaction Category
  showSelect({list}) {
    Future.delayed(Duration(seconds: 0), () {
      Get.dialog(Builder(
        builder: (BuildContext context) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 400),
            child: AlertDialog(
              title: Text('Please Select Category'),
              content: Container(
                width: 400,
                height: 200,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (_, int index) {
                    FinancialCategory cateory = list[index];
                    return GestureDetector(
                      onTap: () => setSelect(cateory, context),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              // margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: cateory.backgroundColor,
                                  shape: BoxShape.circle),
                              child: Center(
                                child: FaIcon(
                                  cateory.icon,
                                  color: cateory.iconColor,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              cateory.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ));
    });
  }

  /// Select Category */
  setSelect(FinancialCategory category, context) {
    select.value = category;
    showError.value = 0;
    Get.back();
  }

  /// Set Search String
  setSearchString(str) {
    searchString.value = str;
  }

  /// Select Date */
  selectDate(selectedDate) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(selectedDate);

    intDate.value = formatted;
    showDate.value = formatted;
  }

  checkIcon() {
    var id = select.value.id;
    if (id.isEmpty) {
      showError.value = 1;
    } else {
      showError.value = 0;
    }
  }

  /// Add Transaction Record */
  Future addTrans(
      {required type, required int amount, required String description}) async {
    var _type;
    switch (type) {
      case TransactionType.Income:
        _type = 'income';
        break;
      case TransactionType.Outcome:
        _type = 'outcome';
        break;
      default:
    }

    TransactionModel transactionModel = TransactionModel.withoutId(
        select.value.id, amount, intDate.value, _type, description);

    Get.dialog(Center(
      child: CircularProgressIndicator(),
    ));

    var db = await this.databaseHandler.initializeDB();
    await db.insert(DatabaseConstant.transTable, transactionModel.toMap());
    Future.delayed(Duration(seconds: 2), () async {
      select.value = FinancialCategory(
          backgroundColor: Colors.black,
          title: '',
          description: '',
          icon: FontAwesomeIcons.question,
          iconColor: Colors.white,
          id: '',
          type: FinancialType.Outcome);
      formatDate();
      await getAllRecords();
      Get.back();
      Get.back();
    });
  }

  /// Format Date
  formatDate() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(DateTime.now());

    showDate.value = formatted;
    intDate.value = formatted;
  }

  /// Get All Trans Record */
  Future getAllRecords() async {
    var db = await this.databaseHandler.initializeDB();
    var result = await db.query(
      DatabaseConstant.transTable,
      orderBy: 'id desc',
    );

    List<TransactionModel> list =
        result.map((e) => TransactionModel.fromMap(e)).toList();
    recordList.value = list;
  }

  /// Delete Transaction */
  Future deleteTrans(id) async {
    var query = "delete from ${DatabaseConstant.transTable} where id = $id";
    var db = await this.databaseHandler.initializeDB();
    await db.rawQuery(query);
    this.getAllRecords();
    await CashFlowProvider().getTransListByFilter();
    Get.back();
  }
}
