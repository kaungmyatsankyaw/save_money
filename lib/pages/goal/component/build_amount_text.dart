import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuildAmountText extends StatelessWidget {
  final int? amount;
  final FontWeight fontWeight;

  BuildAmountText({required this.amount, this.fontWeight = FontWeight.w600});

  @override
  Widget build(BuildContext context) {
    return Text(
      NumberFormat("#,##0", "en_US").format(amount),
      style: TextStyle(fontWeight: fontWeight),
    );
  }
}
