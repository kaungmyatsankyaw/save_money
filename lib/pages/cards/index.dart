import 'package:app/constant/valuse.dart';
import 'package:app/controllers/card_controller.dart';
import 'package:app/pages/cards/component/card_list.dart';
import 'package:app/pages/cards/component/no_card.dart';
import 'package:app/pages/component/page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CardsPage extends StatelessWidget {
  final CardController cardController = Get.put(CardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAppBar(
        titleText: StringValues.generalCard,
        buttonText: 'Add Card',
        routeName: StringValues.addCardRoute,
      ),
      body: Obx(
          () => cardController.cardList.length == 0 ? NoCard() : CardList()),
    );
  }
}
