import 'package:flutter/material.dart';

class NoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Image.asset('images/credit_card_1.png'))),
            SizedBox(height: 30,),
          Center(
              child: Text(
            'You don\'t have No Card.Add Card 😄',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
          ))
        ],
      ),
    );
  }
}
