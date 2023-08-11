import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/features/schets/services/schet.pb.dart';

import '../../repository/abstractSchetRepository.dart';
import '../bloc/schet_list_bloc.dart';
import '../widgets/schet_card.dart';

class SchetList extends StatefulWidget {
  const SchetList({super.key});

  @override
  State<SchetList> createState() => _SchetListState();
}

class _SchetListState extends State<SchetList> {
  final ScrollController _scrollController = ScrollController();
  var _filter = GetIt.I<AbstractSchetRepository>().InitFilterSchet();
  var _result = ResultSchetListView.create();
  final _schetListBloc = SchetListBloc(GetIt.I<AbstractSchetRepository>(),
      GetIt.I<AbstractSchetRepository>().InitFilterSchet());
  var _totalCount = 0;
  List<SchetView> list = [];
  final _storage = const FlutterSecureStorage();

  final _schetNumberController = TextEditingController();
  String _schetNumber = "";

  final _TNNumberController = TextEditingController();
  String _TNNumber = "";

  DateTime _dateFrom = DateTime.now();
  DateTime _dateTo = DateTime.now();

  @override
  void initState() {
    _schetListBloc.add(LoadSchetList(true, _filter));
    setState(() => _filter = _filter);
    setState(() => _result = _result);
    _scrollController.addListener(_scrolListner);
    super.initState();

    _schetNumberController.text = _schetNumber;
    _schetNumberController.addListener(_changeSchetNumber);

    _schetNumberController.text = _schetNumber;
    _schetNumberController.addListener(_changeSchetNumber);
  }

  void _changeSchetNumber() {
    setState(() => _schetNumber = _schetNumberController.text);
  }

  void _changeTNNumber() {
    setState(() => _schetNumber = _schetNumberController.text);
  }

  _getSchets() {
    _filter.skip = 0;
    _filter.numberSchet = _schetNumber;
    list = [];
    _schetListBloc.add(LoadSchetList(true, _filter));
    Navigator.pop(context);
    setState(() {});
  }
  // _changeField(String type){
  //   switch(type) {
  //     case 'number':
  //       setState(() => _schetNumber = _schetNumberController.text);
  //       break;
  //     default:
  //       break;
  //   }
  // }

  void _scrolListner() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        _result.list.length != _totalCount) {
      _schetListBloc.add(LoadSchetList(false, _filter));
    }
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  // Future<void> GetSchets() async {
  //   _result = await clientApp.GetSchets(_filter);
  //   // debugPrint(_result.toString());
  //   if(_result.succssed) {
  //     list.addAll(_result.list);
  //   }
  // setState(() {});
  // }
  // @override
  // void initState() {
  //   GetSchets();
  //   setState(() => _filter = _filter);
  //   setState(() => _result = _result);
  //   super.initState();
  // }

  Future<void> _logout() async {
    await _storage.delete(
      key: "token",
      aOptions: _getAndroidOptions(),
    );
    Navigator.of(context).pushNamed('/login');
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: _dateFrom,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      locale: const Locale('ru'));

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
                child: Column(
                  children: [
                    SingleChildScrollView(
                        child: Column(children: <Widget>[
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      //   child: TextField(
                      //     style: const TextStyle(fontSize: 18),
                      //     controller: _schetNumberController,
                      //     decoration: const InputDecoration(
                      //       contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      //       border: OutlineInputBorder(),
                      //       labelText: 'Номер счета',
                      //       hintText: 'Номер счета'),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      //   child: TextField(
                      //     style: const TextStyle(fontSize: 18),
                      //     controller: _schetNumberController,
                      //     decoration: const InputDecoration(
                      //       contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      //       border: OutlineInputBorder(),
                      //       labelText: 'Номер ТТН / заказа',
                      //       hintText: 'Номер ТТН / заказа'),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: TextField(
                          style: const TextStyle(fontSize: 18),
                          controller: _schetNumberController,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              border: OutlineInputBorder(),
                              labelText: 'Описание ТТН / заказа',
                              hintText: 'Описание ТТН / заказа'),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0, right: 5.0),
                              child: TextField(
                                style: const TextStyle(fontSize: 18),
                                controller: _schetNumberController,
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    border: OutlineInputBorder(),
                                    labelText: 'Номер счета',
                                    hintText: 'Номер счета'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              child: TextField(
                                style: const TextStyle(fontSize: 18),
                                controller: _TNNumberController,
                                decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    border: OutlineInputBorder(),
                                    labelText: 'Номер ТТН / заказа',
                                    hintText: 'Номер ТТН / заказа'),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Column(children: [
                              const Text('Дата создание ОТ',
                                  style: TextStyle(fontSize: 16)),
                              OutlinedButton(
                                  onPressed: () async {
                                    final date = await pickDate();
                                    if (date == null) return;
                                    setState(() => _dateFrom = date);
                                  },
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0))),
                                  ),
                                  child: Text(
                                      '${_dateFrom.year}/${_dateFrom.month}/${_dateFrom.day}',
                                      style: const TextStyle(fontSize: 18)))
                            ]),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(children: [
                              const Text('Дата создание ДО',
                                  style: TextStyle(fontSize: 16)),
                              OutlinedButton(
                                  onPressed: () async {},
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0))),
                                  ),
                                  child: Text(
                                      '${_dateTo.year}/${_dateTo.month}/${_dateTo.day}',
                                      style: const TextStyle(fontSize: 18)))
                            ]),
                          ),
                        ],
                      )
                    ])),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: FilledButton(
                          onPressed: () {
                            _getSchets();
                          },
                          child: const Text(
                            'Сохранить',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    )
                  ],
                )));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Список счетов'), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.logout),
          tooltip: 'Выйти',
          onPressed: () {
            _logout();
          },
        ),
      ]),
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
                itemCount: state is SchetListSuccessed
                    ? list.length + 1
                    : list.length);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _dialogBuilder(context),
        shape: const CircleBorder(),
        backgroundColor: Colors.blue[900],
        child: const Icon(
          Icons.filter_alt_sharp,
          color: Colors.white,
        ),
      ),
    );
  }
}
