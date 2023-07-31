import 'package:flutter/material.dart';
import 'package:myapp/generated/schet.pb.dart';

import '../../../repositories/schet/schet_repository.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // int _counter = 0;
  final clientApp = SchetTerminalClient();
  // void _incrementCounter() {
  //   setState(() {
  //     _counter += 10;
  //   });
  // }

  Future<void> _getSchets() async {
    final filter = FilterSchet();
    final response = await  clientApp.getSchets(filter);
    debugPrint(response.toString());
  }

  @override
  void initState() {
    super.initState();
    _getSchets();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.primaryColor,
        title: Text(
          widget.title,
          style: theme.textTheme.titleMedium,
          ),
      ),
      body: ListView.builder(itemBuilder: (context, i) => 
        ListTile(
          title: Text('schet')
        ),
      ), 
      // body: Center(
      //   child: Column(          
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         // '$_counter',
      //         'dddd',
      //         style: Theme.of(context).textTheme.headlineMedium,
      //       ),
      //     ],
      //   ),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}