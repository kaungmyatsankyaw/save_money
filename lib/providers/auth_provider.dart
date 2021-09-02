import 'package:app/constant/valuse.dart';
import 'package:app/utility/prefer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthProvider extends ChangeNotifier {
  String authProvider = '';
  String profileUrl = '';
  bool isLogin = false;
  String userName = '';
  String phoneNumber = '';
  String email = '';
  LoginUser user = LoginUser(
      email: '',
      phoneNumber: '',
      profileUrl: '',
      username: '',
      isLogin: false,
      authProvider: '');

  // Getter & Setter User
  get getUser => user;
  setUser({required LoginUser us}) {
    user = us;
    notifyListeners();
  }

  AuthProvider() {
    getUserInfo();
  }

  /// Set UserInfo
  getUserInfo() async {
    var username =
        await Perferences.getPrefString(key: StringValues.userName) ?? '';
    var email =
        await Perferences.getPrefString(key: StringValues.userEmail) ?? '';
    var phone =
        await Perferences.getPrefString(key: StringValues.userPhone) ?? '';
    var profileUrl =
        await Perferences.getPrefString(key: StringValues.profileUrl) ??
            'https://via.placeholder.com/150';
    var isLogin =
        await Perferences.getPrefBool(key: StringValues.userIsLogin) ?? false;
    var authProvider =
        await Perferences.getPrefString(key: StringValues.userAuthProvider) ??
            '';

    LoginUser us = LoginUser(
        username: username,
        profileUrl: profileUrl,
        phoneNumber: phone,
        email: email,
        isLogin: isLogin,
        authProvider: authProvider);

    setUser(us: us);
  }

  saveUserInfo(
      {required String username,
      required String profileUrl,
      required String phone,
      required String email,
      required bool isLogin,
      required String authProvider}) async {
    await Perferences.setPrefString(
        key: StringValues.userName, value: username);
    await Perferences.setPrefString(
        key: StringValues.profileUrl, value: profileUrl);
    await Perferences.setPrefString(key: StringValues.userPhone, value: phone);
    await Perferences.setPrefString(key: StringValues.userEmail, value: email);
    await Perferences.setPrefBool(
        key: StringValues.userIsLogin, value: isLogin);
    await Perferences.setPrefString(
        key: StringValues.userAuthProvider, value: authProvider);

    LoginUser us = LoginUser(
        username: username,
        profileUrl: profileUrl,
        phoneNumber: phone,
        email: email,
        isLogin: isLogin,
        authProvider: authProvider);

    setUser(us: us);
    Get.back();
  }

// Getter & Setter AuthProvider
  get getAuthProvider => authProvider;
  setAuthProvider({required String prov}) {
    authProvider = prov;
    notifyListeners();
  }

  // Getter & Setter Email
  get getEmail => email;
  setEmail({required String mail}) {
    email = mail;
    notifyListeners();
  }

  get getProfileUrl => profileUrl;

  setProfileUrl({required String url}) {
    profileUrl = url;
    notifyListeners();
  }

  // Getter & Setter isLogin
  get getIsLogin => isLogin;
  setIsLogin({required bool bl}) {
    isLogin = bl;
    notifyListeners();
  }

  // Getter & Setter Username
  get getUsername => userName;
  setUserName({required String name}) {
    userName = name;
    notifyListeners();
  }

  // Getter & Setter PhoneNumber
  getPhoneNumber() async {
    return Perferences.getPrefString(key: StringValues.userPhone);
  }

  setPhoneNumber({required String phone}) {
    phoneNumber = phone;
    notifyListeners();
  }
}

class LoginUser {
  late String username;
  late String profileUrl;
  late String phoneNumber;
  bool isLogin;
  late String email;
  late String authProvider;

  LoginUser(
      {required this.username,
      this.profileUrl = 'https://via.placeholder.com/150',
      required this.phoneNumber,
      required this.email,
      this.isLogin = false,
      required this.authProvider});
}
