import 'package:app/constant/valuse.dart';
import 'package:app/data_model/general_model.dart';
import 'package:app/pages/component/page_app_bar.dart';
import 'package:app/pages/home/component/general/user_section.dart';
import 'package:app/providers/auth_provider.dart';
import 'package:app/utility/authentication.dart';
import 'package:app/utility/prefer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class General extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var width = size.width;
    // var height = size.height;

    return Scaffold(
      appBar: NormalAppBar(
        buttonText: '',
        titleText: 'General',
        showBtn: false,
      ),
      body: SafeArea(
        child: Container(
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              Container(
                child: Consumer<AuthProvider>(builder: (_, prov, wz) {
                  LoginUser user = prov.getUser;
                  return user.isLogin == true
                      ? Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.blueGrey, width: 0.3))),
                          // height: 160,
                          child: UserSection(
                            user: user,
                          ),
                        )
                      : Container();
                }),
              ),
              Container(
                  height: 360,
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(30),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: GeneralModel.settingList
                        .map<Widget>((e) => buildContainer(e))
                        .toList(),
                  )),
              SizedBox(
                height: 30,
              ),
              Consumer<AuthProvider>(builder: (_, prov, wz) {
                LoginUser user = prov.getUser;
                if (user.isLogin)
                  return buildButton(
                      btnText: 'Log Out',
                      iconData: Icons.logout,
                      fun: () async {
                        await Authentication.signOut(context: context);
                        await Perferences.clearAll();
                        await Provider.of<AuthProvider>(context, listen: false)
                            .getUserInfo();
                      });
                else
                  return buildButton(
                      btnText: 'Log In',
                      iconData: Icons.login,
                      fun: () {
                        Get.toNamed(StringValues.logInOrOutRoute);
                      });
              })
            ],
          ),
        ),
      ),
    );
  }

  buildButton(
      {required String btnText,
      Color btnColor = Colors.white,
      textColor = Colors.black,
      Color iconColor = Colors.black,
      required IconData iconData,
      required Function fun}) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(height: 85),
      child: Container(
        margin: EdgeInsets.all(20),
        child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                shadowColor: Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0)),
                primary: Colors.white,
                onSurface: Colors.black),
            onPressed: () {
              fun();
            },
            icon: Icon(
              iconData,
              color: iconColor,
            ),
            label: Text(
              btnText,
              style: TextStyle(color: textColor),
            )),
      ),
    );
  }

  buildContainer(GeneralModel generalModel) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(generalModel.routeName);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey[500],
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              generalModel.icon,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              generalModel.text,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
