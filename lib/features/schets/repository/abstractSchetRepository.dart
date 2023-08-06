import '../services/schet.pb.dart';

abstract class AbstractSchetRepository {
  Future<ResultSchetListView> GetSchets(FilterSchet req);
  FilterSchet InitFilterSchet();
}
