import 'package:app/controllers/card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AddCardForm extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final CardController _cardController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Obx(
      () => Column(
        children: [
          CreditCardForm(
            formKey: formKey,
            obscureCvv: true,
            obscureNumber: true,
            cardNumber: _cardController.cardNumber.value,
            cvvCode: _cardController.cvvCode.value,
            cardHolderName: _cardController.cardHolderName.value,
            expiryDate: _cardController.expiryDate.value,
            themeColor: Colors.blue,
            cardNumberDecoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Number',
              hintText: 'XXXX XXXX XXXX XXXX',
            ),
            expiryDateDecoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Expired Date',
              hintText: 'XX/XX',
            ),
            cvvCodeDecoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'CVV',
              hintText: 'XXX',
            ),
            cardHolderDecoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Card Holder',
            ),
            onCreditCardModelChange: (CreditCardModel model) {
              _cardController.onCreditDataChange(model);
            },
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey, shadowColor: Colors.blueGrey),
                onPressed: () {
                  if (formKey.currentState!.validate())
                    _cardController.insetCard();
                },
                icon: FaIcon(FontAwesomeIcons.plus),
                label: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Add Card'),
                )),
          )
        ],
      ),
    ));
  }
}
