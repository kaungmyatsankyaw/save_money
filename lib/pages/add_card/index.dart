import 'package:app/controllers/card_controller.dart';
import 'package:app/pages/cards/component/add_card.dart';
import 'package:app/pages/cards/component/card.dart';
import 'package:app/pages/cards/component/card_type.dart';
import 'package:app/pages/component/page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCard extends StatelessWidget {
  final CardController _cardController = Get.find();
  
  @override
  Widget build(BuildContext context) {
    _cardController.cardDataReset();
    return Scaffold(
      appBar: NormalAppBar(
        titleText: 'Add Card Form',
        buttonText: '',
        showBtn: false,
      ),
      body: ListView(children: [
        Column(
          children: [
            Obx(()=>CCard(
              cardType: _cardController.cardType.value,
              cardNumber: _cardController.cardNumber.value,
              expiredDate: _cardController.expiryDate.value,
              cardHolderName: _cardController.cardHolderName.value,
              cvvCode: _cardController.cvvCode.value,
            ),),
            CardTypeChoose(),
            AddCardForm()
          ],
        ),
      ]),
    );
  }
}
