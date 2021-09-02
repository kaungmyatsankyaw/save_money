import 'package:app/pages/component/page_app_bar.dart';
import 'package:app/pages/setting/component/app_info.dart';
import 'package:app/pages/setting/component/app_security.dart';
import 'package:app/pages/setting/component/app_setting.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAppBar(
        titleText: 'Setting',
        buttonText: '',
        showBtn: false,
      ),
      body: Container(
        
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Container(
         
          margin: EdgeInsets.only(top: 30),
          child: ListView(
            children: [
              AppSetting(),
              AppSecurity(),
              AppInfo(),
              BuildSettingSection(
                title: 'Privacy Policy',
              ),
              BuildSettingSection(
                title: 'Term & Condition',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BuildSettingSection extends StatelessWidget {
  final String title;

  BuildSettingSection({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
