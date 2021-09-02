import 'package:dio/dio.dart';

class ApiRequest {
  Dio dio = Dio();
  ApiRequest() {
    dio = Dio();
  }

  Future getRequest(String url) async {
    var response = await dio.get(url);
    return response.data;
  }
}
