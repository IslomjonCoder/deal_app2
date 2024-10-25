import 'dart:convert';

import 'package:deal_app/config/datasource.dart';
import 'package:deal_app/models/user.dart';
import 'package:deal_app/services/profile_service.dart';
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
    final user = CustomUser.fromSql(jsonDecode(json));
    final login = await ProfileService().getMe(user.id);
    return login is DataSuccess ? user : null;
  }

  static Future<void> deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
