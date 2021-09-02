import 'package:app/constant/valuse.dart';
import 'package:app/pages/component/page_app_bar.dart';
import 'package:app/pages/login/component/build_button.dart';
import 'package:app/pages/login/component/build_textfield.dart';
import 'package:app/providers/auth_provider.dart';
import 'package:app/utility/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAppBar(
        centerTitle: true,
        titleText: 'Save Money',
        buttonText: '',
        showBtn: false,
        showBackIcon: false,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.1),
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 120,
                child: Image.asset('images/splash.png'),
                margin: EdgeInsets.only(top: 30),
              ),
              SizedBox(
                height: 30,
              ),
              if (StringValues.loginWithPhone)
                LoginWIthPhone(
                    formKey: formKey,
                    nameController: nameController,
                    phoneController: phoneController),
              LoginButton(),
              SizedBox(
                height: 20,
              ),
              BackButton()
            ],
          ),
        ),
      ),
    );
  }
}

class LoginWIthPhone extends StatelessWidget {
  const LoginWIthPhone({
    Key? key,
    required this.formKey,
    required this.nameController,
    required this.phoneController,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: Colors.grey.shade300))),
      margin: EdgeInsets.only(bottom: 30, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Login With Phone',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(),
          Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildTextField(
                      hintText: 'Enter Name',
                      labelText: ' Name',
                      controller: nameController,
                      iconData: Icons.person,
                      inputType: TextInputType.name),
                  SizedBox(
                    height: 25,
                  ),
                  BuildTextField(
                      hintText: 'Enter Phone start with +959',
                      labelText: ' Phone Number',
                      controller: phoneController,
                      iconData: Icons.phone,
                      inputType: TextInputType.phone),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      children: [
                        BuildButton(
                          btnText: 'Login',
                          buttonStyle: ElevatedButton.styleFrom(
                              primary: Colors.blueGrey),
                          formKey: formKey,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SignInButton(
        Buttons.Google,
        text: "Login with Google",
        onPressed: () async {
          var user = await Authentication.signInWithGoogle(context: context);
          await Provider.of<AuthProvider>(context, listen: false).saveUserInfo(
              username: user!.displayName ?? '',
              profileUrl: user.photoURL ?? '',
              phone: user.phoneNumber ?? '',
              email: user.email ?? '',
              isLogin: true,
              authProvider: 'google');
        
        },
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.red.shade400),
          onPressed: () {
            Get.back();
          },
          child: Text('Back')),
    );
  }
}
