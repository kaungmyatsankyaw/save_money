import 'package:shared_preferences/shared_preferences.dart';

class Perferences {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static late SharedPreferences _prefsInstance;

  Perferences() {
    init();
  }

  static Future<void> init() async {
    _prefsInstance = await _prefs;
  }

  /// Set String
  static setPrefString({required String key, required String value}) async {
    var instance = await _prefs;
    instance.setString(key, value);
  }

  /// Get String
  static getPrefString({required String key}) {
    return _prefsInstance.getString(key);
  }

  /// Set Bool
  static setPrefBool({required String key, required bool value}) async {
    var instance = await _prefs;
    instance.setBool(key, value);
  }

  /// Get Bool
  static getPrefBool({required String key}) async {
    return _prefsInstance.getBool(key);
  }

  // Remove From Pref
  static removeFromPref({required String key}) async {
    await _prefsInstance.remove(key);
  }

  static clearAll() async {
    _prefsInstance.clear();
  }
}
