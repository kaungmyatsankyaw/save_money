import 'package:app/constant/valuse.dart';
import 'package:app/pages/setting/component/section.dart';
import 'package:app/pages/setting/component/utility.dart';
import 'package:app/providers/pass_code_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AppSecurity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Section(title: 'App Security', wlist: [
      Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SettingUtility.buildSubTitle(title: 'Secure App'),
            Selector<PassCodeProvider, bool>(
                builder: (_, isSet, child) {
                  if (isSet)
                    return SettingUtility.buildButton(
                        text: 'Clear Passcode',
                        fun: () async {
                          await Provider.of<PassCodeProvider>(context,
                                  listen: false)
                              .clearPassCode();
                        });

                  return SettingUtility.buildButton(
                      text: 'Set Pass Code',
                      fun: () async {
                        var i =
                            await Get.toNamed(StringValues.setPassCodeRoute) ??
                                '';

                        if (i.toString().isNotEmpty)
                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(SnackBar(content: Text(i)));
                      });
                },
                selector: (_, prov) => prov.isSetPassCode)
          ],
        ),
      )
    ]);
  }
}
