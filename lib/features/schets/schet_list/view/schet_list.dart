import 'package:flutter/material.dart';
import 'package:myapp/features/schets/services/schet.pb.dart';

import '../../repository/schetRepo.dart';

class SchetList extends StatefulWidget {
  const SchetList({super.key});

  @override
  State<SchetList> createState() => _SchetListState();
}

class _SchetListState extends State<SchetList> {
  var _filter = SchetTerminalClient().InitFilterSchet();
  var _result = ResultSchetListView.create();
  @override
  void initState() {
    _result = SchetTerminalClient().GetSchets(_filter) as ResultSchetListView;
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
          itemBuilder: (context, i) => ListTile(
            trailing: const Icon(Icons.arrow_forward_ios),
            title: Text(_result.list[i].description),
            onTap: () {},
          ),
          separatorBuilder: (context, i) => const Divider(),
          itemCount: _result.count,
        ));
  }
}
