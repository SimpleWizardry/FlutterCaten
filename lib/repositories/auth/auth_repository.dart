import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

import '../../generated/account.pbgrpc.dart';

class AccountTerminalClient {
  late final ClientChannel channel;
  late final AccountGRPCServiceClient stub;

  AccountTerminalClient() {
    channel = ClientChannel(
      'mmwork.caten-company.ru',
      // '95.181.48.150',
      // 'http://mmwork.caten-company.ru',
      //'5.34.125.182',
      // port: 43942,
      // port: 55020,
      port: 8080,
      // port: 32785,
      options: ChannelOptions(credentials: ChannelCredentials.insecure()),
      // options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    stub = AccountGRPCServiceClient(channel);
  }

  Future<LoginReply> login(LoginRequest req) async {
    // debugPrint('Sending request: $req');
    final response = await stub.login(req);
    // debugPrint('Received question: $response with token' + response.jwt);
    return response;
  }
}


// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// class LoginBody {
//   String Password = "12345";
//   bool RememberMe = false;
//   String Username = "pomogalov";
//   bool isViaDomain = false;
// }

// class AuthRepository {
//   final data = LoginBody();
//   // {
//   //   password: "12345",
//   //   RememberMe: false,
//   //   Username: "pomogalov",
//   //   isViaDomain: false
//   // }
//   Future<void> login() async {
//     final response = await Dio().post('https://work.caten-company.ru/api/account/login', data: data);
//     debugPrint(response.toString());
//   }
// }