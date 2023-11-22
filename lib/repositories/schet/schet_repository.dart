import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';

import '../../features/schets/services/schet.pbgrpc.dart';

class SchetTerminalClient {
  late final ClientChannel channel;
  late final SchetGRPCServiceClient stub;

  SchetTerminalClient() {
    channel = ClientChannel(
      'http://mmwork.caten-company.ru',
      port: 8080,
      options: ChannelOptions(credentials: ChannelCredentials.insecure()),
      // options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    stub = SchetGRPCServiceClient(channel);
  }

  Future<ResultSchetListView> getSchets(FilterSchet req) async {
    debugPrint('Sending request: $req');
    final response = await stub.getSchets(req);
    debugPrint(response.toString());
    return response;
  }
}
