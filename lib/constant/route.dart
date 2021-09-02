import 'package:app/constant/valuse.dart';
import 'package:app/pages/add_card/index.dart';
import 'package:app/pages/add_goal/index.dart';
import 'package:app/pages/add_transaction/income.dart';
import 'package:app/pages/add_transaction/outcome.dart';
import 'package:app/pages/bycategory/expense.dart';
import 'package:app/pages/bycategory/income.dart';
import 'package:app/pages/cards/index.dart';
import 'package:app/pages/component/custom_webview.dart';
import 'package:app/pages/exchange_rate/index.dart';
import 'package:app/pages/goal/all_categories.dart';
import 'package:app/pages/goal/by_category.dart';
import 'package:app/pages/goal/detail.dart';
import 'package:app/pages/home/index.dart';
import 'package:app/pages/login/index.dart';
import 'package:app/pages/news/index.dart';
import 'package:app/pages/pass_code/pass_code.dart';
import 'package:app/pages/pass_code/set_pass_code.dart';
import 'package:app/pages/report/index.dart';
import 'package:app/pages/setting/index.dart';
import 'package:app/pages/splash.dart';
import 'package:get/route_manager.dart';

final routes = [
  GetPage(name: '/', page: () => Splash()),
  GetPage(name: StringValues.homeRoute, page: () => Home()),
  GetPage(name: StringValues.exchangeRoute, page: () => ExchangeRate()),
  GetPage(name: StringValues.newRoute, page: () => News()),
  GetPage(name: StringValues.webViewRoute, page: () => CustomWebView()),
  GetPage(name: StringValues.cardRoute, page: () => CardsPage()),
  GetPage(name: StringValues.addCardRoute, page: () => AddCard()),
  GetPage(name: StringValues.addIncomeRoute, page: () => Income()),
  GetPage(name: StringValues.addOutcomeRoute, page: () => OutCome()),
  GetPage(name: StringValues.incomeCategory, page: () => IncomeByCategory()),
  GetPage(name: StringValues.expenseCategory, page: () => ExpenseByCategory()),
  GetPage(name: StringValues.reportRoute, page: () => Report()),
  GetPage(name: StringValues.goalCategoriesRoute, page: () => GoalCatgories()),
  GetPage(name: StringValues.addGoalRoute, page: () => AddGoal()),
  GetPage(name: StringValues.goalByCategoryRoute, page: () => GoalByCategory()),
  GetPage(name: StringValues.goalDetailRoute, page: () => GoalDetail()),
  GetPage(name: StringValues.logInOrOutRoute, page: () => Login()),
  GetPage(name: StringValues.settingRoute, page: () => SettingPage()),
  GetPage(name: StringValues.setPassCodeRoute, page: () => SetPassCode()),
  GetPage(name: StringValues.passCodeRoute, page: () => PassCodeScreen())
];
