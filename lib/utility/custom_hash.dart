import 'package:flutter_sodium/flutter_sodium.dart';

class CustomHash {
  static init() {
    Sodium.init();
  }

  static hashPassword({required String str}) {
    return PasswordHash.hashStringStorage(str);
  }

  static comparePassword({required String hashPassword, required String pass}) {
    return PasswordHash.verifyStorage(hashPassword, pass);
  }
}
