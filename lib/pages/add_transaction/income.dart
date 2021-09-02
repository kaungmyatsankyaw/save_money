import 'package:app/constant/valuse.dart';
import 'package:app/controllers/transaction_controller.dart';
import 'package:app/data_model/financial_category_model.dart';
import 'package:app/pages/add_transaction/add_form.dart';
import 'package:app/pages/component/page_app_bar.dart';
import 'package:app/utility/widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Income extends StatefulWidget {
  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  final TransactionController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NormalAppBar(
          titleText: StringValues.incomeAddTitle,
          buttonText: '',
          showBtn: false,
        ),
        body: WidgetBuilderHelper.buildLayout(
            context: context,
            widget1: Obx(
              () => WidgetBuilderHelper.buildRow(
                  categoryList: FinancialCategory.incomeCategoryList,
                  controller: controller,
                  backgroundColor: controller.select.value.backgroundColor,
                  iconColor: controller.select.value.iconColor,
                  icon: controller.select.value.icon,
                  title: controller.select.value.title),
            ),
            widget2: Obx(
              () => Opacity(
                opacity: controller.showError.toDouble(),
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Choose Category',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    )),
              ),
            ),
            widget3: AddForm(
              type: TransactionType.Income,
            )));
  }
}
