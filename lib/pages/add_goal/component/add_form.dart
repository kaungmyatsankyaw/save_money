import 'package:app/providers/goal_provider.dart';
import 'package:app/utility/widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'date_choose.dart';

class GoalAddForm extends StatefulWidget {
  @override
  _GoalAddFormState createState() => _GoalAddFormState();
}

class _GoalAddFormState extends State<GoalAddForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            height: 40,
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 0.3, color: Colors.grey))),
          ),
          WidgetBuilderHelper.buildColumn(
              widget1: WidgetBuilderHelper.buildText('Amount', FontWeight.bold),
              widget2: WidgetBuilderHelper.buildTextFromField(
                  editingController: amountController,
                  textInputType: TextInputType.number,
                  errorText: 'Amount',
                  isValidate: true,
                  context: context)),
          SizedBox(
            height: 20,
          ),
          Consumer<GoalProvider>(
              builder: (_, prov, wz) => DateChoose(
                  dateText: 'Start Date',
                  type: 'start',
                  date: prov.startDate.toString())),
          SizedBox(
            height: 20,
            child: Divider(
              height: 2,
              color: Colors.grey,
            ),
          ),
          Consumer<GoalProvider>(
              builder: (_, prov, wz) => DateChoose(
                  dateText: 'End Date',
                  type: 'end',
                  date: prov.endDate.toString())),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  ElevatedButton.icon(
                    icon: Icon(Icons.clear),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: () {
                      Provider.of<GoalProvider>(context, listen: false)
                          .resetModel();
                      Get.back();
                    },
                    label: Text('Cancel'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton.icon(
                      onPressed: () async {
                        if (_formKey.currentState!.validate() )
                          await Provider.of<GoalProvider>(context,
                                  listen: false)
                              .addGoal(context,
                                  saveAmount: amountController.text);
                      },
                      icon: FaIcon(FontAwesomeIcons.plusSquare),
                      label: Text('Add')),
                ],
              )),
        ],
      ),
    );
  }
}
