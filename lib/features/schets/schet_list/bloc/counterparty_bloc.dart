import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/generated/schet.pb.dart';
import 'package:rxdart/rxdart.dart';

import '../../repository/abstractSchetRepository.dart';

class CounterpartyListEvent {
  CounterpartyListAction type = CounterpartyListAction.GetAll;
  CounterpartyListRequest payload = CounterpartyListRequest();
}

enum CounterpartyListAction
{
  GetAll,
}

class CounterpartyListBloc {
  late List<CounterpartyFilter> counterparties;

  final _stateStreamContorller = BehaviorSubject<List<CounterpartyFilter>>();

  StreamSink<List<CounterpartyFilter>> get counterpartyListSink => _stateStreamContorller.sink;
  Stream<List<CounterpartyFilter>> get counterpartyListStream => _stateStreamContorller.stream;

  // final _eventStreamContorller = StreamController<UserListAction>();

  // StreamSink<UserListAction> get eventSink => _eventStreamContorller.sink;
  // Stream<UserListAction> get eventStream => _eventStreamContorller.stream;
  final _eventStreamContorller = StreamController<CounterpartyListEvent>();

  void dispose() {
    _stateStreamContorller.close();
  }

  StreamSink<CounterpartyListEvent> get eventSink => _eventStreamContorller.sink;
  Stream<CounterpartyListEvent> get eventStream => _eventStreamContorller.stream;

  Future<void> getCounterparties(CounterpartyListRequest payload) async {
  // var getAllUsers = () async => {
    var _result = await GetIt.I<AbstractSchetRepository>().GetCounterparties(payload);
    if (_result.succsecced) {
      debugPrint('cntrprts');
      payload.take += 20;
      counterparties = _result.counterparties;
      counterpartyListSink.add(counterparties);
    }
  }

  CounterpartyListBloc() {
    counterparties = [];
    eventStream.listen((event) async { 
      if (event.type == CounterpartyListAction.GetAll) {
        debugPrint(event.toString());
        await getCounterparties(event.payload);
      }
    });
  }
}