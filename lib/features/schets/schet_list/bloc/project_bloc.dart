import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/generated/schet.pb.dart';
import 'package:rxdart/rxdart.dart';

import '../../repository/abstractSchetRepository.dart';

class ProjectListEvent {
  ProjectListAction type = ProjectListAction.GetAll;
  ProjectListRequest payload = ProjectListRequest();
}

enum ProjectListAction {
  GetAll,
}

class ProjectListBloc {
  late List<ProjectFilter> projects;

  final _stateStreamContorller = BehaviorSubject<List<ProjectFilter>>();

  StreamSink<List<ProjectFilter>> get projectListSink =>
      _stateStreamContorller.sink;
  Stream<List<ProjectFilter>> get projectListStream =>
      _stateStreamContorller.stream;

  // final _eventStreamContorller = StreamController<UserListAction>();

  // StreamSink<UserListAction> get eventSink => _eventStreamContorller.sink;
  // Stream<UserListAction> get eventStream => _eventStreamContorller.stream;
  final _eventStreamContorller = StreamController<ProjectListEvent>();

  void dispose() {
    _stateStreamContorller.close();
  }

  StreamSink<ProjectListEvent> get eventSink => _eventStreamContorller.sink;
  Stream<ProjectListEvent> get eventStream => _eventStreamContorller.stream;

  Future<void> getProjects(ProjectListRequest payload) async {
    // var getProjects = () async => {
    var _result = await GetIt.I<AbstractSchetRepository>().GetProjects(payload);
    if (_result.succsecced) {
      payload.take += 20;
      projects = _result.projects;
      projectListSink.add(projects);
    }
  }

  ProjectListBloc() {
    projects = [];
    eventStream.listen((event) async {
      if (event.type == ProjectListAction.GetAll) {
        await getProjects(event.payload);
      }
    });
  }
}
