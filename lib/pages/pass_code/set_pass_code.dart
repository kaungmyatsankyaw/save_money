import 'package:app/providers/pass_code_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:provider/provider.dart';

class SetPassCode extends StatefulWidget {
  @override
  _SetPassCodeState createState() => _SetPassCodeState();
}

class _SetPassCodeState extends State<SetPassCode> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () {
      Provider.of<PassCodeProvider>(context, listen: false)
        ..resetPassCode()
        ..setShowPassCode('')
        ..resetPassCodeConfirm()
        ..setError('')
        ..setIsFirst(true)
        ..setIsSecond(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    // var height = size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: width * 0.4,
                  child: Image.asset(
                    'images/splash.png',
                    fit: BoxFit.contain,
                  )),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.all(10),
                width: width,
                child: Column(
                  children: [
                    buildText(text: 'Set Pass Code For Security'),
                    SizedBox(
                      height: 10,
                    ),
                    buildText(text: 'Passcode Must Be 6 Digits.'),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                        height: 60,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.blueGrey, width: 0.2)),
                        margin: EdgeInsets.only(
                            left: width * 0.15, right: width * 0.15),
                        width: width * 0.8,
                        child: Selector<PassCodeProvider, List>(
                            builder: (_, str, child) {
                              return Row(
                                children: [
                                  // ignore: unused_local_variable
                                  for (var i in str)
                                    Container(
                                        // color: Colors.red,
                                        margin: EdgeInsets.all(8),
                                        padding: EdgeInsets.all(8),
                                        child: Icon(
                                          Icons.circle,
                                          size: 8,
                                        ))
                                ],
                              );
                            },
                            selector: (_, prov) => prov.getShowPassCode)),
                    SizedBox(
                      height: 20,
                    ),
                    Selector<PassCodeProvider, String>(
                        builder: (_, str, child) {
                          return Text(
                            str,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red.shade400),
                          );
                        },
                        selector: (_, prov) => prov.getError)
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(top: getContainerBorderSide())),
                width: MediaQuery.of(context).size.width,
                child: NumericKeyboard(
                    leftIcon: Icon(
                      FontAwesomeIcons.smile,
                      color: Colors.orange.shade900,
                    ),
                    rightIcon: Icon(Icons.backspace),
                    rightButtonFn: () {
                      Provider.of<PassCodeProvider>(context, listen: false)
                          .removeCode();
                    },
                    onKeyboardTap: (String str) {
                      Provider.of<PassCodeProvider>(context, listen: false)
                          .setPassCode(context, code: str);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  onKeyboardTap(String str) {}

  buildText({required String text}) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  getContainerBorderSide() {
    return BorderSide(width: 1, color: Colors.blueGrey);
  }
}
