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
  final clientApp = SchetTerminalClient();
  var _filter = SchetTerminalClient().InitFilterSchet();
  var _result = ResultSchetListView.create();
  var list = [];

  Future<void> GetSchets() async {
    _result = await clientApp.GetSchets(_filter);
    if(_result.succssed) {
      list.addAll(_result.list);
    }
    setState(() {});
  }
  @override
  void initState() {
    GetSchets();
    setState(() => _filter = _filter);
    setState(() => _result = _result);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Список счетов'),
        ),
        body: ListView.separated(
          itemBuilder: (context, i) => SchetCard(schet: list[i]),
          separatorBuilder: (context, i) => const Divider(),
          itemCount: list.length,
        ));
  }
}
