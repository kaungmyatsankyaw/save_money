import 'package:app/constant/db.dart';
import 'package:app/controllers/card_controller.dart';
import 'package:app/pages/setting/component/section.dart';
import 'package:app/pages/setting/component/utility.dart';
import 'package:app/providers/auth_provider.dart';
import 'package:app/utility/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AppSetting extends StatefulWidget {
  @override
  _AppSettingState createState() => _AppSettingState();
}

class _AppSettingState extends State<AppSetting> {
  final List selectList = [];
  DatabaseHandler databaseHandler = DatabaseHandler();
  CardController cardController = Get.find();

  clearAll() async {
    if (selectList.length == 0) {
      showUnSelectDialog();
      return;
    }

    var db = await this.databaseHandler.initializeDB();
    var sql = "delete from ";

    if (selectList.contains('all') == true) {
      selectList.remove('all');
    }

    selectList.map((e) async {
      await db.rawQuery(sql + e);
      await cardController.getAllCard();
    });

    selectList.clear();
    Get.back();
  }

  Future<void> showUnSelectDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Container(
            padding: EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(width: 0.4, color: Colors.black),
            )),
            child: Text(
              'Alert !!',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
          ),
          content: Text(
            'Please Choose Dataset To Clear ',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          actions: <Widget>[
            buildDialogButton(Colors.red, Colors.white, 'Cancel', callback: () {
              Get.back();
              Get.back();
            }),
            buildDialogButton(Colors.blueGrey, Colors.white, 'Ok',
                callback: () {
              Get.back();
            }),
          ],
        );
      },
    );
  }

  final allSelect = [
    'all',
    DatabaseConstant.cardTable,
    DatabaseConstant.transTable,
    DatabaseConstant.saveTable,
    DatabaseConstant.saveHistoryTable
  ];

  final List tableList = [
    {'name': 'All', 'val': false, 'table': 'all', 'field_name': 'all'},
    {
      'name': DatabaseConstant.cardTable,
      'val': false,
      'table': DatabaseConstant.cardTable,
      'field_name': 'card'
    },
    {
      'name': DatabaseConstant.transTable,
      'val': false,
      'table': DatabaseConstant.transTable,
      'field_name': 'trans'
    },
    {
      'name': DatabaseConstant.saveTable,
      'val': false,
      'table': DatabaseConstant.saveTable,
      'field_name': 'save'
    },
    {
      'name': 'Save History',
      'val': false,
      'table': DatabaseConstant.saveHistoryTable,
      'field_name': 'save_history'
    },
  ];

  String capitalize(String txt) {
    return "${txt[0].toUpperCase()}${txt.substring(1)}";
  }

  clearAllData() {
    Get.defaultDialog(
        title: 'Choose Data',
        content: StatefulBuilder(builder: (_, setState) {
          return Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: tableList
                    .map<Widget>(
                      (e) => Container(
                        height: 30,
                        child: Row(
                          children: [
                            Checkbox(
                                value: selectList.contains(e['table'])
                                    ? true
                                    : false,
                                onChanged: (bol) {
                                  switch (e['table']) {
                                    case 'all':
                                      if (selectList.contains('all') == true) {
                                        selectList.clear();
                                      } else {
                                        selectList.clear();
                                        selectList.addAll(allSelect);
                                      }

                                      break;
                                    default:
                                      selectList.contains(e['table']) == true
                                          ? selectList.remove(e['table'])
                                          : selectList.add(e['table']);
                                      if (selectList.contains('all') == true)
                                        selectList.remove('all');
                                  }
                                  setState(() {});
                                }),
                            Text(capitalize(e['name']))
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  children: [
                    buildDialogButton(Colors.red, Colors.white, 'Cancel',
                        callback: () {
                      selectList.clear();
                      setState(() {});
                      Get.back();
                    }),
                    SizedBox(
                      width: 10,
                    ),
                    buildDialogButton(Colors.blueGrey, Colors.white, 'Clear',
                        callback: () {
                      clearAll();
                    })
                  ],
                ),
              )
            ],
          ));
        }));
  }

  buildDialogButton(Color primary, Color onSurface, String text,
      {required VoidCallback callback}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: primary,
          onSurface: onSurface,
        ),
        onPressed: callback,
        child: Text(text));
  }

  @override
  Widget build(BuildContext context) {
    return Section(title: 'App Setting', wlist: [
      Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(10),
        child: Consumer<AuthProvider>(builder: (_, prov, wz) {
          LoginUser user = prov.getUser;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SettingUtility.buildSubTitle(title: 'Login Type'),
              SettingUtility.buildSubTitle(
                  title: user.authProvider.toUpperCase(),
                  fontWeight: FontWeight.bold)
            ],
          );
        }),
      ),
      Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SettingUtility.buildSubTitle(title: 'Clear Data'),
            SettingUtility.buildButton(text: 'Clear', fun: clearAllData)
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SettingUtility.buildSubTitle(title: 'Recieve Notification'),
            Switch(
              value: false,
              onChanged: (bool bol) {},
              activeColor: Colors.blueGrey,
              inactiveThumbColor: Colors.red,
            )
          ],
        ),
      )
    ]);
  }
}
