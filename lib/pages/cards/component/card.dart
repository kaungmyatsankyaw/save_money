import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CCard extends StatelessWidget {
  final CardType cardType;
  final String cardNumber;
  final String expiredDate;
  final String cardHolderName;
  final String cvvCode;

  CCard(
      {required this.cardType,
      required this.cardNumber,
      required this.expiredDate,
      required this.cardHolderName,
      required this.cvvCode});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CreditCardWidget(
            cardType: cardType,
            cardNumber: cardNumber,
            expiryDate: expiredDate,
            cardHolderName: cardHolderName,
            cvvCode: '',
            showBackView: false,
            obscureCardNumber: true,
            obscureCardCvv: true,
            width: MediaQuery.of(context).size.width,
            animationDuration: Duration(
                milliseconds: 1000) //true when you want to show cvv(back) view
            ));
  }
}
