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

import 'wrappers.pb.dart' as $1;

class ResultSchetListView extends $pb.GeneratedMessage {
  factory ResultSchetListView() => create();
  ResultSchetListView._() : super();
  factory ResultSchetListView.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResultSchetListView.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResultSchetListView', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..pc<SchetView>(1, _omitFieldNames ? '' : 'List', $pb.PbFieldType.PM, protoName: 'List', subBuilder: SchetView.create)
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
  $core.List<SchetView> get list => $_getList(0);

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

class ResultResourceSchet extends $pb.GeneratedMessage {
  factory ResultResourceSchet() => create();
  ResultResourceSchet._() : super();
  factory ResultResourceSchet.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResultResourceSchet.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResultResourceSchet', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..pc<ResourceSchet>(1, _omitFieldNames ? '' : 'Resources', $pb.PbFieldType.PM, protoName: 'Resources', subBuilder: ResourceSchet.create)
    ..aOB(2, _omitFieldNames ? '' : 'Succssed', protoName: 'Succssed')
    ..aOS(3, _omitFieldNames ? '' : 'Message', protoName: 'Message')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'Count', $pb.PbFieldType.O3, protoName: 'Count')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResultResourceSchet clone() => ResultResourceSchet()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResultResourceSchet copyWith(void Function(ResultResourceSchet) updates) => super.copyWith((message) => updates(message as ResultResourceSchet)) as ResultResourceSchet;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResultResourceSchet create() => ResultResourceSchet._();
  ResultResourceSchet createEmptyInstance() => create();
  static $pb.PbList<ResultResourceSchet> createRepeated() => $pb.PbList<ResultResourceSchet>();
  @$core.pragma('dart2js:noInline')
  static ResultResourceSchet getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResultResourceSchet>(create);
  static ResultResourceSchet? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ResourceSchet> get resources => $_getList(0);

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

  @$pb.TagNumber(4)
  $core.int get count => $_getIZ(3);
  @$pb.TagNumber(4)
  set count($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearCount() => clearField(4);
}

class ResultPaymentScheduleSchet extends $pb.GeneratedMessage {
  factory ResultPaymentScheduleSchet() => create();
  ResultPaymentScheduleSchet._() : super();
  factory ResultPaymentScheduleSchet.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResultPaymentScheduleSchet.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResultPaymentScheduleSchet', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..pc<PaymentScheduleSchetDTO>(1, _omitFieldNames ? '' : 'PaymentSchedules', $pb.PbFieldType.PM, protoName: 'PaymentSchedules', subBuilder: PaymentScheduleSchetDTO.create)
    ..aOB(2, _omitFieldNames ? '' : 'Succssed', protoName: 'Succssed')
    ..aOS(3, _omitFieldNames ? '' : 'Message', protoName: 'Message')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'Count', $pb.PbFieldType.O3, protoName: 'Count')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResultPaymentScheduleSchet clone() => ResultPaymentScheduleSchet()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResultPaymentScheduleSchet copyWith(void Function(ResultPaymentScheduleSchet) updates) => super.copyWith((message) => updates(message as ResultPaymentScheduleSchet)) as ResultPaymentScheduleSchet;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResultPaymentScheduleSchet create() => ResultPaymentScheduleSchet._();
  ResultPaymentScheduleSchet createEmptyInstance() => create();
  static $pb.PbList<ResultPaymentScheduleSchet> createRepeated() => $pb.PbList<ResultPaymentScheduleSchet>();
  @$core.pragma('dart2js:noInline')
  static ResultPaymentScheduleSchet getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResultPaymentScheduleSchet>(create);
  static ResultPaymentScheduleSchet? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PaymentScheduleSchetDTO> get paymentSchedules => $_getList(0);

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

  @$pb.TagNumber(4)
  $core.int get count => $_getIZ(3);
  @$pb.TagNumber(4)
  set count($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCount() => $_has(3);
  @$pb.TagNumber(4)
  void clearCount() => clearField(4);
}

class ResultDownloadFile extends $pb.GeneratedMessage {
  factory ResultDownloadFile() => create();
  ResultDownloadFile._() : super();
  factory ResultDownloadFile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResultDownloadFile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResultDownloadFile', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOM<FileDTO>(1, _omitFieldNames ? '' : 'File', protoName: 'File', subBuilder: FileDTO.create)
    ..aOB(2, _omitFieldNames ? '' : 'Succssed', protoName: 'Succssed')
    ..aOS(3, _omitFieldNames ? '' : 'Message', protoName: 'Message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResultDownloadFile clone() => ResultDownloadFile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResultDownloadFile copyWith(void Function(ResultDownloadFile) updates) => super.copyWith((message) => updates(message as ResultDownloadFile)) as ResultDownloadFile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResultDownloadFile create() => ResultDownloadFile._();
  ResultDownloadFile createEmptyInstance() => create();
  static $pb.PbList<ResultDownloadFile> createRepeated() => $pb.PbList<ResultDownloadFile>();
  @$core.pragma('dart2js:noInline')
  static ResultDownloadFile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResultDownloadFile>(create);
  static ResultDownloadFile? _defaultInstance;

  @$pb.TagNumber(1)
  FileDTO get file => $_getN(0);
  @$pb.TagNumber(1)
  set file(FileDTO v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFile() => $_has(0);
  @$pb.TagNumber(1)
  void clearFile() => clearField(1);
  @$pb.TagNumber(1)
  FileDTO ensureFile() => $_ensure(0);

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
    ..aOS(1, _omitFieldNames ? '' : 'Id', protoName: 'Id')
    ..aOS(2, _omitFieldNames ? '' : 'NomenclatureName', protoName: 'NomenclatureName')
    ..aOS(3, _omitFieldNames ? '' : 'ContractId', protoName: 'ContractId')
    ..aOS(4, _omitFieldNames ? '' : 'NumberPayment', protoName: 'NumberPayment')
    ..aOS(5, _omitFieldNames ? '' : 'DirectoryCounterpartiesId', protoName: 'DirectoryCounterpartiesId')
    ..aOS(6, _omitFieldNames ? '' : 'PayingOrganizationId', protoName: 'PayingOrganizationId')
    ..aOS(7, _omitFieldNames ? '' : 'DirectoryCounterpartiesName', protoName: 'DirectoryCounterpartiesName')
    ..aOS(8, _omitFieldNames ? '' : 'PayingOrganizationName', protoName: 'PayingOrganizationName')
    ..aOS(9, _omitFieldNames ? '' : 'CreatorId', protoName: 'CreatorId')
    ..aOS(10, _omitFieldNames ? '' : 'CreatorName', protoName: 'CreatorName')
    ..aOS(11, _omitFieldNames ? '' : 'SetUserId', protoName: 'SetUserId')
    ..aOS(12, _omitFieldNames ? '' : 'SetUserName', protoName: 'SetUserName')
    ..pPS(13, _omitFieldNames ? '' : 'BudgetIds', protoName: 'BudgetIds')
    ..pPS(14, _omitFieldNames ? '' : 'SchetStatus', protoName: 'SchetStatus')
    ..aOM<$1.StringValue>(15, _omitFieldNames ? '' : 'DateFrom', protoName: 'DateFrom', subBuilder: $1.StringValue.create)
    ..aOM<$1.StringValue>(16, _omitFieldNames ? '' : 'DateTo', protoName: 'DateTo', subBuilder: $1.StringValue.create)
    ..aOM<$1.DoubleValue>(17, _omitFieldNames ? '' : 'SummaMin', protoName: 'SummaMin', subBuilder: $1.DoubleValue.create)
    ..aOM<$1.DoubleValue>(18, _omitFieldNames ? '' : 'SummaMax', protoName: 'SummaMax', subBuilder: $1.DoubleValue.create)
    ..aOS(19, _omitFieldNames ? '' : 'NumberSchet', protoName: 'NumberSchet')
    ..a<$core.int>(20, _omitFieldNames ? '' : 'Skip', $pb.PbFieldType.O3, protoName: 'Skip')
    ..a<$core.int>(21, _omitFieldNames ? '' : 'Take', $pb.PbFieldType.O3, protoName: 'Take')
    ..aOS(22, _omitFieldNames ? '' : 'ProjectId', protoName: 'ProjectId')
    ..aOS(23, _omitFieldNames ? '' : 'ProjectName', protoName: 'ProjectName')
    ..aOS(24, _omitFieldNames ? '' : 'Description', protoName: 'Description')
    ..aOS(25, _omitFieldNames ? '' : 'NumberTTNOrOrder', protoName: 'NumberTTNOrOrder')
    ..aOS(26, _omitFieldNames ? '' : 'WarehouseId', protoName: 'WarehouseId')
    ..a<$core.int>(27, _omitFieldNames ? '' : 'PaymentCheck', $pb.PbFieldType.O3, protoName: 'PaymentCheck')
    ..aOS(28, _omitFieldNames ? '' : 'ResourceId', protoName: 'ResourceId')
    ..aOS(29, _omitFieldNames ? '' : 'ResourceName', protoName: 'ResourceName')
    ..pPS(30, _omitFieldNames ? '' : 'DocumentId', protoName: 'DocumentId')
    ..aOS(31, _omitFieldNames ? '' : 'MatchingStatus', protoName: 'MatchingStatus')
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
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nomenclatureName => $_getSZ(1);
  @$pb.TagNumber(2)
  set nomenclatureName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNomenclatureName() => $_has(1);
  @$pb.TagNumber(2)
  void clearNomenclatureName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get contractId => $_getSZ(2);
  @$pb.TagNumber(3)
  set contractId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContractId() => $_has(2);
  @$pb.TagNumber(3)
  void clearContractId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get numberPayment => $_getSZ(3);
  @$pb.TagNumber(4)
  set numberPayment($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasNumberPayment() => $_has(3);
  @$pb.TagNumber(4)
  void clearNumberPayment() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get directoryCounterpartiesId => $_getSZ(4);
  @$pb.TagNumber(5)
  set directoryCounterpartiesId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDirectoryCounterpartiesId() => $_has(4);
  @$pb.TagNumber(5)
  void clearDirectoryCounterpartiesId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get payingOrganizationId => $_getSZ(5);
  @$pb.TagNumber(6)
  set payingOrganizationId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPayingOrganizationId() => $_has(5);
  @$pb.TagNumber(6)
  void clearPayingOrganizationId() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get directoryCounterpartiesName => $_getSZ(6);
  @$pb.TagNumber(7)
  set directoryCounterpartiesName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasDirectoryCounterpartiesName() => $_has(6);
  @$pb.TagNumber(7)
  void clearDirectoryCounterpartiesName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get payingOrganizationName => $_getSZ(7);
  @$pb.TagNumber(8)
  set payingOrganizationName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPayingOrganizationName() => $_has(7);
  @$pb.TagNumber(8)
  void clearPayingOrganizationName() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get creatorId => $_getSZ(8);
  @$pb.TagNumber(9)
  set creatorId($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCreatorId() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreatorId() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get creatorName => $_getSZ(9);
  @$pb.TagNumber(10)
  set creatorName($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasCreatorName() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreatorName() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get setUserId => $_getSZ(10);
  @$pb.TagNumber(11)
  set setUserId($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasSetUserId() => $_has(10);
  @$pb.TagNumber(11)
  void clearSetUserId() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get setUserName => $_getSZ(11);
  @$pb.TagNumber(12)
  set setUserName($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasSetUserName() => $_has(11);
  @$pb.TagNumber(12)
  void clearSetUserName() => clearField(12);

  @$pb.TagNumber(13)
  $core.List<$core.String> get budgetIds => $_getList(12);

  @$pb.TagNumber(14)
  $core.List<$core.String> get schetStatus => $_getList(13);

  @$pb.TagNumber(15)
  $1.StringValue get dateFrom => $_getN(14);
  @$pb.TagNumber(15)
  set dateFrom($1.StringValue v) { setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasDateFrom() => $_has(14);
  @$pb.TagNumber(15)
  void clearDateFrom() => clearField(15);
  @$pb.TagNumber(15)
  $1.StringValue ensureDateFrom() => $_ensure(14);

  @$pb.TagNumber(16)
  $1.StringValue get dateTo => $_getN(15);
  @$pb.TagNumber(16)
  set dateTo($1.StringValue v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasDateTo() => $_has(15);
  @$pb.TagNumber(16)
  void clearDateTo() => clearField(16);
  @$pb.TagNumber(16)
  $1.StringValue ensureDateTo() => $_ensure(15);

  @$pb.TagNumber(17)
  $1.DoubleValue get summaMin => $_getN(16);
  @$pb.TagNumber(17)
  set summaMin($1.DoubleValue v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasSummaMin() => $_has(16);
  @$pb.TagNumber(17)
  void clearSummaMin() => clearField(17);
  @$pb.TagNumber(17)
  $1.DoubleValue ensureSummaMin() => $_ensure(16);

  @$pb.TagNumber(18)
  $1.DoubleValue get summaMax => $_getN(17);
  @$pb.TagNumber(18)
  set summaMax($1.DoubleValue v) { setField(18, v); }
  @$pb.TagNumber(18)
  $core.bool hasSummaMax() => $_has(17);
  @$pb.TagNumber(18)
  void clearSummaMax() => clearField(18);
  @$pb.TagNumber(18)
  $1.DoubleValue ensureSummaMax() => $_ensure(17);

  @$pb.TagNumber(19)
  $core.String get numberSchet => $_getSZ(18);
  @$pb.TagNumber(19)
  set numberSchet($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasNumberSchet() => $_has(18);
  @$pb.TagNumber(19)
  void clearNumberSchet() => clearField(19);

  @$pb.TagNumber(20)
  $core.int get skip => $_getIZ(19);
  @$pb.TagNumber(20)
  set skip($core.int v) { $_setSignedInt32(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasSkip() => $_has(19);
  @$pb.TagNumber(20)
  void clearSkip() => clearField(20);

  @$pb.TagNumber(21)
  $core.int get take => $_getIZ(20);
  @$pb.TagNumber(21)
  set take($core.int v) { $_setSignedInt32(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasTake() => $_has(20);
  @$pb.TagNumber(21)
  void clearTake() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get projectId => $_getSZ(21);
  @$pb.TagNumber(22)
  set projectId($core.String v) { $_setString(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasProjectId() => $_has(21);
  @$pb.TagNumber(22)
  void clearProjectId() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get projectName => $_getSZ(22);
  @$pb.TagNumber(23)
  set projectName($core.String v) { $_setString(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasProjectName() => $_has(22);
  @$pb.TagNumber(23)
  void clearProjectName() => clearField(23);

  @$pb.TagNumber(24)
  $core.String get description => $_getSZ(23);
  @$pb.TagNumber(24)
  set description($core.String v) { $_setString(23, v); }
  @$pb.TagNumber(24)
  $core.bool hasDescription() => $_has(23);
  @$pb.TagNumber(24)
  void clearDescription() => clearField(24);

  @$pb.TagNumber(25)
  $core.String get numberTTNOrOrder => $_getSZ(24);
  @$pb.TagNumber(25)
  set numberTTNOrOrder($core.String v) { $_setString(24, v); }
  @$pb.TagNumber(25)
  $core.bool hasNumberTTNOrOrder() => $_has(24);
  @$pb.TagNumber(25)
  void clearNumberTTNOrOrder() => clearField(25);

  @$pb.TagNumber(26)
  $core.String get warehouseId => $_getSZ(25);
  @$pb.TagNumber(26)
  set warehouseId($core.String v) { $_setString(25, v); }
  @$pb.TagNumber(26)
  $core.bool hasWarehouseId() => $_has(25);
  @$pb.TagNumber(26)
  void clearWarehouseId() => clearField(26);

  @$pb.TagNumber(27)
  $core.int get paymentCheck => $_getIZ(26);
  @$pb.TagNumber(27)
  set paymentCheck($core.int v) { $_setSignedInt32(26, v); }
  @$pb.TagNumber(27)
  $core.bool hasPaymentCheck() => $_has(26);
  @$pb.TagNumber(27)
  void clearPaymentCheck() => clearField(27);

  @$pb.TagNumber(28)
  $core.String get resourceId => $_getSZ(27);
  @$pb.TagNumber(28)
  set resourceId($core.String v) { $_setString(27, v); }
  @$pb.TagNumber(28)
  $core.bool hasResourceId() => $_has(27);
  @$pb.TagNumber(28)
  void clearResourceId() => clearField(28);

  @$pb.TagNumber(29)
  $core.String get resourceName => $_getSZ(28);
  @$pb.TagNumber(29)
  set resourceName($core.String v) { $_setString(28, v); }
  @$pb.TagNumber(29)
  $core.bool hasResourceName() => $_has(28);
  @$pb.TagNumber(29)
  void clearResourceName() => clearField(29);

  @$pb.TagNumber(30)
  $core.List<$core.String> get documentId => $_getList(29);

  @$pb.TagNumber(31)
  $core.String get matchingStatus => $_getSZ(30);
  @$pb.TagNumber(31)
  set matchingStatus($core.String v) { $_setString(30, v); }
  @$pb.TagNumber(31)
  $core.bool hasMatchingStatus() => $_has(30);
  @$pb.TagNumber(31)
  void clearMatchingStatus() => clearField(31);
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
    ..aOM<FileDTO>(10, _omitFieldNames ? '' : 'File', protoName: 'File', subBuilder: FileDTO.create)
    ..aOM<StatusSchetDTO>(11, _omitFieldNames ? '' : 'Status', protoName: 'Status', subBuilder: StatusSchetDTO.create)
    ..aOS(12, _omitFieldNames ? '' : 'Currency', protoName: 'Currency')
    ..aOS(13, _omitFieldNames ? '' : 'CreaterId', protoName: 'CreaterId')
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
  FileDTO get file => $_getN(9);
  @$pb.TagNumber(10)
  set file(FileDTO v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasFile() => $_has(9);
  @$pb.TagNumber(10)
  void clearFile() => clearField(10);
  @$pb.TagNumber(10)
  FileDTO ensureFile() => $_ensure(9);

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

  @$pb.TagNumber(12)
  $core.String get currency => $_getSZ(11);
  @$pb.TagNumber(12)
  set currency($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasCurrency() => $_has(11);
  @$pb.TagNumber(12)
  void clearCurrency() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get createrId => $_getSZ(12);
  @$pb.TagNumber(13)
  set createrId($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasCreaterId() => $_has(12);
  @$pb.TagNumber(13)
  void clearCreaterId() => clearField(13);
}

class FilterFile extends $pb.GeneratedMessage {
  factory FilterFile() => create();
  FilterFile._() : super();
  factory FilterFile.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FilterFile.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FilterFile', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Path', protoName: 'Path')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FilterFile clone() => FilterFile()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FilterFile copyWith(void Function(FilterFile) updates) => super.copyWith((message) => updates(message as FilterFile)) as FilterFile;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FilterFile create() => FilterFile._();
  FilterFile createEmptyInstance() => create();
  static $pb.PbList<FilterFile> createRepeated() => $pb.PbList<FilterFile>();
  @$core.pragma('dart2js:noInline')
  static FilterFile getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FilterFile>(create);
  static FilterFile? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get path => $_getSZ(0);
  @$pb.TagNumber(1)
  set path($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearPath() => clearField(1);
}

class FileDTO extends $pb.GeneratedMessage {
  factory FileDTO() => create();
  FileDTO._() : super();
  factory FileDTO.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FileDTO.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FileDTO', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Id', protoName: 'Id')
    ..aOS(2, _omitFieldNames ? '' : 'Path', protoName: 'Path')
    ..aOS(3, _omitFieldNames ? '' : 'Name', protoName: 'Name')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'Body', $pb.PbFieldType.OY, protoName: 'Body')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FileDTO clone() => FileDTO()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FileDTO copyWith(void Function(FileDTO) updates) => super.copyWith((message) => updates(message as FileDTO)) as FileDTO;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FileDTO create() => FileDTO._();
  FileDTO createEmptyInstance() => create();
  static $pb.PbList<FileDTO> createRepeated() => $pb.PbList<FileDTO>();
  @$core.pragma('dart2js:noInline')
  static FileDTO getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FileDTO>(create);
  static FileDTO? _defaultInstance;

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

  @$pb.TagNumber(4)
  $core.List<$core.int> get body => $_getN(3);
  @$pb.TagNumber(4)
  set body($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBody() => $_has(3);
  @$pb.TagNumber(4)
  void clearBody() => clearField(4);
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

class FilterResourceSchet extends $pb.GeneratedMessage {
  factory FilterResourceSchet() => create();
  FilterResourceSchet._() : super();
  factory FilterResourceSchet.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FilterResourceSchet.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FilterResourceSchet', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SchetId', protoName: 'SchetId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'Skip', $pb.PbFieldType.O3, protoName: 'Skip')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'Take', $pb.PbFieldType.O3, protoName: 'Take')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FilterResourceSchet clone() => FilterResourceSchet()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FilterResourceSchet copyWith(void Function(FilterResourceSchet) updates) => super.copyWith((message) => updates(message as FilterResourceSchet)) as FilterResourceSchet;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FilterResourceSchet create() => FilterResourceSchet._();
  FilterResourceSchet createEmptyInstance() => create();
  static $pb.PbList<FilterResourceSchet> createRepeated() => $pb.PbList<FilterResourceSchet>();
  @$core.pragma('dart2js:noInline')
  static FilterResourceSchet getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FilterResourceSchet>(create);
  static FilterResourceSchet? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get schetId => $_getSZ(0);
  @$pb.TagNumber(1)
  set schetId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSchetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSchetId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get skip => $_getIZ(1);
  @$pb.TagNumber(2)
  set skip($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSkip() => $_has(1);
  @$pb.TagNumber(2)
  void clearSkip() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get take => $_getIZ(2);
  @$pb.TagNumber(3)
  set take($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTake() => $_has(2);
  @$pb.TagNumber(3)
  void clearTake() => clearField(3);
}

class ResourceSchet extends $pb.GeneratedMessage {
  factory ResourceSchet() => create();
  ResourceSchet._() : super();
  factory ResourceSchet.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResourceSchet.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResourceSchet', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Name', protoName: 'Name')
    ..aOS(2, _omitFieldNames ? '' : 'Unit', protoName: 'Unit')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'Count', $pb.PbFieldType.OD, protoName: 'Count')
    ..aOS(4, _omitFieldNames ? '' : 'Currency', protoName: 'Currency')
    ..a<$core.double>(5, _omitFieldNames ? '' : 'Price', $pb.PbFieldType.OD, protoName: 'Price')
    ..a<$core.double>(6, _omitFieldNames ? '' : 'PriceWithVAT', $pb.PbFieldType.OD, protoName: 'PriceWithVAT')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResourceSchet clone() => ResourceSchet()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResourceSchet copyWith(void Function(ResourceSchet) updates) => super.copyWith((message) => updates(message as ResourceSchet)) as ResourceSchet;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResourceSchet create() => ResourceSchet._();
  ResourceSchet createEmptyInstance() => create();
  static $pb.PbList<ResourceSchet> createRepeated() => $pb.PbList<ResourceSchet>();
  @$core.pragma('dart2js:noInline')
  static ResourceSchet getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResourceSchet>(create);
  static ResourceSchet? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get unit => $_getSZ(1);
  @$pb.TagNumber(2)
  set unit($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUnit() => $_has(1);
  @$pb.TagNumber(2)
  void clearUnit() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get count => $_getN(2);
  @$pb.TagNumber(3)
  set count($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get currency => $_getSZ(3);
  @$pb.TagNumber(4)
  set currency($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCurrency() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrency() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get price => $_getN(4);
  @$pb.TagNumber(5)
  set price($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearPrice() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get priceWithVAT => $_getN(5);
  @$pb.TagNumber(6)
  set priceWithVAT($core.double v) { $_setDouble(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPriceWithVAT() => $_has(5);
  @$pb.TagNumber(6)
  void clearPriceWithVAT() => clearField(6);
}

class FilterPaymentScheduleSchet extends $pb.GeneratedMessage {
  factory FilterPaymentScheduleSchet() => create();
  FilterPaymentScheduleSchet._() : super();
  factory FilterPaymentScheduleSchet.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FilterPaymentScheduleSchet.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FilterPaymentScheduleSchet', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SchetId', protoName: 'SchetId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'Skip', $pb.PbFieldType.O3, protoName: 'Skip')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'Take', $pb.PbFieldType.O3, protoName: 'Take')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FilterPaymentScheduleSchet clone() => FilterPaymentScheduleSchet()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FilterPaymentScheduleSchet copyWith(void Function(FilterPaymentScheduleSchet) updates) => super.copyWith((message) => updates(message as FilterPaymentScheduleSchet)) as FilterPaymentScheduleSchet;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FilterPaymentScheduleSchet create() => FilterPaymentScheduleSchet._();
  FilterPaymentScheduleSchet createEmptyInstance() => create();
  static $pb.PbList<FilterPaymentScheduleSchet> createRepeated() => $pb.PbList<FilterPaymentScheduleSchet>();
  @$core.pragma('dart2js:noInline')
  static FilterPaymentScheduleSchet getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FilterPaymentScheduleSchet>(create);
  static FilterPaymentScheduleSchet? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get schetId => $_getSZ(0);
  @$pb.TagNumber(1)
  set schetId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSchetId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSchetId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get skip => $_getIZ(1);
  @$pb.TagNumber(2)
  set skip($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSkip() => $_has(1);
  @$pb.TagNumber(2)
  void clearSkip() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get take => $_getIZ(2);
  @$pb.TagNumber(3)
  set take($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTake() => $_has(2);
  @$pb.TagNumber(3)
  void clearTake() => clearField(3);
}

class PaymentScheduleSchetDTO extends $pb.GeneratedMessage {
  factory PaymentScheduleSchetDTO() => create();
  PaymentScheduleSchetDTO._() : super();
  factory PaymentScheduleSchetDTO.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PaymentScheduleSchetDTO.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PaymentScheduleSchetDTO', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Date', protoName: 'Date')
    ..aOS(2, _omitFieldNames ? '' : 'Description', protoName: 'Description')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'Sum', $pb.PbFieldType.OD, protoName: 'Sum')
    ..a<$core.double>(4, _omitFieldNames ? '' : 'SumWithVAT', $pb.PbFieldType.OD, protoName: 'SumWithVAT')
    ..aOS(5, _omitFieldNames ? '' : 'PaymentOrderId', protoName: 'PaymentOrderId')
    ..aOS(6, _omitFieldNames ? '' : 'PaymentOrderNumber', protoName: 'PaymentOrderNumber')
    ..aOS(7, _omitFieldNames ? '' : 'Currency', protoName: 'Currency')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PaymentScheduleSchetDTO clone() => PaymentScheduleSchetDTO()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PaymentScheduleSchetDTO copyWith(void Function(PaymentScheduleSchetDTO) updates) => super.copyWith((message) => updates(message as PaymentScheduleSchetDTO)) as PaymentScheduleSchetDTO;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PaymentScheduleSchetDTO create() => PaymentScheduleSchetDTO._();
  PaymentScheduleSchetDTO createEmptyInstance() => create();
  static $pb.PbList<PaymentScheduleSchetDTO> createRepeated() => $pb.PbList<PaymentScheduleSchetDTO>();
  @$core.pragma('dart2js:noInline')
  static PaymentScheduleSchetDTO getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PaymentScheduleSchetDTO>(create);
  static PaymentScheduleSchetDTO? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get date => $_getSZ(0);
  @$pb.TagNumber(1)
  set date($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearDate() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get sum => $_getN(2);
  @$pb.TagNumber(3)
  set sum($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSum() => $_has(2);
  @$pb.TagNumber(3)
  void clearSum() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get sumWithVAT => $_getN(3);
  @$pb.TagNumber(4)
  set sumWithVAT($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSumWithVAT() => $_has(3);
  @$pb.TagNumber(4)
  void clearSumWithVAT() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get paymentOrderId => $_getSZ(4);
  @$pb.TagNumber(5)
  set paymentOrderId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPaymentOrderId() => $_has(4);
  @$pb.TagNumber(5)
  void clearPaymentOrderId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get paymentOrderNumber => $_getSZ(5);
  @$pb.TagNumber(6)
  set paymentOrderNumber($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPaymentOrderNumber() => $_has(5);
  @$pb.TagNumber(6)
  void clearPaymentOrderNumber() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get currency => $_getSZ(6);
  @$pb.TagNumber(7)
  set currency($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCurrency() => $_has(6);
  @$pb.TagNumber(7)
  void clearCurrency() => clearField(7);
}

class RejectSchetDTO extends $pb.GeneratedMessage {
  factory RejectSchetDTO() => create();
  RejectSchetDTO._() : super();
  factory RejectSchetDTO.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RejectSchetDTO.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RejectSchetDTO', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'Comment', protoName: 'Comment')
    ..aOS(3, _omitFieldNames ? '' : 'SchetId', protoName: 'SchetId')
    ..aOS(4, _omitFieldNames ? '' : 'UserId', protoName: 'UserId')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'StatusHierarchy', $pb.PbFieldType.O3, protoName: 'StatusHierarchy')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RejectSchetDTO clone() => RejectSchetDTO()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RejectSchetDTO copyWith(void Function(RejectSchetDTO) updates) => super.copyWith((message) => updates(message as RejectSchetDTO)) as RejectSchetDTO;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RejectSchetDTO create() => RejectSchetDTO._();
  RejectSchetDTO createEmptyInstance() => create();
  static $pb.PbList<RejectSchetDTO> createRepeated() => $pb.PbList<RejectSchetDTO>();
  @$core.pragma('dart2js:noInline')
  static RejectSchetDTO getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RejectSchetDTO>(create);
  static RejectSchetDTO? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get comment => $_getSZ(0);
  @$pb.TagNumber(2)
  set comment($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasComment() => $_has(0);
  @$pb.TagNumber(2)
  void clearComment() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get schetId => $_getSZ(1);
  @$pb.TagNumber(3)
  set schetId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasSchetId() => $_has(1);
  @$pb.TagNumber(3)
  void clearSchetId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(4)
  set userId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(4)
  void clearUserId() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get statusHierarchy => $_getIZ(3);
  @$pb.TagNumber(5)
  set statusHierarchy($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatusHierarchy() => $_has(3);
  @$pb.TagNumber(5)
  void clearStatusHierarchy() => clearField(5);
}

class ResultService extends $pb.GeneratedMessage {
  factory ResultService() => create();
  ResultService._() : super();
  factory ResultService.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResultService.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResultService', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'Succssed', protoName: 'Succssed')
    ..aOS(2, _omitFieldNames ? '' : 'Message', protoName: 'Message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResultService clone() => ResultService()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResultService copyWith(void Function(ResultService) updates) => super.copyWith((message) => updates(message as ResultService)) as ResultService;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResultService create() => ResultService._();
  ResultService createEmptyInstance() => create();
  static $pb.PbList<ResultService> createRepeated() => $pb.PbList<ResultService>();
  @$core.pragma('dart2js:noInline')
  static ResultService getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResultService>(create);
  static ResultService? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get succssed => $_getBF(0);
  @$pb.TagNumber(1)
  set succssed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccssed() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccssed() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class UserListRequest extends $pb.GeneratedMessage {
  factory UserListRequest() => create();
  UserListRequest._() : super();
  factory UserListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserListRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firstName', protoName: 'firstName')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'skip', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'take', $pb.PbFieldType.O3)
    ..aOM<FilterSchet>(4, _omitFieldNames ? '' : 'filter', subBuilder: FilterSchet.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserListRequest clone() => UserListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserListRequest copyWith(void Function(UserListRequest) updates) => super.copyWith((message) => updates(message as UserListRequest)) as UserListRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserListRequest create() => UserListRequest._();
  UserListRequest createEmptyInstance() => create();
  static $pb.PbList<UserListRequest> createRepeated() => $pb.PbList<UserListRequest>();
  @$core.pragma('dart2js:noInline')
  static UserListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserListRequest>(create);
  static UserListRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firstName => $_getSZ(0);
  @$pb.TagNumber(1)
  set firstName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirstName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get skip => $_getIZ(1);
  @$pb.TagNumber(2)
  set skip($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSkip() => $_has(1);
  @$pb.TagNumber(2)
  void clearSkip() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get take => $_getIZ(2);
  @$pb.TagNumber(3)
  set take($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTake() => $_has(2);
  @$pb.TagNumber(3)
  void clearTake() => clearField(3);

  @$pb.TagNumber(4)
  FilterSchet get filter => $_getN(3);
  @$pb.TagNumber(4)
  set filter(FilterSchet v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasFilter() => $_has(3);
  @$pb.TagNumber(4)
  void clearFilter() => clearField(4);
  @$pb.TagNumber(4)
  FilterSchet ensureFilter() => $_ensure(3);
}

class UserListReply extends $pb.GeneratedMessage {
  factory UserListReply() => create();
  UserListReply._() : super();
  factory UserListReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserListReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserListReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'succsecced')
    ..aOS(2, _omitFieldNames ? '' : 'messageServer', protoName: 'messageServer')
    ..pc<UserFilter>(3, _omitFieldNames ? '' : 'users', $pb.PbFieldType.PM, subBuilder: UserFilter.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserListReply clone() => UserListReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserListReply copyWith(void Function(UserListReply) updates) => super.copyWith((message) => updates(message as UserListReply)) as UserListReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserListReply create() => UserListReply._();
  UserListReply createEmptyInstance() => create();
  static $pb.PbList<UserListReply> createRepeated() => $pb.PbList<UserListReply>();
  @$core.pragma('dart2js:noInline')
  static UserListReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserListReply>(create);
  static UserListReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get succsecced => $_getBF(0);
  @$pb.TagNumber(1)
  set succsecced($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccsecced() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccsecced() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get messageServer => $_getSZ(1);
  @$pb.TagNumber(2)
  set messageServer($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessageServer() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessageServer() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<UserFilter> get users => $_getList(2);
}

class UserFilter extends $pb.GeneratedMessage {
  factory UserFilter() => create();
  UserFilter._() : super();
  factory UserFilter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserFilter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserFilter', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Id', protoName: 'Id')
    ..aOS(2, _omitFieldNames ? '' : 'FullName', protoName: 'FullName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserFilter clone() => UserFilter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserFilter copyWith(void Function(UserFilter) updates) => super.copyWith((message) => updates(message as UserFilter)) as UserFilter;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserFilter create() => UserFilter._();
  UserFilter createEmptyInstance() => create();
  static $pb.PbList<UserFilter> createRepeated() => $pb.PbList<UserFilter>();
  @$core.pragma('dart2js:noInline')
  static UserFilter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserFilter>(create);
  static UserFilter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fullName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fullName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFullName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFullName() => clearField(2);
}

class ContractFilter extends $pb.GeneratedMessage {
  factory ContractFilter() => create();
  ContractFilter._() : super();
  factory ContractFilter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContractFilter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContractFilter', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Id', protoName: 'Id')
    ..aOS(2, _omitFieldNames ? '' : 'Name', protoName: 'Name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContractFilter clone() => ContractFilter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContractFilter copyWith(void Function(ContractFilter) updates) => super.copyWith((message) => updates(message as ContractFilter)) as ContractFilter;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContractFilter create() => ContractFilter._();
  ContractFilter createEmptyInstance() => create();
  static $pb.PbList<ContractFilter> createRepeated() => $pb.PbList<ContractFilter>();
  @$core.pragma('dart2js:noInline')
  static ContractFilter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContractFilter>(create);
  static ContractFilter? _defaultInstance;

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
}

class ContractListReply extends $pb.GeneratedMessage {
  factory ContractListReply() => create();
  ContractListReply._() : super();
  factory ContractListReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContractListReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContractListReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'succsecced')
    ..aOS(2, _omitFieldNames ? '' : 'messageServer', protoName: 'messageServer')
    ..pc<ContractFilter>(3, _omitFieldNames ? '' : 'contracts', $pb.PbFieldType.PM, subBuilder: ContractFilter.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContractListReply clone() => ContractListReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContractListReply copyWith(void Function(ContractListReply) updates) => super.copyWith((message) => updates(message as ContractListReply)) as ContractListReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContractListReply create() => ContractListReply._();
  ContractListReply createEmptyInstance() => create();
  static $pb.PbList<ContractListReply> createRepeated() => $pb.PbList<ContractListReply>();
  @$core.pragma('dart2js:noInline')
  static ContractListReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContractListReply>(create);
  static ContractListReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get succsecced => $_getBF(0);
  @$pb.TagNumber(1)
  set succsecced($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccsecced() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccsecced() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get messageServer => $_getSZ(1);
  @$pb.TagNumber(2)
  set messageServer($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessageServer() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessageServer() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<ContractFilter> get contracts => $_getList(2);
}

class ContractListRequest extends $pb.GeneratedMessage {
  factory ContractListRequest() => create();
  ContractListRequest._() : super();
  factory ContractListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ContractListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ContractListRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'contractName', protoName: 'contractName')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'skip', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'take', $pb.PbFieldType.O3)
    ..aOM<FilterSchet>(4, _omitFieldNames ? '' : 'filter', subBuilder: FilterSchet.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ContractListRequest clone() => ContractListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ContractListRequest copyWith(void Function(ContractListRequest) updates) => super.copyWith((message) => updates(message as ContractListRequest)) as ContractListRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ContractListRequest create() => ContractListRequest._();
  ContractListRequest createEmptyInstance() => create();
  static $pb.PbList<ContractListRequest> createRepeated() => $pb.PbList<ContractListRequest>();
  @$core.pragma('dart2js:noInline')
  static ContractListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ContractListRequest>(create);
  static ContractListRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get contractName => $_getSZ(0);
  @$pb.TagNumber(1)
  set contractName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContractName() => $_has(0);
  @$pb.TagNumber(1)
  void clearContractName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get skip => $_getIZ(1);
  @$pb.TagNumber(2)
  set skip($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSkip() => $_has(1);
  @$pb.TagNumber(2)
  void clearSkip() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get take => $_getIZ(2);
  @$pb.TagNumber(3)
  set take($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTake() => $_has(2);
  @$pb.TagNumber(3)
  void clearTake() => clearField(3);

  @$pb.TagNumber(4)
  FilterSchet get filter => $_getN(3);
  @$pb.TagNumber(4)
  set filter(FilterSchet v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasFilter() => $_has(3);
  @$pb.TagNumber(4)
  void clearFilter() => clearField(4);
  @$pb.TagNumber(4)
  FilterSchet ensureFilter() => $_ensure(3);
}

class CounterpartyFilter extends $pb.GeneratedMessage {
  factory CounterpartyFilter() => create();
  CounterpartyFilter._() : super();
  factory CounterpartyFilter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CounterpartyFilter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CounterpartyFilter', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Id', protoName: 'Id')
    ..aOS(2, _omitFieldNames ? '' : 'Name', protoName: 'Name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CounterpartyFilter clone() => CounterpartyFilter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CounterpartyFilter copyWith(void Function(CounterpartyFilter) updates) => super.copyWith((message) => updates(message as CounterpartyFilter)) as CounterpartyFilter;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CounterpartyFilter create() => CounterpartyFilter._();
  CounterpartyFilter createEmptyInstance() => create();
  static $pb.PbList<CounterpartyFilter> createRepeated() => $pb.PbList<CounterpartyFilter>();
  @$core.pragma('dart2js:noInline')
  static CounterpartyFilter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CounterpartyFilter>(create);
  static CounterpartyFilter? _defaultInstance;

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
}

class CounterpartyListReply extends $pb.GeneratedMessage {
  factory CounterpartyListReply() => create();
  CounterpartyListReply._() : super();
  factory CounterpartyListReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CounterpartyListReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CounterpartyListReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'succsecced')
    ..aOS(2, _omitFieldNames ? '' : 'messageServer', protoName: 'messageServer')
    ..pc<CounterpartyFilter>(3, _omitFieldNames ? '' : 'counterparties', $pb.PbFieldType.PM, subBuilder: CounterpartyFilter.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CounterpartyListReply clone() => CounterpartyListReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CounterpartyListReply copyWith(void Function(CounterpartyListReply) updates) => super.copyWith((message) => updates(message as CounterpartyListReply)) as CounterpartyListReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CounterpartyListReply create() => CounterpartyListReply._();
  CounterpartyListReply createEmptyInstance() => create();
  static $pb.PbList<CounterpartyListReply> createRepeated() => $pb.PbList<CounterpartyListReply>();
  @$core.pragma('dart2js:noInline')
  static CounterpartyListReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CounterpartyListReply>(create);
  static CounterpartyListReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get succsecced => $_getBF(0);
  @$pb.TagNumber(1)
  set succsecced($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccsecced() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccsecced() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get messageServer => $_getSZ(1);
  @$pb.TagNumber(2)
  set messageServer($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessageServer() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessageServer() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<CounterpartyFilter> get counterparties => $_getList(2);
}

class CounterpartyListRequest extends $pb.GeneratedMessage {
  factory CounterpartyListRequest() => create();
  CounterpartyListRequest._() : super();
  factory CounterpartyListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CounterpartyListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CounterpartyListRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'counterpartyName', protoName: 'counterpartyName')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'skip', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'take', $pb.PbFieldType.O3)
    ..aOM<FilterSchet>(4, _omitFieldNames ? '' : 'filter', subBuilder: FilterSchet.create)
    ..aOB(5, _omitFieldNames ? '' : 'isPaying', protoName: 'isPaying')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CounterpartyListRequest clone() => CounterpartyListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CounterpartyListRequest copyWith(void Function(CounterpartyListRequest) updates) => super.copyWith((message) => updates(message as CounterpartyListRequest)) as CounterpartyListRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CounterpartyListRequest create() => CounterpartyListRequest._();
  CounterpartyListRequest createEmptyInstance() => create();
  static $pb.PbList<CounterpartyListRequest> createRepeated() => $pb.PbList<CounterpartyListRequest>();
  @$core.pragma('dart2js:noInline')
  static CounterpartyListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CounterpartyListRequest>(create);
  static CounterpartyListRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get counterpartyName => $_getSZ(0);
  @$pb.TagNumber(1)
  set counterpartyName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCounterpartyName() => $_has(0);
  @$pb.TagNumber(1)
  void clearCounterpartyName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get skip => $_getIZ(1);
  @$pb.TagNumber(2)
  set skip($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSkip() => $_has(1);
  @$pb.TagNumber(2)
  void clearSkip() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get take => $_getIZ(2);
  @$pb.TagNumber(3)
  set take($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTake() => $_has(2);
  @$pb.TagNumber(3)
  void clearTake() => clearField(3);

  @$pb.TagNumber(4)
  FilterSchet get filter => $_getN(3);
  @$pb.TagNumber(4)
  set filter(FilterSchet v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasFilter() => $_has(3);
  @$pb.TagNumber(4)
  void clearFilter() => clearField(4);
  @$pb.TagNumber(4)
  FilterSchet ensureFilter() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.bool get isPaying => $_getBF(4);
  @$pb.TagNumber(5)
  set isPaying($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsPaying() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsPaying() => clearField(5);
}

class ProjectFilter extends $pb.GeneratedMessage {
  factory ProjectFilter() => create();
  ProjectFilter._() : super();
  factory ProjectFilter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProjectFilter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProjectFilter', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Id', protoName: 'Id')
    ..aOS(2, _omitFieldNames ? '' : 'Name', protoName: 'Name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProjectFilter clone() => ProjectFilter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProjectFilter copyWith(void Function(ProjectFilter) updates) => super.copyWith((message) => updates(message as ProjectFilter)) as ProjectFilter;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProjectFilter create() => ProjectFilter._();
  ProjectFilter createEmptyInstance() => create();
  static $pb.PbList<ProjectFilter> createRepeated() => $pb.PbList<ProjectFilter>();
  @$core.pragma('dart2js:noInline')
  static ProjectFilter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProjectFilter>(create);
  static ProjectFilter? _defaultInstance;

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
}

class ProjectListReply extends $pb.GeneratedMessage {
  factory ProjectListReply() => create();
  ProjectListReply._() : super();
  factory ProjectListReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProjectListReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProjectListReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'succsecced')
    ..aOS(2, _omitFieldNames ? '' : 'messageServer', protoName: 'messageServer')
    ..pc<ProjectFilter>(3, _omitFieldNames ? '' : 'projects', $pb.PbFieldType.PM, subBuilder: ProjectFilter.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProjectListReply clone() => ProjectListReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProjectListReply copyWith(void Function(ProjectListReply) updates) => super.copyWith((message) => updates(message as ProjectListReply)) as ProjectListReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProjectListReply create() => ProjectListReply._();
  ProjectListReply createEmptyInstance() => create();
  static $pb.PbList<ProjectListReply> createRepeated() => $pb.PbList<ProjectListReply>();
  @$core.pragma('dart2js:noInline')
  static ProjectListReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProjectListReply>(create);
  static ProjectListReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get succsecced => $_getBF(0);
  @$pb.TagNumber(1)
  set succsecced($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccsecced() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccsecced() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get messageServer => $_getSZ(1);
  @$pb.TagNumber(2)
  set messageServer($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessageServer() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessageServer() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<ProjectFilter> get projects => $_getList(2);
}

class ProjectListRequest extends $pb.GeneratedMessage {
  factory ProjectListRequest() => create();
  ProjectListRequest._() : super();
  factory ProjectListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProjectListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProjectListRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'schet'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'projectName', protoName: 'projectName')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'skip', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'take', $pb.PbFieldType.O3)
    ..aOM<FilterSchet>(4, _omitFieldNames ? '' : 'filter', subBuilder: FilterSchet.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProjectListRequest clone() => ProjectListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProjectListRequest copyWith(void Function(ProjectListRequest) updates) => super.copyWith((message) => updates(message as ProjectListRequest)) as ProjectListRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProjectListRequest create() => ProjectListRequest._();
  ProjectListRequest createEmptyInstance() => create();
  static $pb.PbList<ProjectListRequest> createRepeated() => $pb.PbList<ProjectListRequest>();
  @$core.pragma('dart2js:noInline')
  static ProjectListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProjectListRequest>(create);
  static ProjectListRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get projectName => $_getSZ(0);
  @$pb.TagNumber(1)
  set projectName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProjectName() => $_has(0);
  @$pb.TagNumber(1)
  void clearProjectName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get skip => $_getIZ(1);
  @$pb.TagNumber(2)
  set skip($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSkip() => $_has(1);
  @$pb.TagNumber(2)
  void clearSkip() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get take => $_getIZ(2);
  @$pb.TagNumber(3)
  set take($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTake() => $_has(2);
  @$pb.TagNumber(3)
  void clearTake() => clearField(3);

  @$pb.TagNumber(4)
  FilterSchet get filter => $_getN(3);
  @$pb.TagNumber(4)
  set filter(FilterSchet v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasFilter() => $_has(3);
  @$pb.TagNumber(4)
  void clearFilter() => clearField(4);
  @$pb.TagNumber(4)
  FilterSchet ensureFilter() => $_ensure(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
