import 'package:flutter/cupertino.dart';
import 'package:grpc/grpc.dart';

// import '../services/schet.pbgrpc.dart';
import '../../../generated/schet.pbgrpc.dart';
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
    // filter.allOrders = true;
    filter.skip = 0;
    filter.take = 20;
    // filter.showAll = true;
    // filter.schet = true;
    // filter.withChildDocs = false;
    // filter.userId = "c5ad596e-0fc7-4afa-80e0-b3c979a4012c";
    return filter;
  }

  Future<ResultSchetListView> GetSchets(FilterSchet req) async {
    final response = await stub.getSchets(req);
    return response;
  }

  Future<UserListReply> GetUsers(UserListRequest req) async {
    final response = await stub.getUsers(req);
    return response;
  }

  Future<UserListReply> GetCreators(UserListRequest req) async {
    final response = await stub.getCreators(req);
    return response;
  }

  Future<ContractListReply> GetContracts(ContractListRequest req) async {
    final response = await stub.getContracts(req);
    return response;
  }

  Future<CounterpartyListReply> GetCounterparties(CounterpartyListRequest req) async {
    final response = await stub.getCounterparties(req);
    return response;
  }

  Future<ProjectListReply> GetProjects(ProjectListRequest req) async {
    final response = await stub.getProjects(req);
    return response;
  }

  Future<ResultSchetView> GetSchet(FilterSchet req) async {
    final response = await stub.getSchet(req);
    return response;
  }

  Future<ResultChangeStatusSchet> ChangeStatusSchet(FilterChangeStatus req) async {
    final response = await stub.changeStatusSchet(req);
    return response;
  }

  Future<ResultResourceSchet> GetResourcesSchet(FilterResourceSchet req) async {
    final response = await stub.getResourcesSchet(req);
    return response;
  }

  Future<ResultPaymentScheduleSchet> GetPaymentSchedulesSchet(FilterPaymentScheduleSchet req) async {
    final response = await stub.getPaymentSchedulesSchet(req);
    return response;
  }

  Future<ResultDownloadFile> DownloadFile(FileDTO req) async {
    final response = await stub.downloadFile(req);
    return response;
  }

  Future<ResultService> RejectSchet(RejectSchetDTO req) async {
    final response = await stub.rejectSchet(req);
    return response;
  }

}
