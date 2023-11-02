//
//  Generated code. Do not modify.
//  source: schet.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'schet.pb.dart' as $0;

export 'schet.pb.dart';

@$pb.GrpcServiceName('schet.SchetGRPCService')
class SchetGRPCServiceClient extends $grpc.Client {
  static final _$getSchets = $grpc.ClientMethod<$0.FilterSchet, $0.ResultSchetListView>(
      '/schet.SchetGRPCService/GetSchets',
      ($0.FilterSchet value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ResultSchetListView.fromBuffer(value));
  static final _$getSchet = $grpc.ClientMethod<$0.FilterSchet, $0.ResultSchetView>(
      '/schet.SchetGRPCService/GetSchet',
      ($0.FilterSchet value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ResultSchetView.fromBuffer(value));
  static final _$changeStatusSchet = $grpc.ClientMethod<$0.FilterChangeStatus, $0.ResultChangeStatusSchet>(
      '/schet.SchetGRPCService/ChangeStatusSchet',
      ($0.FilterChangeStatus value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ResultChangeStatusSchet.fromBuffer(value));
  static final _$getResourcesSchet = $grpc.ClientMethod<$0.FilterResourceSchet, $0.ResultResourceSchet>(
      '/schet.SchetGRPCService/GetResourcesSchet',
      ($0.FilterResourceSchet value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ResultResourceSchet.fromBuffer(value));
  static final _$getPaymentSchedulesSchet = $grpc.ClientMethod<$0.FilterPaymentScheduleSchet, $0.ResultPaymentScheduleSchet>(
      '/schet.SchetGRPCService/GetPaymentSchedulesSchet',
      ($0.FilterPaymentScheduleSchet value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ResultPaymentScheduleSchet.fromBuffer(value));
  static final _$downloadFile = $grpc.ClientMethod<$0.FileDTO, $0.ResultDownloadFile>(
      '/schet.SchetGRPCService/DownloadFile',
      ($0.FileDTO value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ResultDownloadFile.fromBuffer(value));
  static final _$rejectSchet = $grpc.ClientMethod<$0.RejectSchetDTO, $0.ResultService>(
      '/schet.SchetGRPCService/RejectSchet',
      ($0.RejectSchetDTO value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ResultService.fromBuffer(value));
  static final _$getUsers = $grpc.ClientMethod<$0.UserListRequest, $0.UserListReply>(
      '/schet.SchetGRPCService/GetUsers',
      ($0.UserListRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserListReply.fromBuffer(value));
  static final _$getCreators = $grpc.ClientMethod<$0.UserListRequest, $0.UserListReply>(
      '/schet.SchetGRPCService/GetCreators',
      ($0.UserListRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserListReply.fromBuffer(value));
  static final _$getContracts = $grpc.ClientMethod<$0.ContractListRequest, $0.ContractListReply>(
      '/schet.SchetGRPCService/GetContracts',
      ($0.ContractListRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ContractListReply.fromBuffer(value));
  static final _$getCounterparties = $grpc.ClientMethod<$0.CounterpartyListRequest, $0.CounterpartyListReply>(
      '/schet.SchetGRPCService/GetCounterparties',
      ($0.CounterpartyListRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CounterpartyListReply.fromBuffer(value));
  static final _$getProjects = $grpc.ClientMethod<$0.ProjectListRequest, $0.ProjectListReply>(
      '/schet.SchetGRPCService/GetProjects',
      ($0.ProjectListRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ProjectListReply.fromBuffer(value));

  SchetGRPCServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.ResultSchetListView> getSchets($0.FilterSchet request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSchets, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResultSchetView> getSchet($0.FilterSchet request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSchet, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResultChangeStatusSchet> changeStatusSchet($0.FilterChangeStatus request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$changeStatusSchet, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResultResourceSchet> getResourcesSchet($0.FilterResourceSchet request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getResourcesSchet, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResultPaymentScheduleSchet> getPaymentSchedulesSchet($0.FilterPaymentScheduleSchet request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPaymentSchedulesSchet, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResultDownloadFile> downloadFile($0.FileDTO request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$downloadFile, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResultService> rejectSchet($0.RejectSchetDTO request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$rejectSchet, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserListReply> getUsers($0.UserListRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUsers, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserListReply> getCreators($0.UserListRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCreators, request, options: options);
  }

  $grpc.ResponseFuture<$0.ContractListReply> getContracts($0.ContractListRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getContracts, request, options: options);
  }

  $grpc.ResponseFuture<$0.CounterpartyListReply> getCounterparties($0.CounterpartyListRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCounterparties, request, options: options);
  }

  $grpc.ResponseFuture<$0.ProjectListReply> getProjects($0.ProjectListRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getProjects, request, options: options);
  }
}

@$pb.GrpcServiceName('schet.SchetGRPCService')
abstract class SchetGRPCServiceBase extends $grpc.Service {
  $core.String get $name => 'schet.SchetGRPCService';

  SchetGRPCServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.FilterSchet, $0.ResultSchetListView>(
        'GetSchets',
        getSchets_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FilterSchet.fromBuffer(value),
        ($0.ResultSchetListView value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FilterSchet, $0.ResultSchetView>(
        'GetSchet',
        getSchet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FilterSchet.fromBuffer(value),
        ($0.ResultSchetView value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FilterChangeStatus, $0.ResultChangeStatusSchet>(
        'ChangeStatusSchet',
        changeStatusSchet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FilterChangeStatus.fromBuffer(value),
        ($0.ResultChangeStatusSchet value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FilterResourceSchet, $0.ResultResourceSchet>(
        'GetResourcesSchet',
        getResourcesSchet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FilterResourceSchet.fromBuffer(value),
        ($0.ResultResourceSchet value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FilterPaymentScheduleSchet, $0.ResultPaymentScheduleSchet>(
        'GetPaymentSchedulesSchet',
        getPaymentSchedulesSchet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FilterPaymentScheduleSchet.fromBuffer(value),
        ($0.ResultPaymentScheduleSchet value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FileDTO, $0.ResultDownloadFile>(
        'DownloadFile',
        downloadFile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FileDTO.fromBuffer(value),
        ($0.ResultDownloadFile value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RejectSchetDTO, $0.ResultService>(
        'RejectSchet',
        rejectSchet_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RejectSchetDTO.fromBuffer(value),
        ($0.ResultService value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserListRequest, $0.UserListReply>(
        'GetUsers',
        getUsers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserListRequest.fromBuffer(value),
        ($0.UserListReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserListRequest, $0.UserListReply>(
        'GetCreators',
        getCreators_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserListRequest.fromBuffer(value),
        ($0.UserListReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ContractListRequest, $0.ContractListReply>(
        'GetContracts',
        getContracts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ContractListRequest.fromBuffer(value),
        ($0.ContractListReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CounterpartyListRequest, $0.CounterpartyListReply>(
        'GetCounterparties',
        getCounterparties_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CounterpartyListRequest.fromBuffer(value),
        ($0.CounterpartyListReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ProjectListRequest, $0.ProjectListReply>(
        'GetProjects',
        getProjects_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ProjectListRequest.fromBuffer(value),
        ($0.ProjectListReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.ResultSchetListView> getSchets_Pre($grpc.ServiceCall call, $async.Future<$0.FilterSchet> request) async {
    return getSchets(call, await request);
  }

  $async.Future<$0.ResultSchetView> getSchet_Pre($grpc.ServiceCall call, $async.Future<$0.FilterSchet> request) async {
    return getSchet(call, await request);
  }

  $async.Future<$0.ResultChangeStatusSchet> changeStatusSchet_Pre($grpc.ServiceCall call, $async.Future<$0.FilterChangeStatus> request) async {
    return changeStatusSchet(call, await request);
  }

  $async.Future<$0.ResultResourceSchet> getResourcesSchet_Pre($grpc.ServiceCall call, $async.Future<$0.FilterResourceSchet> request) async {
    return getResourcesSchet(call, await request);
  }

  $async.Future<$0.ResultPaymentScheduleSchet> getPaymentSchedulesSchet_Pre($grpc.ServiceCall call, $async.Future<$0.FilterPaymentScheduleSchet> request) async {
    return getPaymentSchedulesSchet(call, await request);
  }

  $async.Future<$0.ResultDownloadFile> downloadFile_Pre($grpc.ServiceCall call, $async.Future<$0.FileDTO> request) async {
    return downloadFile(call, await request);
  }

  $async.Future<$0.ResultService> rejectSchet_Pre($grpc.ServiceCall call, $async.Future<$0.RejectSchetDTO> request) async {
    return rejectSchet(call, await request);
  }

  $async.Future<$0.UserListReply> getUsers_Pre($grpc.ServiceCall call, $async.Future<$0.UserListRequest> request) async {
    return getUsers(call, await request);
  }

  $async.Future<$0.UserListReply> getCreators_Pre($grpc.ServiceCall call, $async.Future<$0.UserListRequest> request) async {
    return getCreators(call, await request);
  }

  $async.Future<$0.ContractListReply> getContracts_Pre($grpc.ServiceCall call, $async.Future<$0.ContractListRequest> request) async {
    return getContracts(call, await request);
  }

  $async.Future<$0.CounterpartyListReply> getCounterparties_Pre($grpc.ServiceCall call, $async.Future<$0.CounterpartyListRequest> request) async {
    return getCounterparties(call, await request);
  }

  $async.Future<$0.ProjectListReply> getProjects_Pre($grpc.ServiceCall call, $async.Future<$0.ProjectListRequest> request) async {
    return getProjects(call, await request);
  }

  $async.Future<$0.ResultSchetListView> getSchets($grpc.ServiceCall call, $0.FilterSchet request);
  $async.Future<$0.ResultSchetView> getSchet($grpc.ServiceCall call, $0.FilterSchet request);
  $async.Future<$0.ResultChangeStatusSchet> changeStatusSchet($grpc.ServiceCall call, $0.FilterChangeStatus request);
  $async.Future<$0.ResultResourceSchet> getResourcesSchet($grpc.ServiceCall call, $0.FilterResourceSchet request);
  $async.Future<$0.ResultPaymentScheduleSchet> getPaymentSchedulesSchet($grpc.ServiceCall call, $0.FilterPaymentScheduleSchet request);
  $async.Future<$0.ResultDownloadFile> downloadFile($grpc.ServiceCall call, $0.FileDTO request);
  $async.Future<$0.ResultService> rejectSchet($grpc.ServiceCall call, $0.RejectSchetDTO request);
  $async.Future<$0.UserListReply> getUsers($grpc.ServiceCall call, $0.UserListRequest request);
  $async.Future<$0.UserListReply> getCreators($grpc.ServiceCall call, $0.UserListRequest request);
  $async.Future<$0.ContractListReply> getContracts($grpc.ServiceCall call, $0.ContractListRequest request);
  $async.Future<$0.CounterpartyListReply> getCounterparties($grpc.ServiceCall call, $0.CounterpartyListRequest request);
  $async.Future<$0.ProjectListReply> getProjects($grpc.ServiceCall call, $0.ProjectListRequest request);
}
