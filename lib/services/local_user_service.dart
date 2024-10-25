import 'dart:convert';

import 'package:deal_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalUserService {
  static const _key = 'user';

  static Future<void> saveUser(CustomUser user) async {
    final prefs = await SharedPreferences.getInstance();
    print("user saved $user");
    await prefs.setString(_key, jsonEncode(user.toSql()));
  }

  static Future<CustomUser?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_key);
    if (json == null) return null;
    return CustomUser.fromSql(jsonDecode(json));
  }

  static Future<void> deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
