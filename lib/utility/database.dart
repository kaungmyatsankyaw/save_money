import 'package:app/constant/db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  static final cardTableCreateQuery =
      'CREATE TABLE ${DatabaseConstant.cardTable}(${DatabaseConstant.cardTableFields['id']} INTEGER PRIMARY KEY AUTOINCREMENT,${DatabaseConstant.cardTableFields['type']} TEXT,${DatabaseConstant.cardTableFields['expired_date']} TEXT,${DatabaseConstant.cardTableFields['card_number']} TEXT,${DatabaseConstant.cardTableFields['holder_name']} TEXT);';

  static final transTableCreateQuery =
      'CREATE TABLE ${DatabaseConstant.transTable}(${DatabaseConstant.transTableFields['id']} INTEGER PRIMARY KEY AUTOINCREMENT,${DatabaseConstant.transTableFields['category_id']} TEXT,${DatabaseConstant.transTableFields['amount']} INTEGER DEFAULT 0,${DatabaseConstant.transTableFields['date']} INTEGER,${DatabaseConstant.transTableFields['type']} TEXT,${DatabaseConstant.transTableFields['description']} TEXT );';

  static final saveTableCrateQuery =
      'CREATE TABLE ${DatabaseConstant.saveTable}(${DatabaseConstant.saveTableFields['id']} INTEGER PRIMARY KEY AUTOINCREMENT,' +
          '${DatabaseConstant.saveTableFields['category_id']} TEXT,${DatabaseConstant.saveTableFields['start_date']} INTEGER,' +
          '${DatabaseConstant.saveTableFields['end_date']} INTEGER,${DatabaseConstant.saveTableFields['save_amount']} INTEGER DEFAULT 0,' +
          '${DatabaseConstant.saveTableFields['current_amount']} INTEGER DEFAULT 0,${DatabaseConstant.saveTableFields['achieve']} INTEGER DEFAULT 0);';

  static final saveHistoryTableCreateQuery =
      'CREATE TABLE ${DatabaseConstant.saveHistoryTable}(${DatabaseConstant.saveHistoryTableFields['id']} INTEGER PRIMARY KEY AUTOINCREMENT,' +
          '${DatabaseConstant.saveHistoryTableFields['save_id']} INTEGER,' +
          '${DatabaseConstant.saveHistoryTableFields['date']} INTEGER,' +
          '${DatabaseConstant.saveHistoryTableFields['amount']} INTEGER);';

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, DatabaseConstant.dbName),
      onCreate: (database, version) async {
        await database.execute(cardTableCreateQuery);
        await database.execute(transTableCreateQuery);
        await database.execute(saveTableCrateQuery);
        await database.execute(saveHistoryTableCreateQuery);
      },
      version: 1,
    );
  }

  Future getCards() async {
    var query = "select * from ${DatabaseConstant.cardTable}";
    final Database db = await initializeDB();
    return await db.execute(query);
  }
}
