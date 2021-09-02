import 'package:app/controllers/card_controller.dart';
import 'package:app/pages/cards/component/card.dart';
import 'package:app/utility/get_card_type.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CardList extends StatelessWidget {
  final CardController _cardController = Get.find();

  showDeleteConfirm(BuildContext context, {var cardId}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Alert'),
            content: Text(
              'Are u sure want to remove card?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            actions: [
              TextButton(
                onPressed: () => _cardController.deleteCard(cardId),
                child: Text(
                  'Ok',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
              ),
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Cancel', style: TextStyle(color: Colors.white)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    int cardCount = _cardController.cardList.length;

    return ListView.builder(
      itemCount: cardCount,
      itemBuilder: (BuildContext context, int index) {
        var card = _cardController.cardList[index];
        var type;
        var cardType = card['type'];
        type = GetCardType.getCardType(cardType);

        return Stack(
          alignment: AlignmentDirectional.bottomEnd,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CCard(
              cardType: type,
              cardNumber: card['card_number'],
              expiredDate: card['expired_date'],
              cardHolderName: card['holder_name'],
              cvvCode: '',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: ElevatedButton.icon(
                onPressed: () {
                  showDeleteConfirm(context, cardId: card['id']);
                },
                icon: FaIcon(FontAwesomeIcons.trash),
                label: Text('Delete'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
              ),
            )
          ],
        );
      },
    );
  }
}
