import 'dart:convert';

// import 'package:collector_app/common/models/users.dart';
import 'package:finacct/common/models/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const _userKey = "AppUser";
  static const userName = "user_name";
  static const InvalidResponse = "InvalidResponse";
  static const password = "password";
  static const alias_key = "alias_key";
  static const url_key = "url_key";

  static const _coOpValue = "CoOpValue";
  static const _firstTimeAppOpen = 'firstTimeAppOpen';
  static const _appAccessToken = 'appToken';
  static const _refresh_token = 'refresh_token';

  static const _rememberNumber = "rememberNumber";

  static const _biometricLogin = "biometricLogin";
  static const _deviceUUID = "deviceUUID";
  static const _downloadedFilesList = "downloadedFilesList";
  static const _accountsList = "accountsList";

  static const _rememberMe = 'rememberMe';

  static Future setRememberMe(bool status) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setBool(_rememberMe, status);
  }

  static Future<bool> getRememberMe() async {
    final instance = await SharedPreferences.getInstance();
    return instance.getBool(_rememberMe) ?? false;
  }

  static Future setFirstTimeAppOpen(bool status) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setBool(_firstTimeAppOpen, status);
  }

  static Future setAccountsList(String accounts) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString(_accountsList, accounts);
  }

  static Future getAccountsList() async {
    final instance = await SharedPreferences.getInstance();
    return instance.getString(_accountsList);
  }

  static Future<bool> getFirstTimeAppOpen() async {
    final instance = await SharedPreferences.getInstance();
    instance.getKeys().forEach((e) {
      print("Keys");
      print(e);
      print("Keys");
    });
    print("The bool for first_run is : ${instance.getBool('first_run')}");
    final bool isFirstRuniOS = instance.getBool('first_run') ?? true;
    if (isFirstRuniOS) {
      instance.clear();
      instance.setBool('first_run', false);
      return true;
    }
    final res = instance.getBool(_firstTimeAppOpen);
    if (res == null) {
      return true;
    }
    return res;
  }

  static Future setUser(User user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString(_userKey, json.encode(user.toJson()));
  }

  static Future<User?> getUser() async {
    final instance = await SharedPreferences.getInstance();

    final res = instance.getString(_userKey);
    if (res == null) {
      return null;
    }
    User? localUser;
    try {
      localUser = User.fromJson(json.decode(res));
    } catch (e) {
      return null;
    }
    return localUser;
  }

  static Future deleteUser() async {
    final instance = await SharedPreferences.getInstance();
    await instance.remove(_userKey);
  }

  static Future deleteLoginCoOp() async {
    final instance = await SharedPreferences.getInstance();
    await instance.remove(_userKey);
  }

  static Future setAccessToken(String jwtToken) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString(_appAccessToken, jwtToken);
  }

  static Future setUsername(String username) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString(userName, username);
  }

  static Future<String> getUsername() async {
    final instance = await SharedPreferences.getInstance();
    final res = instance.getString(userName);
    return res ?? "";
  }

  static Future setInvalidResponse(String inputValue) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString(InvalidResponse, inputValue);
  }

  static Future<String> getInvalidResponse() async {
    final instance = await SharedPreferences.getInstance();
    final res = instance.getString(InvalidResponse);
    return res ?? "Login Error";
  }

  static Future<String> getPassword() async {
    final instance = await SharedPreferences.getInstance();
    final res = instance.getString(password);
    return res ?? "";
  }

  static Future<String> getalias() async {
    final instance = await SharedPreferences.getInstance();
    final res = instance.getString(alias_key);
    return res ?? "";
  }

  static Future<String> getUrl() async {
    final instance = await SharedPreferences.getInstance();
    final res = instance.getString(url_key);
    return res ?? "";
  }

  static Future setPassword(String passWord) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString(password, passWord);
  }

  static Future setAlias(String alias) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString(alias_key, alias);
  }

  static Future getAlias() async {
    final instance = await SharedPreferences.getInstance();
    return instance.getString(alias_key) ?? '';
  }

  static Future setUrl(String url) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString(url_key, url);
  }

  static Future getRememberNumber() async {
    final instance = await SharedPreferences.getInstance();
    final res = instance.getString(_rememberNumber);
    return res ?? "";
  }

  static Future setRememberUserNumber(String phoneNumber) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString(_rememberNumber, phoneNumber);
  }

  static Future removeRememberMeNumber() async {
    final instance = await SharedPreferences.getInstance();
    await instance.remove(_rememberNumber);
  }

  static Future<String> getAccessToken() async {
    final instance = await SharedPreferences.getInstance();
    final res = instance.getString(_appAccessToken);
    return res ?? "";
  }

  static Future setRefreshToken(String refreshToken) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString(_refresh_token, refreshToken);
  }

  static Future<String> getRefreshToken() async {
    final instance = await SharedPreferences.getInstance();
    final res = instance.getString(_refresh_token);
    return res ?? "";
  }

  static Future deleteAccessToken() async {
    final instance = await SharedPreferences.getInstance();
    await instance.remove(_appAccessToken);
    await instance.remove(_refresh_token);
  }

  static Future setBiometricLogin(bool status) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setBool(_biometricLogin, status);
  }

  static Future<bool?> getBiometricLogin() async {
    final instance = await SharedPreferences.getInstance();
    final res = instance.getBool(_biometricLogin);
    return res;
  }

  static Future removeBiometricLogin() async {
    final instance = await SharedPreferences.getInstance();
    await instance.remove(_biometricLogin);
  }

  static Future setDeviceUUID(String uuid) async {
    print(uuid);
    final instance = await SharedPreferences.getInstance();
    await instance.setString(_deviceUUID, uuid);
  }

  static Future deleteDeviceUUID() async {
    final instance = await SharedPreferences.getInstance();
    await instance.remove(_deviceUUID);
  }

  static Future getDeviceUUID() async {
    final instance = await SharedPreferences.getInstance();
    return instance.get(_deviceUUID);
  }
}
