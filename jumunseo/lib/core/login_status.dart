import 'package:flutter/material.dart';

class LoginStatus {
  static ValueNotifier<String> name = ValueNotifier<String>('');
  static String imageUrl = '';
  static bool isLogin = false;
  static bool isGeust = false;
  static bool joining = false;
  static bool signining = false;
  //static String accessToken = "";
  //static String refreshToken = "";
}
