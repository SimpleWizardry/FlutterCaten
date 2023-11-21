import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/generated/schet.pb.dart';
import 'package:rxdart/rxdart.dart';

import '../../repository/abstractSchetRepository.dart';

class UserListEvent {
  UserListAction type = UserListAction.GetAll;
  UserListRequest payload = new UserListRequest();
}

enum UserListAction { GetAll, GetCreators }

class ListUserBloc {
  late List<UserFilter> users;

  final _stateStreamContorller = BehaviorSubject<List<UserFilter>>();
  // final _stateStreamContorller = StreamController<List<UserFilter>>();

  StreamSink<List<UserFilter>> get userListSink => _stateStreamContorller.sink;
  Stream<List<UserFilter>> get userListStream => _stateStreamContorller.stream;

  // final _eventStreamContorller = StreamController<UserListAction>();

  // StreamSink<UserListAction> get eventSink => _eventStreamContorller.sink;
  // Stream<UserListAction> get eventStream => _eventStreamContorller.stream;
  final _eventStreamContorller = StreamController<UserListEvent>();

  void dispose() {
    _stateStreamContorller.close();
  }

  StreamSink<UserListEvent> get eventSink => _eventStreamContorller.sink;
  Stream<UserListEvent> get eventStream => _eventStreamContorller.stream;

  Future<void> getAllUsers(UserListRequest payload, bool creators) async {
    // var getAllUsers = () async => {

    var _result = new UserListReply();
    if (creators) {
      _result = await GetIt.I<AbstractSchetRepository>().GetCreators(payload);
    } else {
      _result = await GetIt.I<AbstractSchetRepository>().GetUsers(payload);
    }

    // debugPrint(_result.toString());
    if (_result.succsecced) {
      // debugPrint(_result.toString());
      // filterSchet.skip += 20;
      payload.skip += 20;
      users = _result.users;
      userListSink.add(users);
    }
  }

  ListUserBloc() {
    users = [];
    eventStream.listen((event) async {
      if (event.type == UserListAction.GetAll) {
        await getAllUsers(event.payload, false);
      } else if (event.type == UserListAction.GetCreators) {
        await getAllUsers(event.payload, true);
      }
    });
  }
}
