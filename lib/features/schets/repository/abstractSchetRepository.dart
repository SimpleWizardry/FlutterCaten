import '../services/schet.pb.dart';

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
}
