import 'package:app/providers/goal_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddSaveHistroy extends StatefulWidget {
  final int saveId;
  AddSaveHistroy({required this.saveId});

  @override
  _AddSaveHistroyState createState() => _AddSaveHistroyState();
}

class _AddSaveHistroyState extends State<AddSaveHistroy> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController amountController = TextEditingController();
  var selectDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  _selectDate(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2500),
    );

    selectDate = DateFormat('yyyy-MM-dd').format(picked!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(widget.saveId);
    return Container(
      height: MediaQuery.of(context).size.height - 400,
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              child: Text(
                'Save Money',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Amount';
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) =>
                          amountController.text = value,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintText: "Enter Amount To Save",
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.clear),
                          ))),
                  SizedBox(
                    height: 30,
                  ),
                  Text('Choose Date'),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        selectDate.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Icon(FontAwesomeIcons.calendarAlt))
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Row(
                            children: [
                              ElevatedButton.icon(
                                icon: Icon(Icons.clear),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red)),
                                onPressed: () {
                                  Get.back();
                                },
                                label: Text('Cancel'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton.icon(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      await Provider.of<GoalProvider>(context,
                                              listen: false)
                                          .insertSaveHistory(
                                              saveId: widget.saveId,
                                              amount: amountController.text,
                                              date: selectDate);
                                    }
                                  },
                                  icon: FaIcon(FontAwesomeIcons.plusSquare),
                                  label: Text('Add')),
                            ],
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
