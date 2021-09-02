import 'package:app/constant/db.dart';
import 'package:app/utility/database.dart';
import 'package:get/get.dart';

class CashFlowController extends GetxController {
  var cashFlow = [].obs;
  DatabaseHandler databaseHandler = DatabaseHandler();

  @override
  void onInit() {
    super.onInit();
    getCash();
  }

  getCash() async {
    

    var query =
        "select sum(amount) as amount,type from ${DatabaseConstant.transTable} group by ${DatabaseConstant.transTableFields['type']}";
    var db = await this.databaseHandler.initializeDB();
    var result = await db.rawQuery(query);
    cashFlow.value = result;
  }

}