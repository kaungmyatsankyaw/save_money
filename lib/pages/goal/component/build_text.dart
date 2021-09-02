import 'package:app/pages/goal/component/build_amount_text.dart';
import 'package:flutter/material.dart';

class BuildText extends StatelessWidget {
  final String txt1;
  final txt2;
  final bool isAmount;
  BuildText({required this.txt1, required this.txt2, this.isAmount = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 10),
      padding: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 0.23, color: Colors.grey, style: BorderStyle.solid))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            txt1,
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          isAmount == true
              ? BuildAmountText(amount: txt2)
              : Text(
                  txt2,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
        ],
      ),
    );
  }
}
