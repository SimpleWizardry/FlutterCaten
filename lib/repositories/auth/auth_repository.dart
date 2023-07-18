import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginBody {
  String Password = "12345";
  bool RememberMe = false;
  String Username = "pomogalov";
  bool isViaDomain = false;
}

class AuthRepository {
  final data = LoginBody();
  // {
  //   password: "12345",
  //   RememberMe: false,
  //   Username: "pomogalov",
  //   isViaDomain: false
  // }
  Future<void> login() async {
    final response = await Dio().post('https://work.caten-company.ru/api/account/login', data: data);
    debugPrint(response.toString());
  }
}