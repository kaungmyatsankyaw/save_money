import 'package:app/controllers/card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';

class CardTypeChoose extends StatelessWidget {
  final CardController _cardController = Get.find();

  final List _cardMap = [
    {'name': 'Visa', 'cardType': CardType.visa},
    {'name': 'Discover', 'cardType': CardType.discover},
    {'name': 'Master', 'cardType': CardType.mastercard},
    {'name': 'American Express', 'cardType': CardType.americanExpress},
  ];

  void showChooseForm(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Choose Card Type'),
              content: Obx(() => DropdownButton<dynamic>(
                      value: _cardController.cardType.value,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      onChanged: (value) {
                        _cardController.cardType.value = value;
                      },
                      items: [
                        for (var i = 0; i < _cardMap.length; i++)
                          DropdownMenuItem(
                            child: Text(_cardMap[i]['name']),
                            value: _cardMap[i]['cardType'],
                          )
                      ])));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Choose Card'),
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey, shadowColor: Colors.blueGrey),
              onPressed: () {
                showChooseForm(context);
              },
              icon: Icon(Icons.chair),
              label: Text('Choose'))
        ],
      ),
    );
  }
}
