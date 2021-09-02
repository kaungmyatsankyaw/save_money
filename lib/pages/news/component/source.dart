import 'package:app/constant/valuse.dart';
import 'package:app/controllers/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum WhyFarther { harder, smarter, selfStarter, tradingCharter }

class Sources extends StatelessWidget {
  final NewsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // ignore: invalid_use_of_protected_member
      var sources = _controller.sources.value;
      int length = sources.length;
      return ListView.builder(
        itemCount: length,
        itemBuilder: (BuildContext context, int index) {
          var source = sources[index];
          return Container(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Card(
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    source.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Text(source.description),
                trailing: PopupMenuButton(
                  onSelected: (result) {
                    
                    switch (result) {
                      case 'DETAIL':
                        Get.toNamed(StringValues.webViewRoute, arguments: {
                          'name': source.name,
                          'url': source.url
                        });
                        break;
                      default:
                    }
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                    PopupMenuItem(
                      value: source.country,
                      child: Text(
                          'Country - ${source.country.toString().toUpperCase()}'),
                    ),
                    PopupMenuItem(
                      value: source.language,
                      child: Text(
                          'Language - ${source.language.toString().toUpperCase()}'),
                    ),
                    PopupMenuItem(
                      value: 'DETAIL',
                      child: Text('View Deail'),
                    ),
                  ],
                ),
                isThreeLine: true,
              ),
            ),
          );
        },
      );
    });
  }
}
