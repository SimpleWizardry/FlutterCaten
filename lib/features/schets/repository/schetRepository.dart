import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';

import '../services/schet.pbgrpc.dart';
import 'abstractSchetRepository.dart';

class SchetRepository implements AbstractSchetRepository {
  late final ClientChannel channel;
  late final SchetGRPCServiceClient stub;

  SchetRepository() {
    channel = ClientChannel(
      '192.168.137.142',
      port: 32777,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
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
    debugPrint('File: ${response}');
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
    debugPrint('File: ${req}');
    debugPrint('File: ${response}');

    return response;
  }

  Future<ResultChangeStatusSchet> ChangeStatusSchet(
      FilterChangeStatus req) async {
    final response = await stub.changeStatusSchet(req);
    return response;
  }

  Future<ResultService> RejectSchet(RejectSchetDTO req) async {
    final response = await stub.rejectSchet(req);
    return response;
  }
}
