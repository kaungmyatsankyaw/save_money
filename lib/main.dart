import 'package:app/constant/route.dart';
import 'package:app/controllers/card_controller.dart';
import 'providers/index.dart';
import 'package:app/utility/secure_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'controllers/transaction_controller.dart';
import 'utility/prefer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Perferences.init();
  SecureStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final TransactionController cont = Get.put(TransactionController());
  final CardController cardController = Get.put(CardController());
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => ChartProvider()),
        ChangeNotifierProvider(
          create: (_) => CashFlowProvider()..setType('All'),
        ),
        ChangeNotifierProvider(create: (_) => ReportProvider()),
        ChangeNotifierProvider(create: (_) => GoalProvider()..getAllGoals()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => PassCodeProvider()..init())
      ],
      child: FutureBuilder(
        future: _initialization,
        builder: (_, snapshot) {
          if (snapshot.hasError) {
            return CircularProgressIndicator();
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return saveMoney();
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  GetMaterialApp saveMoney() {
    return GetMaterialApp(
      // key: Key('SaveMoney'),
      themeMode: ThemeMode.system,
      theme: ThemeData.light(),
      getPages: routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
