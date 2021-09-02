import 'package:app/controllers/transaction_controller.dart';
import 'package:app/data_model/financial_category_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class WidgetBuilderHelper {
  static GestureDetector buildCard(
      {required var width,
      required var height,
      required var gColor1,
      required var gColor2,
      required IconData iconData,
      required String text,
      required var amount,
      required String route}) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(route);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(
                  0.35, 0.15), // 10% of the width, so there are ten blinds.
              colors: <Color>[gColor1, gColor2], // red to yellow
              tileMode:
                  TileMode.repeated, // repeats the gradient over the canvas
            ),
            // border: Border.all(color: Colors.lightBlue),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        width: width * 0.465,
        height: height * 0.15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FaIcon(
              iconData,
              color: Colors.white60,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              text,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(amount.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22))
          ],
        ),
      ),
    );
  }

  static Row buildRow(
      {required List<FinancialCategory> categoryList,
      required TransactionController controller,
      required IconData icon,
      required String title,
      required Color backgroundColor,
      required Color iconColor}) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          Container(
            width: 60,
            height: 60,
            // margin: EdgeInsets.all(10),
            decoration:
                BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
            child: Center(
              child: FaIcon(
                icon,
                color: iconColor,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
      buildChooseCatgoryButton(func: () {
        controller.showSelect(list: categoryList);
      })
    ]);
  }

  static buildChooseCatgoryButton({required Function func}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          onSurface: Colors.black,
          onPrimary: Colors.black,
          primary: Colors.white,
        ),
        onPressed: () {
          func();
        },
        child: Text(
          'Category',
        ));
  }

  static Container buildLayout(
      {required BuildContext context,
      required Widget widget1,
      required Widget widget2,
      required Widget widget3}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [widget1, widget2, widget3],
        ),
      ),
    );
  }

  static Container buildColumn({required widget1, required widget2}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [widget1, widget2],
      ),
    );
  }

  static Text buildText(
    String text,
    FontWeight fontWeight,
    {Color color=Colors.black}
  ) {
    return Text(
      text,
      style: TextStyle(fontWeight: fontWeight,color: color),
    );
  }

  static TextFormField buildTextFromField(
      {required TextEditingController editingController,
      String errorText = '',
      bool isValidate = false,
      TextInputType textInputType = TextInputType.name,
      
      required BuildContext context}) {
    return isValidate == true
        ? TextFormField(
            onFieldSubmitted: (value) => editingController.text = value,
            keyboardType: textInputType,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      editingController.clear();
                    },
                    icon: Icon(Icons.clear))),
            controller: editingController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter $errorText";
              }
              return null;
            },
          )
        : TextFormField(
            onFieldSubmitted: (value) => editingController.text = value,
            keyboardType: textInputType,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      editingController.clear();
                    },
                    icon: Icon(Icons.clear))),
            controller: editingController,
          );
  }

  /// Build Tab */
  static buildTab(String text, IconData iconData) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            iconData,
            size: 16,
          ),
          SizedBox(
            width: 10,
          ),
          Text(text)
        ],
      ),
    );
  }

  /// Build CategoryIcon */
  static buildCategoryIcon(
      {required FinancialCategory cate, width = 50, height = 50}) {
    return Container(
      width: width.toDouble(),
      height: height.toDouble(),
      decoration:
          BoxDecoration(color: cate.backgroundColor, shape: BoxShape.circle),
      child: Center(
        child: FaIcon(
          cate.icon,
          color: cate.iconColor,
          size: 16,
        ),
      ),
    );
  }

  
}
