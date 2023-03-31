import 'package:shared_preferences/shared_preferences.dart';
class LocalStorageService {

  static Future<void> saveIntData({required int value, required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  static Future<int> getIntData({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? '';
  }
  
  static Future<void> saveStringData({required String value, required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static Future<String> getStringData({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }
  
  static Future<void> saveBoolData({required bool value, required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  static Future<bool> getBoolData({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? '';
  }
  
  static Future<void> removeData({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

}
