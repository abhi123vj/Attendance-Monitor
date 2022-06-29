import 'dart:developer';

import 'package:attendance_montior/config/data_storage.dart';
import 'package:attendance_montior/models/login_response.dart';


class UserSession {
  String? tokens;
  User? user;

  static final UserSession _instance = UserSession._internal();

  factory UserSession() {
    return _instance;
  }

  UserSession._internal() {
    // Initialization
    initUserSession();
  }

  Future initUserSession() async {
    await getTokens();
    await getUser();
  }

  // Properties
  String get accessToken {
    return tokens ?? '';
  }

  // Check if the user is logged or not
  bool isLoggedIn() {
    // print(accessToken);
    return tokens == null || tokens == '' ? false : true;
  }

  // To save user token
  void saveTokens(String token) {
    tokens = token;
    DataManager().putString(PreferenceKeys.userTokens, token);
  }

  // To Save user details in shared preference
  void saveUser(User userDetails) {
    user = userDetails;
    final userMap = userDetails.toJson();
    DataManager().putJsonObject(PreferenceKeys.userDetails, userMap);
  }

  // To get the saved tokens from the shared preference
  Future getTokens() async {
    String tokenMap = await DataManager().getString(PreferenceKeys.userTokens);
    log("fetched tokens is $tokenMap");
    tokens = tokenMap;
  }

  // To get user from the shared preference
  Future getUser() async {
    final userMap =
        await DataManager().getJsonObject(PreferenceKeys.userDetails);
    if (userMap.isNotEmpty) {
      user = User.fromJson(userMap);
    }
    log("fetched user is $userMap");
  }

  // To clear user session
  Future clearSession() async {
    tokens = null;
    user = null;
    await DataManager().removeObject(PreferenceKeys.userTokens);
    await DataManager().removeObject(PreferenceKeys.userDetails);
  }
}