import 'package:app/constant/valuse.dart';
import 'package:app/controllers/card_controller.dart';
import 'package:app/pages/cards/component/card.dart';
import 'package:app/pages/component/page_app_bar.dart';
import 'package:app/pages/home/component/general/circle_avatar.dart';
import 'package:app/providers/auth_provider.dart';
import 'package:app/utility/get_card_type.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  final CardController _cardController = Get.put(CardController());

  @override
  Widget build(BuildContext context) {
    var type;

    return Obx(() =>
     SliverAppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        title: Text(
          'Hello ',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Consumer<AuthProvider>(builder: (_, prov, wz) {
            LoginUser user = prov.getUser;
            return user.isLogin == true
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomCircelAvatar(
                      radius: 20,
                      imageUrl: user.profileUrl,
                    ))
                : Container();
          })
        ],
        pinned: true,
        snap: false,
        floating: true,
        expandedHeight: _cardController.cardList.length != 0 ? 430.0 : 0,
        flexibleSpace: _cardController.cardList.length != 0
            ? FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 1, color: Colors.blueGrey))),
                  margin: EdgeInsets.only(
                    top: 100,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: 35, right: 20, left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 8,
                                              color: Colors.blueGrey))),
                                  child: Text(
                                    'Card',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                NormalAppBar.getButton(
                                    routeName: StringValues.cardRoute,
                                    iconData: FontAwesomeIcons.listOl,
                                    buttonText: 'View All')
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CarouselSlider(
                              options: CarouselOptions(
                                  enlargeCenterPage: true,
                                  autoPlay: _cardController.cardList.length > 1
                                      ? true
                                      : false,
                                  height: 260.0,
                                  viewportFraction: 1),
                              items: _cardController.cardList.take(4).map((e) {
                                type = GetCardType.getCardType(e['type']);
                                return Container(
                                  child: CCard(
                                    cardHolderName: e['holder_name'],
                                    expiredDate: e['expired_date'],
                                    cvvCode: '',
                                    cardNumber: e['card_number'],
                                    cardType: type,
                                  ),
                                );
                              }).toList()),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : Container()));
  }
}
