import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static late FlutterSecureStorage storage;

  static init() {
    storage = FlutterSecureStorage();
  }

  static read({required String key}) async {
    return await storage.read(key: key);
  }

  static write({required String key, required String value}) async {
    return await storage.write(key: key, value: value);
  }

  static delete({required key}) async {
    return await storage.delete(key: key);
  }
}
