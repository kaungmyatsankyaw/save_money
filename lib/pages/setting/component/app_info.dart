import 'package:app/pages/setting/component/section.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class AppInfo extends StatelessWidget {
  Future<PackageInfo> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    return info;
  }

  Widget _infoTile(String title, String subtitle) {
    return ListTile(
      subtitle: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w400,
        ),
      ),
      title: Text(
        subtitle.isNotEmpty ? subtitle : 'Not set',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
        future: _initPackageInfo(),
        builder: (_, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Container(
              child: CircularProgressIndicator(),
            );
          }

          return Section(title: 'App Info', wlist: [
            _infoTile('App name', snapshot.data!.appName),
            _infoTile('App version', snapshot.data!.version),
          ]);
        });
  }
}
