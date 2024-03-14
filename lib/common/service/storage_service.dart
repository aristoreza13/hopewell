import 'dart:convert';

import 'package:hopewell/common/entities/user.dart';
import 'package:hopewell/common/values/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences prefs;

  // initialize SharedPreference
  Future<StorageService> init() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await prefs.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await prefs.setString(key, value);
  }

  bool getDeviceFirstOpen() {
    return prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  bool getIsLoggedIn() {
    return prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }

  Future<bool> remove(String key) {
    return prefs.remove(key);
  }

  String getUserToken() {
    return prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) ?? "";
  }

  UserItem? getUserProfile() {
    var profileOffline =
        prefs.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? "";
    print(profileOffline);
    if (profileOffline.isNotEmpty) {
      var userData = jsonDecode(profileOffline);
      return UserItem(
          name: userData['display_name'], avatar: userData['photoUrl']);
    }

    return null;
  }
}
