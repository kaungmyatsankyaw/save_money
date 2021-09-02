import 'package:app/constant/valuse.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CategoryRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Categories',
            style:
                TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(StringValues.goalCategoriesRoute);
            },
            child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 3, color: Colors.white60))),
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.eye,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'See All',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )),
          )
          // ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       onSurface: Colors.black,
          //       onPrimary: Colors.black,
          //       primary: Colors.white,
          //     ),
          //     onPressed: () {
          //       Get.toNamed(StringValues.goalCategoriesRoute);
          //     },
          //     child: Text('See All'))
        ],
      ),
    );
  }
}
