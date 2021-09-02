import 'package:app/constant/valuse.dart';
import 'package:app/controllers/transaction_controller.dart';
import 'package:app/utility/widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class  AddForm extends StatefulWidget {
  final TransactionType type;

  AddForm({required this.type});

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  var addTye;
  final TransactionController _controller = Get.put(TransactionController());
  final _formKey = GlobalKey<FormState>();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  _selectDate(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2500),
    );

    _controller.selectDate(picked);
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case TransactionType.Income:
        addTye = 'income';
        break;
      case TransactionType.Outcome:
        addTye = 'outcome';
        break;
      default:
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            WidgetBuilderHelper.buildColumn(
                widget1:
                    WidgetBuilderHelper.buildText('Amount', FontWeight.bold),
                widget2: WidgetBuilderHelper.buildTextFromField(
                    editingController: amountController,
                    textInputType: TextInputType.number,
                    errorText: 'Amount',
                    isValidate: true,
                    context: context)),
            WidgetBuilderHelper.buildColumn(
                widget1: WidgetBuilderHelper.buildText(
                    'Description', FontWeight.bold),
                widget2: WidgetBuilderHelper.buildTextFromField(
                    context: context,
                    editingController: descriptionController,
                    errorText: '')),
            WidgetBuilderHelper.buildColumn(
              widget1: WidgetBuilderHelper.buildText('Date', FontWeight.bold),
              widget2: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Obx(
                      () => Text(
                        _controller.showDate.value,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: () => _selectDate(context),
                      child: FaIcon(FontAwesomeIcons.calendarAlt))
                ],
              ),
            ),
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
                        _controller.clearSelect();
                       Get.back();
                      },
                      label: Text('Cancel'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton.icon(
                        onPressed: () async {
                          _controller.checkIcon();

                          if (_formKey.currentState!.validate() &&
                              _controller.select.value.id.isNotEmpty) {
                            await _controller.addTrans(
                                type: widget.type,
                                amount: int.parse(amountController.text),
                                description: descriptionController.text);
                          }
                        },
                        icon: FaIcon(FontAwesomeIcons.plusSquare),
                        label: Text('Add')),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
