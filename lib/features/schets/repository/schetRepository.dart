import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';

import '../services/schet.pbgrpc.dart';
import 'abstractSchetRepository.dart';

class SchetRepository implements AbstractSchetRepository {
  late final ClientChannel channel;
  late final SchetGRPCServiceClient stub;

  SchetRepository() {
    channel = ClientChannel(
      '192.168.1.12',
      port: 32769,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
      // options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    debugPrint('channel $channel');
    stub = SchetGRPCServiceClient(channel);
  }

  FilterSchet InitFilterSchet() {
    var filter = FilterSchet.create();
    filter.allOrders = true;
    filter.skip = 0;
    filter.take = 20;
    filter.showAll = true;
    filter.schet = true;
    filter.withChildDocs = false;
    filter.userId = "c5ad596e-0fc7-4afa-80e0-b3c979a4012c";
    return filter;
  }

  Future<ResultSchetListView> GetSchets(FilterSchet req) async {
    final response = await stub.getSchets(req);
    return response;
  }
}
