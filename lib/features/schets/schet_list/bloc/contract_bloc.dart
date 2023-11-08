import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/generated/schet.pb.dart';
import 'package:rxdart/rxdart.dart';

import '../../repository/abstractSchetRepository.dart';

class ContractListEvent {
  ContractListAction type = ContractListAction.GetAll;
  ContractListRequest payload = ContractListRequest();
}

enum ContractListAction
{
  GetAll,
}

class ContractListBloc {
  late List<ContractFilter> contracts;

  final _stateStreamContorller = BehaviorSubject<List<ContractFilter>>();

  StreamSink<List<ContractFilter>> get contractListSink => _stateStreamContorller.sink;
  Stream<List<ContractFilter>> get contractListStream => _stateStreamContorller.stream;

  // final _eventStreamContorller = StreamController<UserListAction>();

  // StreamSink<UserListAction> get eventSink => _eventStreamContorller.sink;
  // Stream<UserListAction> get eventStream => _eventStreamContorller.stream;
  final _eventStreamContorller = StreamController<ContractListEvent>();

  StreamSink<ContractListEvent> get eventSink => _eventStreamContorller.sink;
  Stream<ContractListEvent> get eventStream => _eventStreamContorller.stream;

  void dispose() {
    _stateStreamContorller.close();
  }

  Future<void> getAllContracts(ContractListRequest payload) async {
  // var getAllUsers = () async => {
    var _result = await GetIt.I<AbstractSchetRepository>().GetContracts(payload);
    if (_result.succsecced) {
      // debugPrint('contracts' + _result.contracts.toString());
      payload.take += 20;
      contracts = _result.contracts;
      contractListSink.add(contracts);
    }
  }

  ContractListBloc() {
    contracts = [];
    eventStream.listen((event) async { 
      if (event.type == ContractListAction.GetAll) {
        await getAllContracts(event.payload);
      }
    });
  }
}