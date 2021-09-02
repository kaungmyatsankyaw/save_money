import 'package:app/constant/db.dart';
import 'package:app/utility/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';

class CardController extends GetxController {
  var cardCount = 0.obs;
  var cardList = [].obs;

  var cardNumber = ''.obs;
  var expiryDate = ''.obs;
  var cardHolderName = ''.obs;
  var cvvCode = ''.obs;
  var isCvvFocused = false.obs;
  var cardType = CardType.mastercard.obs;

  late DatabaseHandler databaseHandler;
  @override
  void onInit() {
    super.onInit();
    this.databaseHandler = DatabaseHandler();
    this.databaseHandler.initializeDB().whenComplete(() async {
      await getCardCount();
      await getAllCard();
    });
  }

  Future getCardCount() async {
    var query = "select count(id) as count from ${DatabaseConstant.cardTable}";
    var db = await this.databaseHandler.initializeDB();
    List result = await db.rawQuery(query);
    cardCount.value = result[0]['count'];
  }

  Future getAllCard() async {
    var query =
        "select * from ${DatabaseConstant.cardTable} order by ${DatabaseConstant.cardTableFields['id']} desc";
    var db = await this.databaseHandler.initializeDB();
    List result = await db.rawQuery(query);
    print('object');
    cardList.value = result;
  }

  Future insetCard() async {
    Get.dialog(Center(
      child: CircularProgressIndicator(),
    ));
    var _type = cardType.value;

    var _expiredDate = expiryDate.value.toString();
    var _cardNumber =
        cardNumber.value.toString().replaceAll(new RegExp(r"\s+"), "");
    var _holderName = cardHolderName.value.toString();
    var query =
        "insert into ${DatabaseConstant.cardTable}(${DatabaseConstant.cardTableFields['type']},${DatabaseConstant.cardTableFields['expired_date']},${DatabaseConstant.cardTableFields['card_number']},${DatabaseConstant.cardTableFields['holder_name']}) values ('$_type','$_expiredDate','$_cardNumber','$_holderName') ";
    var db = await this.databaseHandler.initializeDB();
    db.rawQuery(query);
    Future.delayed(Duration(seconds: 4), () {
      this.getCardCount();
      this.getAllCard();
      Get.back();
      Get.back();
    });
  }

  Future deleteCard(id) async {
    Get.dialog(Center(
      child: CircularProgressIndicator(),
    ));
    var query = "delete from ${DatabaseConstant.cardTable} where id = $id ";
    var db = await this.databaseHandler.initializeDB();
    db.rawQuery(query);
    Future.delayed(Duration(seconds: 2), () {
      Get.back();
      this.getCardCount();
      this.getAllCard();
      Get.back();
    });
  }

  /// Credit Card Data Change */
  onCreditDataChange(CreditCardModel creditCardModel) {
    cardNumber.value = creditCardModel.cardNumber;
    expiryDate.value = creditCardModel.expiryDate;
    cardHolderName.value = creditCardModel.cardHolderName;
    cvvCode.value = creditCardModel.cvvCode;
    isCvvFocused.value = creditCardModel.isCvvFocused;
  }

  /// Reset Card Data */
  cardDataReset() {
    cardNumber.value = '';
    expiryDate.value = '';
    cardHolderName.value = '';
    cvvCode.value = '';
    cardType.value = CardType.mastercard;
  }
}
