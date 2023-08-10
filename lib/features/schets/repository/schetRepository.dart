import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';

import '../services/schet.pbgrpc.dart';
import 'abstractSchetRepository.dart';

class SchetRepository implements AbstractSchetRepository {
  late final ClientChannel channel;
  late final SchetGRPCServiceClient stub;

  SchetRepository() {
    channel = ClientChannel(
      '192.168.136.31',
      port: 32769,
      options: ChannelOptions(credentials: ChannelCredentials.insecure()),
      // options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    debugPrint('channel $channel');
    stub = SchetGRPCServiceClient(channel);
  }

  FilterSchet InitFilterSchet([Object? filterSchet]) {
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

  FilterResourceSchet initFilterResourceSchet() {
    var filter = FilterResourceSchet.create();
    filter.skip = 0;
    filter.take = 20;
    return filter;
  }

  FilterPaymentScheduleSchet initFilterPaymentScheduleSchet() {
    var filter = FilterPaymentScheduleSchet.create();
    filter.skip = 0;
    filter.take = 20;
    return filter;
  }

  Future<ResultSchetListView> GetSchets(FilterSchet req) async {
    final response = await stub.getSchets(req);
    return response;
  }

  Future<ResultSchetView> GetSchet(FilterSchet req) async {
    final response = await stub.getSchet(req);
    debugPrint('res ${response}');
    return response;
  }

  Future<ResultResourceSchet> getResourcesSchet(FilterResourceSchet req) async {
    final response = await stub.getResourcesSchet(req);
    return response;
  }

  Future<ResultPaymentScheduleSchet> getPaymentSchedulesSchet(
      FilterPaymentScheduleSchet req) async {
    final response = await stub.getPaymentSchedulesSchet(req);
    return response;
  }

  Future<ResultDownloadFile> DownloadFile(FileDTO req) async {
    final response = await stub.downloadFile(req);
    debugPrint('File: ${response}');

    return response;
  }
}
