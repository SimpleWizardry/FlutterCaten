//
//  Generated code. Do not modify.
//  source: schet.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use resultSchetListViewDescriptor instead')
const ResultSchetListView$json = {
  '1': 'ResultSchetListView',
  '2': [
    {'1': 'List', '3': 1, '4': 3, '5': 11, '6': '.schet.SchetListView', '10': 'List'},
    {'1': 'Count', '3': 2, '4': 1, '5': 5, '10': 'Count'},
    {'1': 'Succssed', '3': 3, '4': 1, '5': 8, '10': 'Succssed'},
    {'1': 'Message', '3': 4, '4': 1, '5': 9, '10': 'Message'},
  ],
};

/// Descriptor for `ResultSchetListView`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resultSchetListViewDescriptor = $convert.base64Decode(
    'ChNSZXN1bHRTY2hldExpc3RWaWV3EigKBExpc3QYASADKAsyFC5zY2hldC5TY2hldExpc3RWaW'
    'V3UgRMaXN0EhQKBUNvdW50GAIgASgFUgVDb3VudBIaCghTdWNjc3NlZBgDIAEoCFIIU3VjY3Nz'
    'ZWQSGAoHTWVzc2FnZRgEIAEoCVIHTWVzc2FnZQ==');

@$core.Deprecated('Use resultSchetViewDescriptor instead')
const ResultSchetView$json = {
  '1': 'ResultSchetView',
  '2': [
    {'1': 'Schet', '3': 1, '4': 1, '5': 11, '6': '.schet.SchetView', '10': 'Schet'},
    {'1': 'Succssed', '3': 2, '4': 1, '5': 8, '10': 'Succssed'},
    {'1': 'Message', '3': 3, '4': 1, '5': 9, '10': 'Message'},
  ],
};

/// Descriptor for `ResultSchetView`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resultSchetViewDescriptor = $convert.base64Decode(
    'Cg9SZXN1bHRTY2hldFZpZXcSJgoFU2NoZXQYASABKAsyEC5zY2hldC5TY2hldFZpZXdSBVNjaG'
    'V0EhoKCFN1Y2Nzc2VkGAIgASgIUghTdWNjc3NlZBIYCgdNZXNzYWdlGAMgASgJUgdNZXNzYWdl');

@$core.Deprecated('Use filterSchetDescriptor instead')
const FilterSchet$json = {
  '1': 'FilterSchet',
  '2': [
    {'1': 'AllOrders', '3': 1, '4': 1, '5': 8, '10': 'AllOrders'},
    {'1': 'BudgetIds', '3': 2, '4': 3, '5': 9, '10': 'BudgetIds'},
    {'1': 'DocumentId', '3': 3, '4': 3, '5': 9, '10': 'DocumentId'},
    {'1': 'MatchingStatus', '3': 4, '4': 1, '5': 9, '10': 'MatchingStatus'},
    {'1': 'Messages', '3': 5, '4': 3, '5': 9, '10': 'Messages'},
    {'1': 'Schet', '3': 6, '4': 1, '5': 8, '10': 'Schet'},
    {'1': 'SchetStatus', '3': 7, '4': 3, '5': 9, '10': 'SchetStatus'},
    {'1': 'ShowAll', '3': 8, '4': 1, '5': 8, '10': 'ShowAll'},
    {'1': 'ShowFromContract', '3': 9, '4': 1, '5': 8, '10': 'ShowFromContract'},
    {'1': 'Skip', '3': 10, '4': 1, '5': 5, '10': 'Skip'},
    {'1': 'Take', '3': 11, '4': 1, '5': 5, '10': 'Take'},
    {'1': 'UserId', '3': 12, '4': 1, '5': 9, '10': 'UserId'},
    {'1': 'WithChildDocs', '3': 13, '4': 1, '5': 8, '10': 'WithChildDocs'},
    {'1': 'Id', '3': 14, '4': 1, '5': 9, '10': 'Id'},
    {'1': 'NomenclatureName', '3': 15, '4': 1, '5': 9, '10': 'NomenclatureName'},
    {'1': 'ContractId', '3': 16, '4': 1, '5': 9, '10': 'ContractId'},
    {'1': 'DateFrom', '3': 17, '4': 1, '5': 9, '10': 'DateFrom'},
    {'1': 'DateTo', '3': 18, '4': 1, '5': 9, '10': 'DateTo'},
    {'1': 'PayingOrganizationId', '3': 19, '4': 1, '5': 9, '10': 'PayingOrganizationId'},
    {'1': 'ApplicationUserId', '3': 20, '4': 1, '5': 9, '10': 'ApplicationUserId'},
    {'1': 'DirectoryCounterpartiesId', '3': 21, '4': 1, '5': 9, '10': 'DirectoryCounterpartiesId'},
    {'1': 'NumberSchet', '3': 22, '4': 1, '5': 9, '10': 'NumberSchet'},
    {'1': 'Description', '3': 23, '4': 1, '5': 9, '10': 'Description'},
    {'1': 'NumberTTNOrOrder', '3': 24, '4': 1, '5': 9, '10': 'NumberTTNOrOrder'},
    {'1': 'SummaMin', '3': 25, '4': 1, '5': 1, '10': 'SummaMin'},
    {'1': 'SummaMax', '3': 26, '4': 1, '5': 1, '10': 'SummaMax'},
    {'1': 'NumberPayment', '3': 27, '4': 1, '5': 9, '10': 'NumberPayment'},
    {'1': 'PaymentCheck', '3': 28, '4': 1, '5': 5, '10': 'PaymentCheck'},
    {'1': 'WarehouseId', '3': 29, '4': 1, '5': 9, '10': 'WarehouseId'},
    {'1': 'SetUserId', '3': 30, '4': 1, '5': 9, '10': 'SetUserId'},
    {'1': 'ResourceId', '3': 31, '4': 1, '5': 9, '10': 'ResourceId'},
  ],
};

/// Descriptor for `FilterSchet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List filterSchetDescriptor = $convert.base64Decode(
    'CgtGaWx0ZXJTY2hldBIcCglBbGxPcmRlcnMYASABKAhSCUFsbE9yZGVycxIcCglCdWRnZXRJZH'
    'MYAiADKAlSCUJ1ZGdldElkcxIeCgpEb2N1bWVudElkGAMgAygJUgpEb2N1bWVudElkEiYKDk1h'
    'dGNoaW5nU3RhdHVzGAQgASgJUg5NYXRjaGluZ1N0YXR1cxIaCghNZXNzYWdlcxgFIAMoCVIITW'
    'Vzc2FnZXMSFAoFU2NoZXQYBiABKAhSBVNjaGV0EiAKC1NjaGV0U3RhdHVzGAcgAygJUgtTY2hl'
    'dFN0YXR1cxIYCgdTaG93QWxsGAggASgIUgdTaG93QWxsEioKEFNob3dGcm9tQ29udHJhY3QYCS'
    'ABKAhSEFNob3dGcm9tQ29udHJhY3QSEgoEU2tpcBgKIAEoBVIEU2tpcBISCgRUYWtlGAsgASgF'
    'UgRUYWtlEhYKBlVzZXJJZBgMIAEoCVIGVXNlcklkEiQKDVdpdGhDaGlsZERvY3MYDSABKAhSDV'
    'dpdGhDaGlsZERvY3MSDgoCSWQYDiABKAlSAklkEioKEE5vbWVuY2xhdHVyZU5hbWUYDyABKAlS'
    'EE5vbWVuY2xhdHVyZU5hbWUSHgoKQ29udHJhY3RJZBgQIAEoCVIKQ29udHJhY3RJZBIaCghEYX'
    'RlRnJvbRgRIAEoCVIIRGF0ZUZyb20SFgoGRGF0ZVRvGBIgASgJUgZEYXRlVG8SMgoUUGF5aW5n'
    'T3JnYW5pemF0aW9uSWQYEyABKAlSFFBheWluZ09yZ2FuaXphdGlvbklkEiwKEUFwcGxpY2F0aW'
    '9uVXNlcklkGBQgASgJUhFBcHBsaWNhdGlvblVzZXJJZBI8ChlEaXJlY3RvcnlDb3VudGVycGFy'
    'dGllc0lkGBUgASgJUhlEaXJlY3RvcnlDb3VudGVycGFydGllc0lkEiAKC051bWJlclNjaGV0GB'
    'YgASgJUgtOdW1iZXJTY2hldBIgCgtEZXNjcmlwdGlvbhgXIAEoCVILRGVzY3JpcHRpb24SKgoQ'
    'TnVtYmVyVFROT3JPcmRlchgYIAEoCVIQTnVtYmVyVFROT3JPcmRlchIaCghTdW1tYU1pbhgZIA'
    'EoAVIIU3VtbWFNaW4SGgoIU3VtbWFNYXgYGiABKAFSCFN1bW1hTWF4EiQKDU51bWJlclBheW1l'
    'bnQYGyABKAlSDU51bWJlclBheW1lbnQSIgoMUGF5bWVudENoZWNrGBwgASgFUgxQYXltZW50Q2'
    'hlY2sSIAoLV2FyZWhvdXNlSWQYHSABKAlSC1dhcmVob3VzZUlkEhwKCVNldFVzZXJJZBgeIAEo'
    'CVIJU2V0VXNlcklkEh4KClJlc291cmNlSWQYHyABKAlSClJlc291cmNlSWQ=');

@$core.Deprecated('Use schetListViewDescriptor instead')
const SchetListView$json = {
  '1': 'SchetListView',
  '2': [
    {'1': 'Id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    {'1': 'CounterpartyName', '3': 2, '4': 1, '5': 9, '10': 'CounterpartyName'},
    {'1': 'ObjectsAccountSchets', '3': 3, '4': 3, '5': 11, '6': '.schet.ObjectAccountSchet', '10': 'ObjectsAccountSchets'},
    {'1': 'Summa', '3': 4, '4': 1, '5': 1, '10': 'Summa'},
    {'1': 'Date', '3': 5, '4': 1, '5': 9, '10': 'Date'},
    {'1': 'Number', '3': 6, '4': 1, '5': 9, '10': 'Number'},
    {'1': 'Description', '3': 7, '4': 1, '5': 9, '10': 'Description'},
    {'1': 'Status', '3': 8, '4': 1, '5': 11, '6': '.schet.StatusSchetDTO', '10': 'Status'},
  ],
};

/// Descriptor for `SchetListView`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List schetListViewDescriptor = $convert.base64Decode(
    'Cg1TY2hldExpc3RWaWV3Eg4KAklkGAEgASgJUgJJZBIqChBDb3VudGVycGFydHlOYW1lGAIgAS'
    'gJUhBDb3VudGVycGFydHlOYW1lEk0KFE9iamVjdHNBY2NvdW50U2NoZXRzGAMgAygLMhkuc2No'
    'ZXQuT2JqZWN0QWNjb3VudFNjaGV0UhRPYmplY3RzQWNjb3VudFNjaGV0cxIUCgVTdW1tYRgEIA'
    'EoAVIFU3VtbWESEgoERGF0ZRgFIAEoCVIERGF0ZRIWCgZOdW1iZXIYBiABKAlSBk51bWJlchIg'
    'CgtEZXNjcmlwdGlvbhgHIAEoCVILRGVzY3JpcHRpb24SLQoGU3RhdHVzGAggASgLMhUuc2NoZX'
    'QuU3RhdHVzU2NoZXREVE9SBlN0YXR1cw==');

@$core.Deprecated('Use objectAccountSchetDescriptor instead')
const ObjectAccountSchet$json = {
  '1': 'ObjectAccountSchet',
  '2': [
    {'1': 'Id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    {'1': 'Name', '3': 2, '4': 1, '5': 9, '10': 'Name'},
    {'1': 'Type', '3': 3, '4': 1, '5': 9, '10': 'Type'},
    {'1': 'UserId', '3': 4, '4': 1, '5': 9, '10': 'UserId'},
  ],
};

/// Descriptor for `ObjectAccountSchet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List objectAccountSchetDescriptor = $convert.base64Decode(
    'ChJPYmplY3RBY2NvdW50U2NoZXQSDgoCSWQYASABKAlSAklkEhIKBE5hbWUYAiABKAlSBE5hbW'
    'USEgoEVHlwZRgDIAEoCVIEVHlwZRIWCgZVc2VySWQYBCABKAlSBlVzZXJJZA==');

@$core.Deprecated('Use schetViewDescriptor instead')
const SchetView$json = {
  '1': 'SchetView',
  '2': [
    {'1': 'Id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    {'1': 'CounterpartyName', '3': 2, '4': 1, '5': 9, '10': 'CounterpartyName'},
    {'1': 'ObjectsAccountSchets', '3': 3, '4': 3, '5': 11, '6': '.schet.ObjectAccountSchet', '10': 'ObjectsAccountSchets'},
    {'1': 'Summa', '3': 4, '4': 1, '5': 1, '10': 'Summa'},
    {'1': 'Date', '3': 5, '4': 1, '5': 9, '10': 'Date'},
    {'1': 'Number', '3': 6, '4': 1, '5': 9, '10': 'Number'},
    {'1': 'PayingOrganizationName', '3': 7, '4': 1, '5': 9, '10': 'PayingOrganizationName'},
    {'1': 'CreaterName', '3': 8, '4': 1, '5': 9, '10': 'CreaterName'},
    {'1': 'Description', '3': 9, '4': 1, '5': 9, '10': 'Description'},
    {'1': 'File', '3': 10, '4': 1, '5': 11, '6': '.schet.File', '10': 'File'},
    {'1': 'Status', '3': 11, '4': 1, '5': 11, '6': '.schet.StatusSchetDTO', '10': 'Status'},
  ],
};

/// Descriptor for `SchetView`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List schetViewDescriptor = $convert.base64Decode(
    'CglTY2hldFZpZXcSDgoCSWQYASABKAlSAklkEioKEENvdW50ZXJwYXJ0eU5hbWUYAiABKAlSEE'
    'NvdW50ZXJwYXJ0eU5hbWUSTQoUT2JqZWN0c0FjY291bnRTY2hldHMYAyADKAsyGS5zY2hldC5P'
    'YmplY3RBY2NvdW50U2NoZXRSFE9iamVjdHNBY2NvdW50U2NoZXRzEhQKBVN1bW1hGAQgASgBUg'
    'VTdW1tYRISCgREYXRlGAUgASgJUgREYXRlEhYKBk51bWJlchgGIAEoCVIGTnVtYmVyEjYKFlBh'
    'eWluZ09yZ2FuaXphdGlvbk5hbWUYByABKAlSFlBheWluZ09yZ2FuaXphdGlvbk5hbWUSIAoLQ3'
    'JlYXRlck5hbWUYCCABKAlSC0NyZWF0ZXJOYW1lEiAKC0Rlc2NyaXB0aW9uGAkgASgJUgtEZXNj'
    'cmlwdGlvbhIfCgRGaWxlGAogASgLMgsuc2NoZXQuRmlsZVIERmlsZRItCgZTdGF0dXMYCyABKA'
    'syFS5zY2hldC5TdGF0dXNTY2hldERUT1IGU3RhdHVz');

@$core.Deprecated('Use fileDescriptor instead')
const File$json = {
  '1': 'File',
  '2': [
    {'1': 'Id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    {'1': 'Path', '3': 2, '4': 1, '5': 9, '10': 'Path'},
    {'1': 'Name', '3': 3, '4': 1, '5': 9, '10': 'Name'},
  ],
};

/// Descriptor for `File`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fileDescriptor = $convert.base64Decode(
    'CgRGaWxlEg4KAklkGAEgASgJUgJJZBISCgRQYXRoGAIgASgJUgRQYXRoEhIKBE5hbWUYAyABKA'
    'lSBE5hbWU=');

@$core.Deprecated('Use statusSchetDTODescriptor instead')
const StatusSchetDTO$json = {
  '1': 'StatusSchetDTO',
  '2': [
    {'1': 'Name', '3': 1, '4': 1, '5': 9, '10': 'Name'},
    {'1': 'Number', '3': 2, '4': 1, '5': 5, '10': 'Number'},
  ],
};

/// Descriptor for `StatusSchetDTO`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statusSchetDTODescriptor = $convert.base64Decode(
    'Cg5TdGF0dXNTY2hldERUTxISCgROYW1lGAEgASgJUgROYW1lEhYKBk51bWJlchgCIAEoBVIGTn'
    'VtYmVy');

@$core.Deprecated('Use filterChangeStatusDescriptor instead')
const FilterChangeStatus$json = {
  '1': 'FilterChangeStatus',
  '2': [
    {'1': 'SchetId', '3': 1, '4': 1, '5': 9, '10': 'SchetId'},
    {'1': 'Number', '3': 2, '4': 1, '5': 5, '10': 'Number'},
  ],
};

/// Descriptor for `FilterChangeStatus`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List filterChangeStatusDescriptor = $convert.base64Decode(
    'ChJGaWx0ZXJDaGFuZ2VTdGF0dXMSGAoHU2NoZXRJZBgBIAEoCVIHU2NoZXRJZBIWCgZOdW1iZX'
    'IYAiABKAVSBk51bWJlcg==');

@$core.Deprecated('Use resultChangeStatusSchetDescriptor instead')
const ResultChangeStatusSchet$json = {
  '1': 'ResultChangeStatusSchet',
  '2': [
    {'1': 'Succssed', '3': 1, '4': 1, '5': 8, '10': 'Succssed'},
    {'1': 'Status', '3': 2, '4': 1, '5': 11, '6': '.schet.StatusSchetDTO', '10': 'Status'},
    {'1': 'messageServer', '3': 3, '4': 1, '5': 9, '10': 'messageServer'},
  ],
};

/// Descriptor for `ResultChangeStatusSchet`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resultChangeStatusSchetDescriptor = $convert.base64Decode(
    'ChdSZXN1bHRDaGFuZ2VTdGF0dXNTY2hldBIaCghTdWNjc3NlZBgBIAEoCFIIU3VjY3NzZWQSLQ'
    'oGU3RhdHVzGAIgASgLMhUuc2NoZXQuU3RhdHVzU2NoZXREVE9SBlN0YXR1cxIkCg1tZXNzYWdl'
    'U2VydmVyGAMgASgJUg1tZXNzYWdlU2VydmVy');

