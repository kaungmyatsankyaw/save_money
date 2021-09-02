import 'package:flutter_credit_card/flutter_credit_card.dart';

class GetCardType {
  static CardType getCardType(String cardType) {
    var type = CardType.visa;
    switch (cardType) {
      case 'visa':
        type = CardType.visa;
        break;
      case 'CardType.discover':
        type = CardType.discover;
        break;
      case 'CardType.americanExpress':
        type = CardType.americanExpress;
        break;
      case 'CardType.mastercard':
        type = CardType.mastercard;
        break;
      default:
    }
    return type;
  }
}
