//
//  Generated code. Do not modify.
//  source: schet.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResultSchetListView extends $pb.GeneratedMessage {
  factory ResultSchetListView() => create();
  ResultSchetListView._() : super();
  factory ResultSchetListView.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResultSchetListView.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResultSchetListView', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..pc<SchetListView>(1, _omitFieldNames ? '' : 'List', $pb.PbFieldType.PM, protoName: 'List', subBuilder: SchetListView.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'Count', $pb.PbFieldType.O3, protoName: 'Count')
    ..aOB(3, _omitFieldNames ? '' : 'Succssed', protoName: 'Succssed')
    ..aOS(4, _omitFieldNames ? '' : 'Message', protoName: 'Message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResultSchetListView clone() => ResultSchetListView()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResultSchetListView copyWith(void Function(ResultSchetListView) updates) => super.copyWith((message) => updates(message as ResultSchetListView)) as ResultSchetListView;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResultSchetListView create() => ResultSchetListView._();
  ResultSchetListView createEmptyInstance() => create();
  static $pb.PbList<ResultSchetListView> createRepeated() => $pb.PbList<ResultSchetListView>();
  @$core.pragma('dart2js:noInline')
  static ResultSchetListView getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResultSchetListView>(create);
  static ResultSchetListView? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<SchetListView> get list => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get count => $_getIZ(1);
  @$pb.TagNumber(2)
  set count($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get succssed => $_getBF(2);
  @$pb.TagNumber(3)
  set succssed($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSuccssed() => $_has(2);
  @$pb.TagNumber(3)
  void clearSuccssed() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get message => $_getSZ(3);
  @$pb.TagNumber(4)
  set message($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => clearField(4);
}

class ResultSchetView extends $pb.GeneratedMessage {
  factory ResultSchetView() => create();
  ResultSchetView._() : super();
  factory ResultSchetView.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResultSchetView.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResultSchetView', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOM<SchetView>(1, _omitFieldNames ? '' : 'Schet', protoName: 'Schet', subBuilder: SchetView.create)
    ..aOB(2, _omitFieldNames ? '' : 'Succssed', protoName: 'Succssed')
    ..aOS(3, _omitFieldNames ? '' : 'Message', protoName: 'Message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResultSchetView clone() => ResultSchetView()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResultSchetView copyWith(void Function(ResultSchetView) updates) => super.copyWith((message) => updates(message as ResultSchetView)) as ResultSchetView;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResultSchetView create() => ResultSchetView._();
  ResultSchetView createEmptyInstance() => create();
  static $pb.PbList<ResultSchetView> createRepeated() => $pb.PbList<ResultSchetView>();
  @$core.pragma('dart2js:noInline')
  static ResultSchetView getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResultSchetView>(create);
  static ResultSchetView? _defaultInstance;

  @$pb.TagNumber(1)
  SchetView get schet => $_getN(0);
  @$pb.TagNumber(1)
  set schet(SchetView v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSchet() => $_has(0);
  @$pb.TagNumber(1)
  void clearSchet() => clearField(1);
  @$pb.TagNumber(1)
  SchetView ensureSchet() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.bool get succssed => $_getBF(1);
  @$pb.TagNumber(2)
  set succssed($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccssed() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccssed() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);
}

class FilterSchet extends $pb.GeneratedMessage {
  factory FilterSchet() => create();
  FilterSchet._() : super();
  factory FilterSchet.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FilterSchet.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FilterSchet', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'AllOrders', protoName: 'AllOrders')
    ..pPS(2, _omitFieldNames ? '' : 'BudgetIds', protoName: 'BudgetIds')
    ..pPS(3, _omitFieldNames ? '' : 'DocumentId', protoName: 'DocumentId')
    ..aOS(4, _omitFieldNames ? '' : 'MatchingStatus', protoName: 'MatchingStatus')
    ..pPS(5, _omitFieldNames ? '' : 'Messages', protoName: 'Messages')
    ..aOB(6, _omitFieldNames ? '' : 'Schet', protoName: 'Schet')
    ..pPS(7, _omitFieldNames ? '' : 'SchetStatus', protoName: 'SchetStatus')
    ..aOB(8, _omitFieldNames ? '' : 'ShowAll', protoName: 'ShowAll')
    ..aOB(9, _omitFieldNames ? '' : 'ShowFromContract', protoName: 'ShowFromContract')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'Skip', $pb.PbFieldType.O3, protoName: 'Skip')
    ..a<$core.int>(11, _omitFieldNames ? '' : 'Take', $pb.PbFieldType.O3, protoName: 'Take')
    ..aOS(12, _omitFieldNames ? '' : 'UserId', protoName: 'UserId')
    ..aOB(13, _omitFieldNames ? '' : 'WithChildDocs', protoName: 'WithChildDocs')
    ..aOS(14, _omitFieldNames ? '' : 'Id', protoName: 'Id')
    ..aOS(15, _omitFieldNames ? '' : 'NomenclatureName', protoName: 'NomenclatureName')
    ..aOS(16, _omitFieldNames ? '' : 'ContractId', protoName: 'ContractId')
    ..aOS(17, _omitFieldNames ? '' : 'DateFrom', protoName: 'DateFrom')
    ..aOS(18, _omitFieldNames ? '' : 'DateTo', protoName: 'DateTo')
    ..aOS(19, _omitFieldNames ? '' : 'PayingOrganizationId', protoName: 'PayingOrganizationId')
    ..aOS(20, _omitFieldNames ? '' : 'ApplicationUserId', protoName: 'ApplicationUserId')
    ..aOS(21, _omitFieldNames ? '' : 'DirectoryCounterpartiesId', protoName: 'DirectoryCounterpartiesId')
    ..aOS(22, _omitFieldNames ? '' : 'NumberSchet', protoName: 'NumberSchet')
    ..aOS(23, _omitFieldNames ? '' : 'Description', protoName: 'Description')
    ..aOS(24, _omitFieldNames ? '' : 'NumberTTNOrOrder', protoName: 'NumberTTNOrOrder')
    ..a<$core.double>(25, _omitFieldNames ? '' : 'SummaMin', $pb.PbFieldType.OD, protoName: 'SummaMin')
    ..a<$core.double>(26, _omitFieldNames ? '' : 'SummaMax', $pb.PbFieldType.OD, protoName: 'SummaMax')
    ..aOS(27, _omitFieldNames ? '' : 'NumberPayment', protoName: 'NumberPayment')
    ..a<$core.int>(28, _omitFieldNames ? '' : 'PaymentCheck', $pb.PbFieldType.O3, protoName: 'PaymentCheck')
    ..aOS(29, _omitFieldNames ? '' : 'WarehouseId', protoName: 'WarehouseId')
    ..aOS(30, _omitFieldNames ? '' : 'SetUserId', protoName: 'SetUserId')
    ..aOS(31, _omitFieldNames ? '' : 'ResourceId', protoName: 'ResourceId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FilterSchet clone() => FilterSchet()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FilterSchet copyWith(void Function(FilterSchet) updates) => super.copyWith((message) => updates(message as FilterSchet)) as FilterSchet;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FilterSchet create() => FilterSchet._();
  FilterSchet createEmptyInstance() => create();
  static $pb.PbList<FilterSchet> createRepeated() => $pb.PbList<FilterSchet>();
  @$core.pragma('dart2js:noInline')
  static FilterSchet getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FilterSchet>(create);
  static FilterSchet? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get allOrders => $_getBF(0);
  @$pb.TagNumber(1)
  set allOrders($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAllOrders() => $_has(0);
  @$pb.TagNumber(1)
  void clearAllOrders() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get budgetIds => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.String> get documentId => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get matchingStatus => $_getSZ(3);
  @$pb.TagNumber(4)
  set matchingStatus($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMatchingStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearMatchingStatus() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get messages => $_getList(4);

  @$pb.TagNumber(6)
  $core.bool get schet => $_getBF(5);
  @$pb.TagNumber(6)
  set schet($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSchet() => $_has(5);
  @$pb.TagNumber(6)
  void clearSchet() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.String> get schetStatus => $_getList(6);

  @$pb.TagNumber(8)
  $core.bool get showAll => $_getBF(7);
  @$pb.TagNumber(8)
  set showAll($core.bool v) { $_setBool(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasShowAll() => $_has(7);
  @$pb.TagNumber(8)
  void clearShowAll() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get showFromContract => $_getBF(8);
  @$pb.TagNumber(9)
  set showFromContract($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasShowFromContract() => $_has(8);
  @$pb.TagNumber(9)
  void clearShowFromContract() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get skip => $_getIZ(9);
  @$pb.TagNumber(10)
  set skip($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSkip() => $_has(9);
  @$pb.TagNumber(10)
  void clearSkip() => clearField(10);

  @$pb.TagNumber(11)
  $core.int get take => $_getIZ(10);
  @$pb.TagNumber(11)
  set take($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasTake() => $_has(10);
  @$pb.TagNumber(11)
  void clearTake() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get userId => $_getSZ(11);
  @$pb.TagNumber(12)
  set userId($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasUserId() => $_has(11);
  @$pb.TagNumber(12)
  void clearUserId() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get withChildDocs => $_getBF(12);
  @$pb.TagNumber(13)
  set withChildDocs($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasWithChildDocs() => $_has(12);
  @$pb.TagNumber(13)
  void clearWithChildDocs() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get id => $_getSZ(13);
  @$pb.TagNumber(14)
  set id($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasId() => $_has(13);
  @$pb.TagNumber(14)
  void clearId() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get nomenclatureName => $_getSZ(14);
  @$pb.TagNumber(15)
  set nomenclatureName($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasNomenclatureName() => $_has(14);
  @$pb.TagNumber(15)
  void clearNomenclatureName() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get contractId => $_getSZ(15);
  @$pb.TagNumber(16)
  set contractId($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasContractId() => $_has(15);
  @$pb.TagNumber(16)
  void clearContractId() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get dateFrom => $_getSZ(16);
  @$pb.TagNumber(17)
  set dateFrom($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasDateFrom() => $_has(16);
  @$pb.TagNumber(17)
  void clearDateFrom() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get dateTo => $_getSZ(17);
  @$pb.TagNumber(18)
  set dateTo($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasDateTo() => $_has(17);
  @$pb.TagNumber(18)
  void clearDateTo() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get payingOrganizationId => $_getSZ(18);
  @$pb.TagNumber(19)
  set payingOrganizationId($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasPayingOrganizationId() => $_has(18);
  @$pb.TagNumber(19)
  void clearPayingOrganizationId() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get applicationUserId => $_getSZ(19);
  @$pb.TagNumber(20)
  set applicationUserId($core.String v) { $_setString(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasApplicationUserId() => $_has(19);
  @$pb.TagNumber(20)
  void clearApplicationUserId() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get directoryCounterpartiesId => $_getSZ(20);
  @$pb.TagNumber(21)
  set directoryCounterpartiesId($core.String v) { $_setString(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasDirectoryCounterpartiesId() => $_has(20);
  @$pb.TagNumber(21)
  void clearDirectoryCounterpartiesId() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get numberSchet => $_getSZ(21);
  @$pb.TagNumber(22)
  set numberSchet($core.String v) { $_setString(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasNumberSchet() => $_has(21);
  @$pb.TagNumber(22)
  void clearNumberSchet() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get description => $_getSZ(22);
  @$pb.TagNumber(23)
  set description($core.String v) { $_setString(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasDescription() => $_has(22);
  @$pb.TagNumber(23)
  void clearDescription() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get numberTTNOrOrder => $_getSZ(23);
  @$pb.TagNumber(24)
  set numberTTNOrOrder($core.String v) { $_setString(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasNumberTTNOrOrder() => $_has(23);
  @$pb.TagNumber(24)
  void clearNumberTTNOrOrder() => clearField(24);

  @$pb.TagNumber(25)
  $core.double get summaMin => $_getN(24);
  @$pb.TagNumber(25)
  set summaMin($core.double v) { $_setDouble(24, v); }
  @$pb.TagNumber(25)
  $core.bool hasSummaMin() => $_has(24);
  @$pb.TagNumber(25)
  void clearSummaMin() => clearField(25);

  @$pb.TagNumber(26)
  $core.double get summaMax => $_getN(25);
  @$pb.TagNumber(26)
  set summaMax($core.double v) { $_setDouble(25, v); }
  @$pb.TagNumber(26)
  $core.bool hasSummaMax() => $_has(25);
  @$pb.TagNumber(26)
  void clearSummaMax() => clearField(26);

  @$pb.TagNumber(27)
  $core.String get numberPayment => $_getSZ(26);
  @$pb.TagNumber(27)
  set numberPayment($core.String v) { $_setString(26, v); }
  @$pb.TagNumber(27)
  $core.bool hasNumberPayment() => $_has(26);
  @$pb.TagNumber(27)
  void clearNumberPayment() => clearField(27);

  @$pb.TagNumber(28)
  $core.int get paymentCheck => $_getIZ(27);
  @$pb.TagNumber(28)
  set paymentCheck($core.int v) { $_setSignedInt32(27, v); }
  @$pb.TagNumber(28)
  $core.bool hasPaymentCheck() => $_has(27);
  @$pb.TagNumber(28)
  void clearPaymentCheck() => clearField(28);

  @$pb.TagNumber(29)
  $core.String get warehouseId => $_getSZ(28);
  @$pb.TagNumber(29)
  set warehouseId($core.String v) { $_setString(28, v); }
  @$pb.TagNumber(29)
  $core.bool hasWarehouseId() => $_has(28);
  @$pb.TagNumber(29)
  void clearWarehouseId() => clearField(29);

  @$pb.TagNumber(30)
  $core.String get setUserId => $_getSZ(29);
  @$pb.TagNumber(30)
  set setUserId($core.String v) { $_setString(29, v); }
  @$pb.TagNumber(30)
  $core.bool hasSetUserId() => $_has(29);
  @$pb.TagNumber(30)
  void clearSetUserId() => clearField(30);

  @$pb.TagNumber(31)
  $core.String get resourceId => $_getSZ(30);
  @$pb.TagNumber(31)
  set resourceId($core.String v) { $_setString(30, v); }
  @$pb.TagNumber(31)
  $core.bool hasResourceId() => $_has(30);
  @$pb.TagNumber(31)
  void clearResourceId() => clearField(31);
}

class SchetListView extends $pb.GeneratedMessage {
  factory SchetListView() => create();
  SchetListView._() : super();
  factory SchetListView.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SchetListView.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SchetListView', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Id', protoName: 'Id')
    ..aOS(2, _omitFieldNames ? '' : 'CounterpartyName', protoName: 'CounterpartyName')
    ..pc<ObjectAccountSchet>(3, _omitFieldNames ? '' : 'ObjectsAccountSchets', $pb.PbFieldType.PM, protoName: 'ObjectsAccountSchets', subBuilder: ObjectAccountSchet.create)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'Summa', $pb.PbFieldType.OD, protoName: 'Summa')
    ..aOS(5, _omitFieldNames ? '' : 'Date', protoName: 'Date')
    ..aOS(6, _omitFieldNames ? '' : 'Number', protoName: 'Number')
    ..aOS(7, _omitFieldNames ? '' : 'Description', protoName: 'Description')
    ..aOM<StatusSchetDTO>(8, _omitFieldNames ? '' : 'Status', protoName: 'Status', subBuilder: StatusSchetDTO.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SchetListView clone() => SchetListView()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SchetListView copyWith(void Function(SchetListView) updates) => super.copyWith((message) => updates(message as SchetListView)) as SchetListView;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SchetListView create() => SchetListView._();
  SchetListView createEmptyInstance() => create();
  static $pb.PbList<SchetListView> createRepeated() => $pb.PbList<SchetListView>();
  @$core.pragma('dart2js:noInline')
  static SchetListView getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SchetListView>(create);
  static SchetListView? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get counterpartyName => $_getSZ(1);
  @$pb.TagNumber(2)
  set counterpartyName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCounterpartyName() => $_has(1);
  @$pb.TagNumber(2)
  void clearCounterpartyName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<ObjectAccountSchet> get objectsAccountSchets => $_getList(2);

  @$pb.TagNumber(4)
  $core.double get summa => $_getN(3);
  @$pb.TagNumber(4)
  set summa($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSumma() => $_has(3);
  @$pb.TagNumber(4)
  void clearSumma() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get date => $_getSZ(4);
  @$pb.TagNumber(5)
  set date($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearDate() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get number => $_getSZ(5);
  @$pb.TagNumber(6)
  set number($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNumber() => $_has(5);
  @$pb.TagNumber(6)
  void clearNumber() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get description => $_getSZ(6);
  @$pb.TagNumber(7)
  set description($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDescription() => $_has(6);
  @$pb.TagNumber(7)
  void clearDescription() => clearField(7);

  @$pb.TagNumber(8)
  StatusSchetDTO get status => $_getN(7);
  @$pb.TagNumber(8)
  set status(StatusSchetDTO v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => clearField(8);
  @$pb.TagNumber(8)
  StatusSchetDTO ensureStatus() => $_ensure(7);
}

class ObjectAccountSchet extends $pb.GeneratedMessage {
  factory ObjectAccountSchet() => create();
  ObjectAccountSchet._() : super();
  factory ObjectAccountSchet.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ObjectAccountSchet.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ObjectAccountSchet', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Id', protoName: 'Id')
    ..aOS(2, _omitFieldNames ? '' : 'Name', protoName: 'Name')
    ..aOS(3, _omitFieldNames ? '' : 'Type', protoName: 'Type')
    ..aOS(4, _omitFieldNames ? '' : 'UserId', protoName: 'UserId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ObjectAccountSchet clone() => ObjectAccountSchet()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ObjectAccountSchet copyWith(void Function(ObjectAccountSchet) updates) => super.copyWith((message) => updates(message as ObjectAccountSchet)) as ObjectAccountSchet;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ObjectAccountSchet create() => ObjectAccountSchet._();
  ObjectAccountSchet createEmptyInstance() => create();
  static $pb.PbList<ObjectAccountSchet> createRepeated() => $pb.PbList<ObjectAccountSchet>();
  @$core.pragma('dart2js:noInline')
  static ObjectAccountSchet getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ObjectAccountSchet>(create);
  static ObjectAccountSchet? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get userId => $_getSZ(3);
  @$pb.TagNumber(4)
  set userId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearUserId() => clearField(4);
}

class SchetView extends $pb.GeneratedMessage {
  factory SchetView() => create();
  SchetView._() : super();
  factory SchetView.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SchetView.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SchetView', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Id', protoName: 'Id')
    ..aOS(2, _omitFieldNames ? '' : 'CounterpartyName', protoName: 'CounterpartyName')
    ..pc<ObjectAccountSchet>(3, _omitFieldNames ? '' : 'ObjectsAccountSchets', $pb.PbFieldType.PM, protoName: 'ObjectsAccountSchets', subBuilder: ObjectAccountSchet.create)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'Summa', $pb.PbFieldType.OD, protoName: 'Summa')
    ..aOS(5, _omitFieldNames ? '' : 'Date', protoName: 'Date')
    ..aOS(6, _omitFieldNames ? '' : 'Number', protoName: 'Number')
    ..aOS(7, _omitFieldNames ? '' : 'PayingOrganizationName', protoName: 'PayingOrganizationName')
    ..aOS(8, _omitFieldNames ? '' : 'CreaterName', protoName: 'CreaterName')
    ..aOS(9, _omitFieldNames ? '' : 'Description', protoName: 'Description')
    ..aOM<File>(10, _omitFieldNames ? '' : 'File', protoName: 'File', subBuilder: File.create)
    ..aOM<StatusSchetDTO>(11, _omitFieldNames ? '' : 'Status', protoName: 'Status', subBuilder: StatusSchetDTO.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SchetView clone() => SchetView()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SchetView copyWith(void Function(SchetView) updates) => super.copyWith((message) => updates(message as SchetView)) as SchetView;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SchetView create() => SchetView._();
  SchetView createEmptyInstance() => create();
  static $pb.PbList<SchetView> createRepeated() => $pb.PbList<SchetView>();
  @$core.pragma('dart2js:noInline')
  static SchetView getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SchetView>(create);
  static SchetView? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get counterpartyName => $_getSZ(1);
  @$pb.TagNumber(2)
  set counterpartyName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCounterpartyName() => $_has(1);
  @$pb.TagNumber(2)
  void clearCounterpartyName() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<ObjectAccountSchet> get objectsAccountSchets => $_getList(2);

  @$pb.TagNumber(4)
  $core.double get summa => $_getN(3);
  @$pb.TagNumber(4)
  set summa($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSumma() => $_has(3);
  @$pb.TagNumber(4)
  void clearSumma() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get date => $_getSZ(4);
  @$pb.TagNumber(5)
  set date($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearDate() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get number => $_getSZ(5);
  @$pb.TagNumber(6)
  set number($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasNumber() => $_has(5);
  @$pb.TagNumber(6)
  void clearNumber() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get payingOrganizationName => $_getSZ(6);
  @$pb.TagNumber(7)
  set payingOrganizationName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasPayingOrganizationName() => $_has(6);
  @$pb.TagNumber(7)
  void clearPayingOrganizationName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get createrName => $_getSZ(7);
  @$pb.TagNumber(8)
  set createrName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasCreaterName() => $_has(7);
  @$pb.TagNumber(8)
  void clearCreaterName() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get description => $_getSZ(8);
  @$pb.TagNumber(9)
  set description($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasDescription() => $_has(8);
  @$pb.TagNumber(9)
  void clearDescription() => clearField(9);

  @$pb.TagNumber(10)
  File get file => $_getN(9);
  @$pb.TagNumber(10)
  set file(File v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasFile() => $_has(9);
  @$pb.TagNumber(10)
  void clearFile() => clearField(10);
  @$pb.TagNumber(10)
  File ensureFile() => $_ensure(9);

  @$pb.TagNumber(11)
  StatusSchetDTO get status => $_getN(10);
  @$pb.TagNumber(11)
  set status(StatusSchetDTO v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasStatus() => $_has(10);
  @$pb.TagNumber(11)
  void clearStatus() => clearField(11);
  @$pb.TagNumber(11)
  StatusSchetDTO ensureStatus() => $_ensure(10);
}

class File extends $pb.GeneratedMessage {
  factory File() => create();
  File._() : super();
  factory File.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory File.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'File', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Id', protoName: 'Id')
    ..aOS(2, _omitFieldNames ? '' : 'Path', protoName: 'Path')
    ..aOS(3, _omitFieldNames ? '' : 'Name', protoName: 'Name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  File clone() => File()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  File copyWith(void Function(File) updates) => super.copyWith((message) => updates(message as File)) as File;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static File create() => File._();
  File createEmptyInstance() => create();
  static $pb.PbList<File> createRepeated() => $pb.PbList<File>();
  @$core.pragma('dart2js:noInline')
  static File getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<File>(create);
  static File? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get path => $_getSZ(1);
  @$pb.TagNumber(2)
  set path($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPath() => $_has(1);
  @$pb.TagNumber(2)
  void clearPath() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);
}

class StatusSchetDTO extends $pb.GeneratedMessage {
  factory StatusSchetDTO() => create();
  StatusSchetDTO._() : super();
  factory StatusSchetDTO.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StatusSchetDTO.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StatusSchetDTO', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Name', protoName: 'Name')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'Number', $pb.PbFieldType.O3, protoName: 'Number')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StatusSchetDTO clone() => StatusSchetDTO()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StatusSchetDTO copyWith(void Function(StatusSchetDTO) updates) => super.copyWith((message) => updates(message as StatusSchetDTO)) as StatusSchetDTO;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StatusSchetDTO create() => StatusSchetDTO._();
  StatusSchetDTO createEmptyInstance() => create();
  static $pb.PbList<StatusSchetDTO> createRepeated() => $pb.PbList<StatusSchetDTO>();
  @$core.pragma('dart2js:noInline')
  static StatusSchetDTO getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StatusSchetDTO>(create);
  static StatusSchetDTO? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get number => $_getIZ(1);
  @$pb.TagNumber(2)
  set number($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumber() => clearField(2);
}

class FilterChangeStatus extends $pb.GeneratedMessage {
  factory FilterChangeStatus() => create();
  FilterChangeStatus._() : super();
  factory FilterChangeStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FilterChangeStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FilterChangeStatus', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SchetId', protoName: 'SchetId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'Number', $pb.PbFieldType.O3, protoName: 'Number')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FilterChangeStatus clone() => FilterChangeStatus()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FilterChangeStatus copyWith(void Function(FilterChangeStatus) updates) => super.copyWith((message) => updates(message as FilterChangeStatus)) as FilterChangeStatus;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FilterChangeStatus create() => FilterChangeStatus._();
  FilterChangeStatus createEmptyInstance() => create();
  static $pb.PbList<FilterChangeStatus> createRepeated() => $pb.PbList<FilterChangeStatus>();
  @$core.pragma('dart2js:noInline')
  static FilterChangeStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FilterChangeStatus>(create);
  static FilterChangeStatus? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get schetId => $_getSZ(0);
  @$pb.TagNumber(1)
  set schetId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSchetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSchetId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get number => $_getIZ(1);
  @$pb.TagNumber(2)
  set number($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumber() => clearField(2);
}

class ResultChangeStatusSchet extends $pb.GeneratedMessage {
  factory ResultChangeStatusSchet() => create();
  ResultChangeStatusSchet._() : super();
  factory ResultChangeStatusSchet.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResultChangeStatusSchet.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResultChangeStatusSchet', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'Succssed', protoName: 'Succssed')
    ..aOM<StatusSchetDTO>(2, _omitFieldNames ? '' : 'Status', protoName: 'Status', subBuilder: StatusSchetDTO.create)
    ..aOS(3, _omitFieldNames ? '' : 'messageServer', protoName: 'messageServer')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResultChangeStatusSchet clone() => ResultChangeStatusSchet()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResultChangeStatusSchet copyWith(void Function(ResultChangeStatusSchet) updates) => super.copyWith((message) => updates(message as ResultChangeStatusSchet)) as ResultChangeStatusSchet;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResultChangeStatusSchet create() => ResultChangeStatusSchet._();
  ResultChangeStatusSchet createEmptyInstance() => create();
  static $pb.PbList<ResultChangeStatusSchet> createRepeated() => $pb.PbList<ResultChangeStatusSchet>();
  @$core.pragma('dart2js:noInline')
  static ResultChangeStatusSchet getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResultChangeStatusSchet>(create);
  static ResultChangeStatusSchet? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get succssed => $_getBF(0);
  @$pb.TagNumber(1)
  set succssed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccssed() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccssed() => clearField(1);

  @$pb.TagNumber(2)
  StatusSchetDTO get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(StatusSchetDTO v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);
  @$pb.TagNumber(2)
  StatusSchetDTO ensureStatus() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get messageServer => $_getSZ(2);
  @$pb.TagNumber(3)
  set messageServer($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessageServer() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessageServer() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
