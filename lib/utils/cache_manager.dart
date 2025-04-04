import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  static const String cacheKey = 'cached_users';

  static Future<void> saveUsers(String jsonData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(cacheKey, jsonData);
  }

  static Future<String?> loadCachedUsers() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(cacheKey);
  }
}
