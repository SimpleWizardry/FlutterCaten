import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';

import '../services/schet.pbgrpc.dart';

class SchetTerminalClient {
  late final ClientChannel channel;
  late final SchetGRPCServiceClient stub;

  SchetTerminalClient() {
    channel = ClientChannel(
      '0.0.0.0',
      port: 80,
      options: ChannelOptions(credentials: ChannelCredentials.insecure()),
      // options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    stub = SchetGRPCServiceClient(channel);
  }

  FilterSchet InitFilterSchet() {
    var filter = FilterSchet.create();
    filter.allOrders = true;
    filter.skip = 0;
    filter.take = 10;
    filter.showAll = true;
    filter.schet = true;
    filter.withChildDocs = false;
    filter.userId = "c5ad596e-0fc7-4afa-80e0-b3c979a4012c";
    return filter;
  }

  Future<ResultSchetListView> GetSchets(FilterSchet req) async {
    debugPrint('Received question: $req with token');
    final response = await stub.getSchets(req);
    debugPrint('Received question: $response with token');
    return response;
  }
}
