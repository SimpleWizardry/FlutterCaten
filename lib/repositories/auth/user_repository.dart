import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../generated/account.pb.dart';

class UserRepository {
  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  final _storage = const FlutterSecureStorage();

  Future<User> getUser() async {
    final String? userString = await _storage.read(
      key: "user",
      aOptions: _getAndroidOptions(),
    );

    return User.fromJson(userString as String);
  }
}
