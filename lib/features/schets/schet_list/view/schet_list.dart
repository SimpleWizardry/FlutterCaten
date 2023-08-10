import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/features/schets/repository/abstractSchetRepository.dart';
import 'package:myapp/features/schets/services/schet.pb.dart';

import '../../repository/schetRepository.dart';
import '../bloc/schet_list_bloc.dart';
import '../widgets/schet_card.dart';

class SchetList extends StatefulWidget {
  const SchetList({super.key});

  @override
  State<SchetList> createState() => _SchetListState();
}

class _SchetListState extends State<SchetList> {
  ScrollController _scrollController = new ScrollController();
  var _filter = GetIt.I<AbstractSchetRepository>().InitFilterSchet();
  var _result = ResultSchetListView.create();
  final _schetListBloc = SchetListBloc(GetIt.I<AbstractSchetRepository>(),
      GetIt.I<AbstractSchetRepository>().InitFilterSchet());
  var stateGetSchet = 1;
  // 0 - load;
  // 1  - succssed;
  // 2 - error
  var _totalCount = 0;
  List<SchetListView> list = [];

  @override
  void initState() {
    _schetListBloc.add(LoadSchetList(true));
    setState(() => _filter = _filter);
    setState(() => _result = _result);
    _scrollController.addListener(_scrolListner);
    super.initState();
  }

  void _scrolListner() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        _result.list.length != _totalCount) {
      _schetListBloc.add(LoadSchetList(false));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Список счетов'),
        ),
        body: BlocBuilder<SchetListBloc, SchetListState>(
          bloc: _schetListBloc,
          builder: (context, state) {
            if (state is SchetListInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (state is SchetListSuccessed) {
                list = [...list, ...state.listSchets];
                _totalCount = state.totalCount;
              }
              return ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(10.0),
                itemBuilder: (context, i) {
                  if (state is SchetListSuccessed) {
                    if (i < list.length) {
                      return SchetCard(schet: list[i]);
                    }
                  }
                    if (state is SchetListLoading) {
                      return const Card(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (state is SchetListFailure) {
                      return Card(
                        child: Center(
                          child: Text(
                            state.errorMessage,
                            style: const TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      );

                  }
                  return const Center(
                    child: Text('Произошла ошибка',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w900)),
                  );
                },
                itemCount:  state is SchetListSuccessed ?  list.length + 1 : list.length
              );
            }
          },
        ));
  }
}
