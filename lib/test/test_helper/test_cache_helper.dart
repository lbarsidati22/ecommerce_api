import 'package:shared_preferences/shared_preferences.dart';

class TestCacheHelper {
  static late SharedPreferences sharedPrefer;
  static Future cacheInite() async {
    sharedPrefer = await SharedPreferences.getInstance();
  }

  static Future<bool> setData({
    required String key,
    required String value,
  }) async {
    return await sharedPrefer.setString(key, value);
  }

  static String getData({
    required String key,
  }) {
    return sharedPrefer.getString(key) ?? '';
  }

  static Future<bool> deleteData({
    required String key,
  }) async {
    return await sharedPrefer.remove(key);
  }
}
