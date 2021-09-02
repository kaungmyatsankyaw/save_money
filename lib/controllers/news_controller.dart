import 'package:app/constant/api_url.dart';
import 'package:app/models/news/head_line.dart';
import 'package:app/models/news/sources.dart';
import 'package:app/utility/api_request.dart';

import 'package:get/get.dart';

class NewsController extends GetxController {
  var headLine = [].obs;
  var sources = [].obs;

  @override
  void onInit() {
    super.onInit();
    getHeadLine();
    getSources();
    // Get.back();
  }

  getHeadLine() async {
    var resp = await ApiRequest().getRequest(ApiUrl.newsHeadLine);

    HeadLineModel headLineModel = HeadLineModel.fromJson(resp);
    headLine.value = headLineModel.articles;
  }

  getSources() async {
    var resp = await ApiRequest().getRequest(ApiUrl.newsSources);
    SourceModel headLineModel = SourceModel.fromJson(resp);
    sources.value = headLineModel.sources;
  }
}
