import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPrefe;
  static Future cacheInitialtion() async {
    sharedPrefe = await SharedPreferences.getInstance();
  }

  static Future<bool> setCacheToData(
      {required String key, required String value}) async {
    return await sharedPrefe.setString(key, value);
  }

  static String getCacheData({required String key}) {
    return sharedPrefe.getString(key) ?? '';
  }

  static Future<bool> deleteCacheItem({required String key}) async {
    return await sharedPrefe.remove(key);
  }
}
