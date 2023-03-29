import 'package:shared_preferences/shared_preferences.dart';
class LocalStorageService {

  static Future<void> saveData({required String name, required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, name);
  }

  static Future<String> getData({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

}
