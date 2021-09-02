import 'package:app/pages/component/page_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebView extends StatefulWidget {
  @override
  _CustomWebViewState createState() => _CustomWebViewState();
}

class _CustomWebViewState extends State<CustomWebView> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NormalAppBar(
          titleText: Get.arguments['name'],
          buttonText: '',
          showBtn: false,
        ),
        body: Stack(
          children: [
            WebView(
              onPageFinished: (result) {
                setState(() {
                  isLoading = false;
                });
              },
              initialUrl: Get.arguments['url'],
            ),
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(),
          ],
        ));
  }
}
