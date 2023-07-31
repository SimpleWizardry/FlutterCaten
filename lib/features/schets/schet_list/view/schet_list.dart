import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
  final _storage = const FlutterSecureStorage();

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  Future<void> GetSchets() async {
    _result = await clientApp.GetSchets(_filter);
    // debugPrint(_result.toString());
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

  Future<void> _logout() async {
    await _storage.delete(
      key: "token",
      aOptions: _getAndroidOptions(),
    );
    Navigator.of(context).pushNamed('/login');
  }


Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog.fullscreen(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            // color: Colors.blue,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // child: Text('media size'),
            child: Column (children: [
              Align(
                alignment: Alignment.bottomRight,
                child: FilledButton(
                  
                  onPressed: () {
                  },
                  child: const Text(
                    'Сохранить',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],)
          )
          // title: const Text('Basic dialog title'),
          // content: const Text(
          //   'A dialog is a type of modal window that\n'
          //   'appears in front of app content to\n'
          //   'provide critical information, or prompt\n'
          //   'for a decision to be made.',
          // ),
          // actions: <Widget>[
          //   TextButton(
          //     style: TextButton.styleFrom(
          //       textStyle: Theme.of(context).textTheme.labelLarge,
          //     ),
          //     child: const Text('Disable'),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          //   TextButton(
          //     style: TextButton.styleFrom(
          //       textStyle: Theme.of(context).textTheme.labelLarge,
          //     ),
          //     child: const Text('Enable'),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Список счетов'),
          actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Выйти',
            onPressed: () {
              _logout();
            },
          ),]
        ),
        body: ListView.separated(
          itemBuilder: (context, i) => SchetCard(schet: list[i]),
          separatorBuilder: (context, i) => const Divider(),
          itemCount: list.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _dialogBuilder(context),
          shape: const CircleBorder(),
          backgroundColor: Colors.blue[900],
          child: const Icon(Icons.filter_alt_sharp , color: Colors.white,),
        ),
        );
  }
}
