import 'package:app/pages/home/component/cash_flow.dart';
import 'package:app/pages/home/component/general.dart';
import 'package:app/pages/home/component/goal.dart';
import 'package:app/pages/home/component/home.dart';
import 'package:app/pages/home/component/transaction.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum TransactionType { Income, Outcome }

class StringValues {
  static const String goalPageTitle = 'Goal';
  static const String expansePageTitle = 'Expense';
  static const String goalPageBtnText = 'Add Goal';
  static const String expensePageBtnText = 'Add Expense';
  static const String generalPetrolPrice = 'Petrol Price';
  static const String generalExchangeRate = 'Exchange Rate';
  static const String generalNews = 'News';
  static const String generalContact = 'Contact';
  static const String generalSetting = 'Setting';
  static const String generalCard = 'Cards';
  static const String incomeAddTitle = 'Add Income';
  static const String outcomeAddTitle = 'Add Outcome';
  static const String reportTitle = 'Report';
  static const String reportYearly = 'Yearly';
  static const String reportMonthly = 'Monthly';
  static const String goalCategoryTitle = 'Goal Categories';
  static const String goalAddTitle = 'Add Goal';
  static const String goalByCategoryTitle = 'Goal By Category';
  static const String goalDetailTitle = 'Goal Detail';
  static const String logInOrOutTitle = ' Log In';

  /// Route */
  static const String homeRoute = "/home";
  static const String exchangeRoute = '/exchange_rate';
  static const String contactRoute = '/contact';
  static const String cardRoute = '/cards';
  static const String newRoute = '/news';
  static const String settingRoute = '/setting';
  static const String webViewRoute = '/webview';
  static const String addRecordRoute = '/addrecord';
  static const String addGoalRoute = '/addgoal';
  static const String addExpenseRoute = '/addexpense';
  static const String addCardRoute = '/addcard';
  static const String addIncomeRoute = '/addincome';
  static const String addOutcomeRoute = '/addoutcome';
  static const String incomeCategory = '/incomebycategory';
  static const String expenseCategory = '/expensebycategory';
  static const String reportRoute = '/report';
  static const String goalCategoriesRoute = '/goalcategories';
  static const String goalByCategoryRoute = '/goalbycategory';
  static const String goalDetailRoute = '/goaldetail';
  static const String logInOrOutRoute = '/loginregister';
  static const String passCodeRoute = '/passcode';
  static const String setPassCodeRoute = '/setpasscode';

  /// Preferences Key
  static const String userName = 'username';
  static const String profileUrl = 'profile_url';
  static const String userEmail = 'email';
  static const String userPhone = 'phone';
  static const String userIsLogin = 'isLogin';
  static const String userAuthProvider = 'auth_provider';

  /// Api Keys */
  static final String newApiKey = '8071a19f260945cba503fa1688357f9f';

  // Passcode
  static const String passCode = 'passcode';
  static const String setPassCode = 'set_passcode';

  // Login With Phone
  static const bool loginWithPhone = false;

  /// HomePage Component */
  static final List pages = [
    {
      'label': 'Home',
      'page': HomeComponent(),
      'icon': Icon(Icons.home),
      'activeIcon': Icon(Icons.home_filled),
      'show': true
    },
    {
      'label': 'Goal',
      'page': Goal(),
      'icon': FaIcon(FontAwesomeIcons.piggyBank),
      'activeIcon': FaIcon(FontAwesomeIcons.piggyBank),
      'show': true
    },
    {
      'label': 'CashFlow',
      'page': CashFlow(),
      'icon': FaIcon(FontAwesomeIcons.exchangeAlt),
      'activeIcon': FaIcon(FontAwesomeIcons.random),
      'show': true
    },
    // {
    //   'label': 'Expense',
    //   'page': Transaction(),
    //   'icon': FaIcon(FontAwesomeIcons.moneyBill),
    //   'activeIcon': FaIcon(FontAwesomeIcons.moneyBillAlt),
    //   'show': true
    // },
    {
      'label': 'Transaction',
      'page': Transaction(),
      'icon': FaIcon(FontAwesomeIcons.listAlt),
      'activeIcon': FaIcon(FontAwesomeIcons.thList),
      'show': true
    },
    {
      'label': 'General',
      'page': General(),
      'icon': FaIcon(FontAwesomeIcons.cog),
      'activeIcon': FaIcon(FontAwesomeIcons.cogs),
      'show': true
    },
  ];

  /// Currency */
  static final Map<String, String> currency = {
    "USD": "United State Dollar",
    "EUR": "Euro",
    "SGD": "Singapore Dollar",
    "GBP": "Pound Sterling",
    "CHF": "Swiss Franc",
    "JPY": "Japanese Yen",
    "AUD": "Australian Dollar",
    "BDT": "Bangladesh Taka",
    "BND": "Brunei Dollar",
    "KHR": "Cambodian Riel",
    "CAD": "Canadian Dollar",
    "CNY": "Chinese Yuan",
    "HKD": "Hong Kong Dollar",
    "INR": "Indian Rupee",
    "IDR": "Indonesian Rupiah",
    "KRW": "Korean Won",
    "LAK": "Lao Kip",
    "MYR": "Malaysian Ringgit",
    "NZD": "New Zealand Dollar",
    "PKR": "Pakistani Rupee",
    "PHP": "Philippines Peso",
    "LKR": "Sri Lankan Rupee",
    "THB": "Thai Baht",
    "VND": "Vietnamese Dong",
    "BRL": "Brazilian Real",
    "CZK": "Czech Koruna",
    "DKK": "Danish Krone",
    "EGP": "Egyptian Pound",
    "ILS": "Israeli Shekel",
    "KES": "Kenya Shilling",
    "KWD": "Kuwaiti Dinar",
    "NPR": "Nepalese Rupee",
    "NOK": "Norwegian Kroner",
    "RUB": "Russian Rouble",
    "SAR": "Saudi Arabian Riyal",
    "RSD": "Serbian Dinar",
    "ZAR": "South Africa Rand",
    "SEK": "Swedish Krona"
  };
}
