import 'package:app/controllers/news_controller.dart';
import 'package:app/models/news/head_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeadLine extends StatelessWidget {
  final NewsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      int length = _controller.headLine.value.length;
      if(length == 0){
        return Center(child: CircularProgressIndicator());
      }
      return ListView.builder(
        itemCount: length,
        itemBuilder: (BuildContext context, int index) {
          Article article = _controller.headLine.value[index];
          return Container(
            margin: EdgeInsets.all(10),
            // height: 400,
            width: MediaQuery.of(context).size.width,
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  article.urlToImage != ''
                      ? Image.network(article.urlToImage)
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      article.title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(article.content),
                  )
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
