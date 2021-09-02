import 'package:app/constant/api_url.dart';
import 'package:app/constant/valuse.dart';
import 'package:app/utility/api_request.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ExchangeRateController extends GetxController {
  Map<String, dynamic> exchangeRate = {'exchange': {}, 'info': ''};
  var date = DateTime.now().toString().split(' ')[0].obs;
  @override
  void onInit() {
    super.onInit();

    getData();
  }

  Future getData() async {
    var resp = await ApiRequest().getRequest(ApiUrl.exchangeRate);
    formatData(resp);
  }

  formatData(resp) {
    if (resp['rates'] is List<dynamic>) {
      exchangeRate['no_data'] = true;
      exchangeRate['exchange'] = {};
      update();

      return;
    }

    Map<String, dynamic> map = Map<String, dynamic>.from(resp['rates']);
    Map<String, dynamic> exchange = {};

    for (String rateKey in map.keys) {
      for (String key in StringValues.currency.keys) {
        if (rateKey == key) {
          exchange[StringValues.currency[rateKey].toString()] =
              resp['rates'][rateKey] + ' ' + key;
        }
      }
    }
    exchangeRate['info'] = resp['info'];
    exchangeRate['no_data'] = false;
    exchangeRate['exchange'] = exchange;

    update();
  }

  formatDate(chooseDate) {
    exchangeRate['exchange'] = {};
    update();
    date.value = chooseDate.toString().split(' ')[0];
    getHistory(chooseDate);
  }

  getHistory(date) async {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(date);

    var resp =
        await ApiRequest().getRequest(ApiUrl.exchangeReateHistory + formatted);

    formatData(resp);
  }
}
