import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/features/schets/schet_tabs/widgets/schet_resource_card.dart';

import '../../../../generated/schet.pb.dart';
import '../../repository/abstractSchetRepository.dart';
import '../../schet_list/bloc/schet_list_bloc.dart';
// import '../../services/schet.pb.dart';
import '../bloc/schet_resource_list_bloc.dart';

class SchetResourceList extends StatefulWidget {
  final String id;
  const SchetResourceList({super.key, required this.id});

  @override
  State<SchetResourceList> createState() => _SchetResourceListState();
}

class _SchetResourceListState extends State<SchetResourceList> {
  ScrollController _scrollController = new ScrollController();
  final _schetResourceListBloc = SchetResourceListBloc(
      GetIt.I<AbstractSchetRepository>(),
      GetIt.I<AbstractSchetRepository>().initFilterResourceSchet());
  var _totalCount = 0;
  List<ResourceSchet> list = [];

  @override
  void initState() {
    _schetResourceListBloc.add(SchetResourceListLoad(true, id: widget.id));
    _scrollController.addListener(_scrolListner);
    super.initState();
  }

  void _scrolListner() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        list.length != _totalCount) {
      _schetResourceListBloc.add(SchetResourceListLoad(true, id: widget.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SchetResourceListBloc, SchetResourceListState>(
      bloc: _schetResourceListBloc,
      builder: (context, state) {
        if (state is SchetListInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (state is SchetResourceListSuccessed) {
            list = [...list, ...state.listResources];
            _totalCount = state.totalCount;
          }
          return ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(10.0),
              itemBuilder: (context, i) {
                if (state is SchetResourceListSuccessed) {
                  if (i < list.length) {
                    return SchetResourceCard(resource: list[i]);
                  }
                  return const SizedBox();
                }
                if (state is SchetResourceListLoading) {
                  return const Card(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is SchetResourceListFailure) {
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
              itemCount: state is SchetResourceListSuccessed
                  ? list.length + 1
                  : list.length);
        }
      },
    );
  }
}
