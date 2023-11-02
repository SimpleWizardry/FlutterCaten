// import '../services/schet.pb.dart';
import '../../../generated/schet.pb.dart';

abstract class AbstractSchetRepository {
  Future<ResultSchetListView> GetSchets(FilterSchet req);
  Future<UserListReply> GetUsers(UserListRequest req);
  Future<UserListReply> GetCreators(UserListRequest req);
  Future<ContractListReply> GetContracts(ContractListRequest req);
  Future<CounterpartyListReply> GetCounterparties(CounterpartyListRequest req);
  Future<ProjectListReply> GetProjects(ProjectListRequest req);
  FilterSchet InitFilterSchet();

  Future<ResultSchetView> GetSchet(FilterSchet req);
  Future<ResultChangeStatusSchet> ChangeStatusSchet(FilterChangeStatus req);
  Future<ResultResourceSchet> GetResourcesSchet(FilterResourceSchet req);
  Future<ResultPaymentScheduleSchet> GetPaymentSchedulesSchet(FilterPaymentScheduleSchet req);
  Future<ResultDownloadFile> DownloadFile(FileDTO req);
  Future<ResultService> RejectSchet(RejectSchetDTO req);
}
