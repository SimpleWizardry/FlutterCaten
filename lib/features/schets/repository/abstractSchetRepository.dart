import '../../../generated/schet.pb.dart';
// import '../services/schet.pb.dart';

abstract class AbstractSchetRepository {
  Future<ResultSchetListView> GetSchets(FilterSchet req);
  Future<ResultSchetView> GetSchet(FilterSchet req);
  FilterSchet InitFilterSchet([Object? filterSchet]);
  FilterResourceSchet initFilterResourceSchet();
  FilterPaymentScheduleSchet initFilterPaymentScheduleSchet();
  Future<ResultResourceSchet> getResourcesSchet(FilterResourceSchet req);
  Future<ResultPaymentScheduleSchet> getPaymentSchedulesSchet(
      FilterPaymentScheduleSchet req);
  Future<ResultDownloadFile> DownloadFile(FileDTO req);
  Future<ResultChangeStatusSchet> ChangeStatusSchet(FilterChangeStatus req);
  Future<ResultService> RejectSchet(RejectSchetDTO req);

  Future<UserListReply> GetUsers(UserListRequest req);
  Future<UserListReply> GetCreators(UserListRequest req);
  Future<ContractListReply> GetContracts(ContractListRequest req);
  Future<CounterpartyListReply> GetCounterparties(CounterpartyListRequest req);
  Future<ProjectListReply> GetProjects(ProjectListRequest req);
}
