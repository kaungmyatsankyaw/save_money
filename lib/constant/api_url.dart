import 'package:app/constant/valuse.dart';

class ApiUrl{
  static final exchangeRate='http://forex.cbm.gov.mm/api/latest';
  static final exchangeRateCurrency='http://forex.cbm.gov.mm/api/currencies';
  static final exchangeReateHistory='http://forex.cbm.gov.mm/api/history/';
  static final newsHeadLine='https://newsapi.org/v2/top-headlines?country=us&apiKey='+StringValues.newApiKey;
  static final newsSources='https://newsapi.org/v2/top-headlines/sources?apiKey='+StringValues.newApiKey;
}