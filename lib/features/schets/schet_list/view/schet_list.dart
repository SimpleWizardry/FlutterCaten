import 'package:flutter/material.dart';
import 'package:myapp/features/schets/services/schet.pb.dart';

import '../../repository/schetRepo.dart';
import '../widgets/schet_card.dart';

class SchetList extends StatefulWidget {
  const SchetList({super.key});

  @override
  State<SchetList> createState() => _SchetListState();
}

class _SchetListState extends State<SchetList> {

  ScrollController _scrollController = new ScrollController();
  final clientApp = SchetTerminalClient();
  var _filter = SchetTerminalClient().InitFilterSchet();
  var _result = ResultSchetListView.create();
  var stateGetSchet = 1;
  // 0 - load;
  // 1  - succssed;
  // 2 - error
  var _totalCount = 0;
  var list = [];


  @override
  void initState() {
    getSchets();
    setState(() => _filter = _filter);
    setState(() => _result = _result);
    _scrollController.addListener(_scrolListner);
    super.initState();
  }
  Future<void> getSchets() async {
    setState(() {
      stateGetSchet = 0;
    });
    _result = await clientApp.GetSchets(_filter);
    if(_result.succssed) {
      _filter.skip += 20;
      list.addAll(_result.list);
      _totalCount = _result.count;
      setState(() {
        stateGetSchet = 1;
      });
    } else {
      setState(() {
        stateGetSchet = 2;
      });
    }
    setState(() {});
  }

  void _scrolListner(){
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent && _result.list.length != _totalCount){
      getSchets();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Список счетов'),
        ),
        body: ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.all(10.0),
          itemBuilder: (context, i) {
            if(i < list.length){
             return SchetCard(schet: list[i]);
            } else {
              if(stateGetSchet == 0){
                return const Card(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if(stateGetSchet == 2){
                return const Card(
                  child: Center(
                    child: Text('Не удалось получить данные с сервера',
                    style: TextStyle(color: Colors.red),),
                  ),
                );
              }
            }
          },
          itemCount: stateGetSchet != 1 ?  list.length + 1 : list.length,
        ));
  }
}
