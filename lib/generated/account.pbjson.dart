//
//  Generated code. Do not modify.
//  source: account.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = {
  '1': 'LoginRequest',
  '2': [
    {'1': 'login', '3': 1, '4': 1, '5': 9, '10': 'login'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode(
    'CgxMb2dpblJlcXVlc3QSFAoFbG9naW4YASABKAlSBWxvZ2luEhoKCHBhc3N3b3JkGAIgASgJUg'
    'hwYXNzd29yZA==');

@$core.Deprecated('Use loginReplyDescriptor instead')
const LoginReply$json = {
  '1': 'LoginReply',
  '2': [
    {'1': 'succsecced', '3': 1, '4': 1, '5': 8, '10': 'succsecced'},
    {'1': 'messageServer', '3': 2, '4': 1, '5': 9, '10': 'messageServer'},
    {'1': 'jwt', '3': 3, '4': 1, '5': 9, '10': 'jwt'},
    {'1': 'user', '3': 4, '4': 1, '5': 11, '6': '.account.User', '10': 'user'},
  ],
};

/// Descriptor for `LoginReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginReplyDescriptor = $convert.base64Decode(
    'CgpMb2dpblJlcGx5Eh4KCnN1Y2NzZWNjZWQYASABKAhSCnN1Y2NzZWNjZWQSJAoNbWVzc2FnZV'
    'NlcnZlchgCIAEoCVINbWVzc2FnZVNlcnZlchIQCgNqd3QYAyABKAlSA2p3dBIhCgR1c2VyGAQg'
    'ASgLMg0uYWNjb3VudC5Vc2VyUgR1c2Vy');

@$core.Deprecated('Use userDescriptor instead')
const User$json = {
  '1': 'User',
  '2': [
    {'1': 'Id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    {'1': 'LastName', '3': 2, '4': 1, '5': 9, '10': 'LastName'},
    {'1': 'MiddleName', '3': 3, '4': 1, '5': 9, '10': 'MiddleName'},
    {'1': 'FirstName', '3': 4, '4': 1, '5': 9, '10': 'FirstName'},
    {'1': 'UserName', '3': 5, '4': 1, '5': 9, '10': 'UserName'},
    {'1': 'Email', '3': 6, '4': 1, '5': 9, '10': 'Email'},
    {'1': 'Roles', '3': 7, '4': 3, '5': 11, '6': '.account.Role', '10': 'Roles'},
    {'1': 'User1CId', '3': 8, '4': 1, '5': 9, '10': 'User1CId'},
    {'1': 'FullName', '3': 9, '4': 1, '5': 9, '10': 'FullName'},
    {'1': 'Fired', '3': 10, '4': 1, '5': 8, '10': 'Fired'},
  ],
};

/// Descriptor for `User`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDescriptor = $convert.base64Decode(
    'CgRVc2VyEg4KAklkGAEgASgJUgJJZBIaCghMYXN0TmFtZRgCIAEoCVIITGFzdE5hbWUSHgoKTW'
    'lkZGxlTmFtZRgDIAEoCVIKTWlkZGxlTmFtZRIcCglGaXJzdE5hbWUYBCABKAlSCUZpcnN0TmFt'
    'ZRIaCghVc2VyTmFtZRgFIAEoCVIIVXNlck5hbWUSFAoFRW1haWwYBiABKAlSBUVtYWlsEiMKBV'
    'JvbGVzGAcgAygLMg0uYWNjb3VudC5Sb2xlUgVSb2xlcxIaCghVc2VyMUNJZBgIIAEoCVIIVXNl'
    'cjFDSWQSGgoIRnVsbE5hbWUYCSABKAlSCEZ1bGxOYW1lEhQKBUZpcmVkGAogASgIUgVGaXJlZA'
    '==');

@$core.Deprecated('Use roleDescriptor instead')
const Role$json = {
  '1': 'Role',
  '2': [
    {'1': 'Id', '3': 1, '4': 1, '5': 9, '10': 'Id'},
    {'1': 'Info', '3': 2, '4': 1, '5': 9, '10': 'Info'},
    {'1': 'Name', '3': 3, '4': 1, '5': 9, '10': 'Name'},
  ],
};

/// Descriptor for `Role`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roleDescriptor = $convert.base64Decode(
    'CgRSb2xlEg4KAklkGAEgASgJUgJJZBISCgRJbmZvGAIgASgJUgRJbmZvEhIKBE5hbWUYAyABKA'
    'lSBE5hbWU=');

