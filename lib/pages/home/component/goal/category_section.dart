import 'package:app/pages/home/component/goal/category_list.dart';
import 'package:app/pages/home/component/goal/category_row.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.6, color: Colors.grey))),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 180,
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: CategoryRow()),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: CategoryList()),
          ],
        ));
  }
}
