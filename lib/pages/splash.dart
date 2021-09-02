import 'package:app/constant/valuse.dart';
import 'package:app/utility/prefer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () async {
      var isSetPassCode = await Perferences.getPrefBool(key: 'set_passcode');

      if (isSetPassCode == null) {
        Get.offNamed('/home');
        return;
      }

      if (isSetPassCode)
        Get.offNamed(StringValues.passCodeRoute);
      else
        Get.offNamed('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;

    return Container(
        color: Colors.white,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: width * 0.5, child: Image.asset('images/splash.png')),
            SizedBox(
              height: 30,
            ),
            CircularProgressIndicator()
          ],
        ));
  }
}
