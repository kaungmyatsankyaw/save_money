import 'package:app/utility/helper.dart';
import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  final double top;
  final double bottom;

  NoData({this.top = 120, this.bottom = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: top,bottom: bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset('images/no_record.png')),
            Helper.formatText('No Data', 16)
          ],
        ));
  }
}
