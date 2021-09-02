import 'package:app/controllers/transaction_controller.dart';
import 'package:app/data_model/financial_category_model.dart';
import 'package:app/models/transaction.dart';
import 'package:app/utility/helper.dart';
import 'package:app/utility/widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TransComponent extends StatelessWidget {
  final TransactionModel model;
  final FinancialCategory cate;
  final int i;
  final bool isDelete;

  final TransactionController controller = Get.find();

  TransComponent(
      {required this.i,
      required this.model,
      required this.cate,
      this.isDelete = true});

  deleteTrans(context, {required id}) async {
    final res = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Delete'),
            content: Text(
              "Are you sure you want to delete ?",
            ),
            actions: <Widget>[
              OutlinedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Cancel'),
              ),
              ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () async {
                    await controller.deleteTrans(id);
                  },
                  icon: FaIcon(FontAwesomeIcons.trash),
                  label: Text('Delete'))
            ],
          );
        });
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.date.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 6,
          ),
          isDelete == true
              ? Dismissible(
                  direction: DismissDirection.endToStart,
                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.endToStart) {
                      return await deleteTrans(context, id: model.id);
                    } else {}
                  },
                  background: Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: AlignmentDirectional.centerEnd,
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  key: Key(i.toString()),
                  child: buildCard(),
                )
              : buildCard()
        ],
      ),
    );
  }

  Card buildCard() {
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(14),
        leading: WidgetBuilderHelper.buildCategoryIcon(cate: cate),
        title: Text(
          cate.title,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        trailing: Text(
          Helper.getSign(type: model.type.toString()) +
              ' ' +
              model.amount.toString(),
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Helper.getColor(type: model.type.toString())),
        ),
        subtitle: buildText(),
      ),
    );
  }

  Text buildText() {
    return Text(
      model.description?.isEmpty == false
          ? model.description.toString()
          : 'No Remark',
      style: TextStyle(color: Colors.grey, fontSize: 10),
    );
  }
}
