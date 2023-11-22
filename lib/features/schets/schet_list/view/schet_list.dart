// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get_it/get_it.dart';
// import 'package:myapp/features/schets/services/schet.pb.dart';

// import '../../../../generated/account.pb.dart';
// import '../../../../repositories/auth/user_repository.dart';
// import '../../repository/abstractSchetRepository.dart';
// import '../bloc/schet_list_bloc.dart';
// import '../widgets/schet_card.dart';


import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/features/schets/schet_list/bloc/contract_bloc.dart';
import 'package:myapp/features/schets/schet_list/bloc/userList_bloc.dart';
// import 'package:myapp/features/schets/services/schet.pb.dart';

import '../../../../generated/account.pb.dart';
import '../../../../generated/schet.pb.dart';
import '../../../../generated/wrappers.pb.dart';
import '../../../login/bloc/login_bloc.dart';
import '../../repository/abstractSchetRepository.dart';
// import '../../services/schet.pb.dart';

import '../bloc/counterparty_bloc.dart';
import '../bloc/project_bloc.dart';
import '../bloc/schet_list_bloc.dart';
// import '../bloc/user_list_bloc.dart';
import '../widgets/schet_card.dart';

class SchetList extends StatefulWidget {
  const SchetList({super.key});

  @override
  State<SchetList> createState() => _SchetListState();
}

class _SchetListState extends State<SchetList> {
  
  Timer? _debounce;

  final ScrollController _scrollController = ScrollController();
  var _filter = GetIt.I<AbstractSchetRepository>().InitFilterSchet();
  var _result = ResultSchetListView.create();

  List<String> _roles = [];

  String _userId = "";
  final _schetListBloc = SchetListBloc(GetIt.I<AbstractSchetRepository>(),
      GetIt.I<AbstractSchetRepository>().InitFilterSchet());
  var _totalCount = 0;
  List<SchetView> list = [];
  final _storage = const FlutterSecureStorage();

  bool dateFromSelected = false;
  bool dateToSelected = false;
  final userBloc = ListUserBloc();
  final contractBloc = ContractListBloc();
  final counterpartyBloc = CounterpartyListBloc();
  final projectBloc = ProjectListBloc();
  var _usersResult = UserListReply.create();
  // фикс автокомплита
  // List<UserFilter> responsibles = [];
  static List<UserFilter> responsibles = <UserFilter>[];

  static List<UserFilter> creators = <UserFilter>[];

  static List<ContractFilter> contracts = <ContractFilter>[];

  static List<CounterpartyFilter> counterparties = <CounterpartyFilter>[];

  static List<ProjectFilter> projects = <ProjectFilter>[];

  late Iterable<UserFilter> _lastOptions = <UserFilter>[];

  late Iterable<ContractFilter> _lastContractOptions = <ContractFilter>[];

  late Iterable<CounterpartyFilter> _lastCounterpartyOptions = <CounterpartyFilter>[];

  late Iterable<ProjectFilter> _lastProjectOptions = <ProjectFilter>[];

  var user;

  final _schetNumberController = TextEditingController();
  String _schetNumber = "";

  final _TNNumberController = TextEditingController();
  String _TNNumber = "";

  final _TNDescriptionController = TextEditingController();
  String _TNDescription = "";

  final _organizationController = TextEditingController();
  String _organization = "";

  final _counterpartyController = TextEditingController();
  String _counterparty = "";
  
  final _creatorController = TextEditingController();
  String _creator= "";

  final _responsibleController = TextEditingController();
  String _responsible = "";

  final _minSumController = TextEditingController();
  String _minSum = "";

  final _maxSumController = TextEditingController();
  String _maxSum = "";

  final _contractController = TextEditingController();
  String _contract = "";

  final _projectController = TextEditingController();
  String _project = "";

  DateTime _dateFrom = DateTime.now();
  DateTime _dateTo = DateTime.now();

  setRoles() async {
    final String? userString = await _storage.read(
      key: "roles",
      aOptions: _getAndroidOptions(),
    );

  _roles = List<String>.from(json.decode(userString as String));
    debugPrint('$_roles');
  }

  // setUserId() async {
  //   final String? userString = await _storage.read(
  //     key: "userId",
  //     aOptions: _getAndroidOptions(),
  //   );

  //   _userId = userString as String;
  //   debugPrint('$_userId');
  // }

  String dropdownvalue = 'Все';

  var items = [ 
    'Все', 
    'Без платежного поручения',
    'С платежным поручением',
    'С оплаченным ПП',
    'Без оплаченного ПП',
  ];

  var statuses = [ 
    'Все', 
    'Без платежного поручения',
    'С платежным поручением',
    'С оплаченным ПП',
    'Без оплаченного ПП',
  ];

  @override
  void initState() {
    // setUserId();
    // setRoles();
    // _filter.userId = _userId;

    _getUserData();
    // final user = await _getUserData();
    // debugPrint(user.toString());

    // ВРОДЕ НЕ РАБОТАЕТ
    // try {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     final state = BlocProvider.of<LoginBloc>(context).state;
    //     if (state is LoginSuccessed) {
    //       debugPrint('userState');
    //       user = state.user;
    //     }
    //   });
    // }
    // catch(e) {
    //   debugPrint(e.toString());
    // }

    _schetListBloc.add(LoadSchetList(true, _filter));
    setState(() => _filter = _filter);
    setState(() => _result = _result);
    _scrollController.addListener(_scrolListner);
    super.initState();

    if (contracts.isNotEmpty) {
      ContractFilter selectedContract = contracts.firstWhere((r) => r.id == _filter.contractId);
      _contract = selectedContract.name;
    }

    _schetNumberController.text = _TNNumber;
    _schetNumberController.addListener(_changeSchetNumber);

    _TNNumberController.text = _TNDescription;
    _TNNumberController.addListener(_changeTNNumber);

    _TNDescriptionController.text = _schetNumber;
    _TNDescriptionController.addListener(_changeTNDescription);

    _organizationController.text = _organization;
    _organizationController.addListener(_changeOrganization);

    _counterpartyController.text = _counterparty;
    _counterpartyController.addListener(_changeCounterparty);

    _creatorController.text = _creator;
    _creatorController.addListener(_changeCreator);

    _responsibleController.text = _responsible;
    _responsibleController.addListener(_changeResponsible);

    _minSumController.text = _minSum;
    _minSumController.addListener(_changeMinSum);

    _maxSumController.text = _maxSum;
    _maxSumController.addListener(_changeMaxSum);

    _contractController.text = _contract;
    _contractController.addListener(_changeContract);

    _projectController.text = _project;
    _projectController.addListener(_changeProject);
  }

  void _changeContract() {
    setState(() => _contract = _contractController.text);

    // Не работает вроде
    if (_contract.trim() == "") {
      _filter.documentId.clear();
      _filter.contractId = "";
    }
  }

  void _changeProject() {
    setState(() => _project = _projectController.text);
  }

  void _changeMinSum() {
    setState(() => _minSum = _minSumController.text);
  }

  void _changeMaxSum() {
    setState(() => _maxSum = _maxSumController.text);
  }

  void _changeCreator() {
    setState(() => _creator = _creatorController.text);
  }

  void _changeCounterparty() {
    setState(() => _counterparty = _counterpartyController.text);
  }

  void _changeResponsible() {
    setState(() => _responsible = _responsibleController.text);

    // Вроде не нужно
    // _getResponsibles();
  }

  void _changeOrganization() {
    setState(() => _organization = _organizationController.text);
  }

  void _changeSchetNumber() {
    setState(() => _schetNumber = _schetNumberController.text);
  }

  void _changeTNNumber() {
    setState(() => _TNNumber = _TNNumberController.text);
  }

  void _changeTNDescription() {
    setState(() => _TNDescription = _TNDescriptionController.text);
  }

  void _changePaymentCheck() {
    setState(() => {});
  }


  Future<Iterable<ProjectFilter>> _getProjects() async {

    final event = ProjectListEvent();
    event.type = ProjectListAction.GetAll;

    var request = ProjectListRequest();
    request.projectName = _project;
    request.skip = 0;
    request.take = 20;
    request.filter = _filter;

    // debugPrint(request.toString());

    event.payload = request;
    projectBloc.eventSink.add(event);

    return projects;
  }

  Future<Iterable<ContractFilter>> _getContracts() async {

    final event = ContractListEvent();
    event.type = ContractListAction.GetAll;

    var request = new ContractListRequest();
    request.contractName = _contract;
    request.skip = 0;
    request.take = 20;
    request.filter = _filter;

    event.payload = request;
    contractBloc.eventSink.add(event);

    return contracts;
  }

  Future<Iterable<CounterpartyFilter>> _getCounterparties(bool isPaying) async {

    final event = CounterpartyListEvent();
    event.type = CounterpartyListAction.GetAll;

    var request = new CounterpartyListRequest();
    request.counterpartyName = _counterparty;
    request.isPaying = isPaying;
    request.skip = 0;
    request.take = 20;
    request.filter = _filter;

    // debugPrint(request.toString());

    event.payload = request;
    counterpartyBloc.eventSink.add(event);

    return counterparties;
  }


  Future<Iterable<UserFilter>> _getCreators() async {
    _filter.creatorName = _creator;
    final event = UserListEvent();
    event.type = UserListAction.GetCreators;

    var request = new UserListRequest();
    request.firstName = _creator;
    request.skip = 20;
    request.take = 0;
    request.filter = _filter;

    event.payload = request;
    userBloc.eventSink.add(event);

    return creators;
  }

  Future<Iterable<UserFilter>> _getResponsibles() async {
    debugPrint('call');
    _filter.setUserName = _responsible;

    final event = UserListEvent();
    event.type = UserListAction.GetAll;

    var request = new UserListRequest();
    request.firstName = _responsible;
    request.skip = 20;
    request.take = 0;
    request.filter = _filter;

    event.payload = request;
    userBloc.eventSink.add(event);  
    return responsibles;
  }

  _getSchets() {
    _filter.skip = 0;
    _filter.numberSchet = _schetNumber;
    _filter.numberTTNOrOrder = _TNNumber;

    var stringDateFrom = StringValue();
    if (dateFromSelected) {
      stringDateFrom.value = _dateFrom.toLocal().toString();
    }
    else {
      stringDateFrom.value = DateTime(2010,1,1).toLocal().toString();
    }
    
    _filter.dateFrom = stringDateFrom;

    var stringDateTo = StringValue();
    stringDateTo.value = _dateTo.toLocal().toString();
    _filter.dateTo = stringDateTo;
    // ????
    switch(dropdownvalue) {
      case 'Все':
        _filter.paymentCheck = 1;
        break;
      case 'Без платежного поручения':
        _filter.paymentCheck = 2;
        break;
      case 'С платежным поручением':
        _filter.paymentCheck = 5;
        break;
      case 'Без оплаченного ПП':
        _filter.paymentCheck = 3;
        break;
      case 'С оплаченным ПП':
        _filter.paymentCheck = 4;
        break;
      default:
        break;
    }
    _filter.description = _TNDescription;
    if (_maxSum != "") {
      var doubleV = DoubleValue();
      doubleV.value = double.parse(_maxSum);
      _filter.summaMax = doubleV;
    }
    
    if (_minSum != "") {
      var doubleV = DoubleValue();
      doubleV.value = double.parse(_minSum);
      _filter.summaMax = doubleV;
    }
    // из запроса
    // _filter.payingOrganizationId 
    // _filter.directoryCounterpartiesId
    // нет для создателя и ответственного
    list = [];
    _schetListBloc.add(LoadSchetList(true, _filter));
    Navigator.pop(context);
    setState(() { 
    });
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

  Future<User?> _getUserData() async {
    final userStr = await _storage.read(
      key: "user",
      aOptions: _getAndroidOptions(),
    );
    // debugPrint('RESULTIWE'+ userStr.toString());
    User result = User();
    if (userStr != null) {
      // result = User.fromJson(userStr);
      // Map<String, dynamic> valueMap = json.decode(userStr);
      // нужно переписать fromJson или нормально воспользоваться существующим
      // result = User.fromJson(valueMap);
      
      final jsonUser = jsonDecode(userStr);
      // result = User.fromJson(jsonUser.toString());
       
      result = User.fromJson(jsonUser);

      // Map<String, dynamic> jsonUser = json.decode(userStr);
      debugPrint(result.toString());
      // _userId = jsonUser.Id;
      // _roles = jsonUser['Roles'];
    }

    user = result;
    // _roles = user.roles.map((item) => debugPrint(item));

  for (var value in user.roles) {
    debugPrint(value.toString());
    _roles.add(value.name);
  }


    _userId = user.id;

    return result;
  }

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

  void selectField(String selection, String type) {
    // debugPrint('1' + selection);
    switch(type) {
      case 'responsible':
        UserFilter selected = responsibles.firstWhere((r) => r.fullName == selection);
        _filter.setUserId = selected.id;
        _filter.setUserName = selected.fullName;

      case 'creator':
        UserFilter selected = creators.firstWhere((r) => r.fullName == selection);
        _filter.creatorId = selected.id;
        _filter.creatorName = selected.fullName;

      case 'contract':
        ContractFilter selected = contracts.firstWhere((r) => r.name == selection);

        // ЭТО ВРОДЕ ДЛЯ РАМОЧНЫХ
        _filter.contractId = selected.id;

        _filter.documentId.add(selected.id);

        // _filter.creatorName = selected.name;
        // debugPrint(selected.id.toString());

      case 'payingOrg':
        CounterpartyFilter selected = counterparties.firstWhere((r) => r.name == selection);
        _filter.payingOrganizationId = selected.id;
        _filter.payingOrganizationName = selected.name;

      case 'counterparty':
        CounterpartyFilter selected = counterparties.firstWhere((r) => r.name == selection);
        _filter.payingOrganizationId = selected.id;
        _filter.payingOrganizationName = selected.name; 

      case 'project':
        ProjectFilter selected = projects.firstWhere((r) => r.name == selection);
        _filter.projectId = selected.id;
        _filter.projectName = selected.name; 
    }
  }

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

  Future<DateTime?> pickDateFrom() => showDatePicker(
    context: context, 
    initialDate: _dateFrom, 
    firstDate: DateTime(1900), 
    lastDate: DateTime(2100),
    locale: const Locale('ru')
  );

  Future<DateTime?> pickDateTo() => showDatePicker(
    context: context, 
    initialDate: _dateTo, 
    firstDate: DateTime(1900), 
    lastDate: DateTime(2100),
    locale: const Locale('ru')
  );

    Future<void> _dialogBuilder(BuildContext context) {

    final theme = Theme.of(context);

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog.fullscreen(
          child: 
          Column(
            mainAxisSize: MainAxisSize.max,
            children:[
              Expanded(child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                      child: TextField(
                        style: const TextStyle(fontSize: 18),
                        controller: _TNDescriptionController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          border: OutlineInputBorder(),
                          labelText: 'Описание ТТН / заказа',
                          hintText: 'Описание ТТН / заказа'),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                      child: StreamBuilder(
                        stream: counterpartyBloc.counterpartyListStream,
                        builder: (context, snapshot) {
                          // debugPrint('snap' + snapshot.data.toString());
                          if (snapshot.data != null) {
                            counterparties = snapshot.data as List<CounterpartyFilter>;
                          }

                          return Autocomplete<String>(
                            initialValue: TextEditingValue(text: _counterparty),
                            optionsBuilder: (TextEditingValue textEditingValue) async {
                              _counterparty = textEditingValue.text;

                              // ФИКС ФИЛЬТРА
                              _filter.payingOrganizationId = "";
                              _filter.payingOrganizationName = "";

                              _getCounterparties(true);
                              final Iterable<CounterpartyFilter> options = counterparties;
                              if (_counterparty != textEditingValue.text) {
                                // return _lastOptions;
                                return _lastCounterpartyOptions.map((resp) => resp.name);
                              }
                              _lastCounterpartyOptions = options;
                              // debugPrint('opt' + options.toString());
                              // return options;
                              return options.map((resp) => resp.name);
                            },
                            fieldViewBuilder: ((context,
                                textEditingController,
                                focusNode,
                                onFieldSubmitted) {
                              return TextField(
                                style: const TextStyle(fontSize: 18),
                                controller: textEditingController,
                                focusNode: focusNode,
                                onEditingComplete: onFieldSubmitted,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  border: OutlineInputBorder(),
                                  labelText: 'Выберите оплачивающую организацию',
                                  hintText: 'Выберите оплачивающую организацию'),
                              );
                            }),
                            onSelected: (String selection) {
                              selectField(selection, 'payingOrg');
                            },
                          );
                        }
                      ),
                      // child: TextField(
                      //   style: const TextStyle(fontSize: 18),
                      //   controller: _organizationController,
                      //   decoration: const InputDecoration(
                      //     contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      //     border: OutlineInputBorder(),
                      //     labelText: 'Выберите оплачивающую организацию',
                      //     hintText: 'Выберите оплачивающую организацию'),
                      // ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                      child: StreamBuilder(
                        stream: counterpartyBloc.counterpartyListStream,
                        builder: (context, snapshot) {
                          // debugPrint('snap' + snapshot.data.toString());
                          if (snapshot.data != null) {
                            counterparties = snapshot.data as List<CounterpartyFilter>;
                          }

                          return Autocomplete<String>(
                            initialValue: TextEditingValue(text: _counterparty),
                            optionsBuilder: (TextEditingValue textEditingValue) async {

                              _counterparty = textEditingValue.text;

                              // ФИКС ФИЛЬТРА
                              _filter.directoryCounterpartiesId = "";
                              _filter.directoryCounterpartiesName = "";
                              _getCounterparties(false);

                              final Iterable<CounterpartyFilter> options = counterparties;
                              if (_counterparty != textEditingValue.text) {
                                // return _lastOptions;
                                return _lastCounterpartyOptions.map((resp) => resp.name);
                              }
                              _lastCounterpartyOptions = options;
                              // debugPrint('opt' + options.toString());
                              // return options;
                              return options.map((resp) => resp.name);
                            },
                            fieldViewBuilder: ((context,
                                textEditingController,
                                focusNode,
                                onFieldSubmitted) {
                              return TextField(
                                style: const TextStyle(fontSize: 18),
                                controller: textEditingController,
                                focusNode: focusNode,
                                onEditingComplete: onFieldSubmitted,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  border: OutlineInputBorder(),
                                  labelText: 'Выберите контрагента',
                                  hintText: 'Выберите контрагента'),
                              );
                            }),
                            onSelected: (String selection) {
                              selectField(selection, 'counterparty');
                            },
                          );
                        }
                      ),
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 5.0, left: 20.0),
                            child: TextField(
                              style: const TextStyle(fontSize: 18),
                              controller: _schetNumberController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                border: OutlineInputBorder(),
                                labelText: 'Номер счета',
                                hintText: 'Номер счета'),
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                            child: TextField(
                              style: const TextStyle(fontSize: 18),
                              controller: _TNNumberController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                          child: Column(
                            children: [
                              const Text(
                                'Дата создания ОТ', 
                                style: TextStyle(fontSize: 16)
                              ),
                              OutlinedButton(
                                onPressed: () async {
                                  final date = await pickDateFrom();
                                  if (date == null) return;
                                  setState(() => _dateFrom = date);
                                  setState(() => dateFromSelected = true);
                                }, 
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
                                ),
                                child: Text(
                                  // '${_dateFrom.year}/${_dateFrom.month}/${_dateFrom.day}',
                                  '${_dateFrom.day}.${_dateFrom.month}.${_dateFrom.year}',
                                  style: const TextStyle(fontSize: 18)
                                  )
                                )
                            ]
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              const Text(
                                'Дата создания ДО', 
                                style: TextStyle(fontSize: 16)
                              ),
                              OutlinedButton(
                                onPressed: () async {
                                  final date = await pickDateTo();
                                  if (date == null) return;
                                  setState(() => _dateTo = date);
                                }, 
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
                                ),
                                child: Text(
                                  // '${_dateTo.year}/${_dateTo.month}/${_dateTo.day}',
                                  '${_dateTo.day}.${_dateTo.month}.${_dateTo.year}',
                                  style: const TextStyle(fontSize: 18)
                                  )
                                )
                            ]
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                      child: StreamBuilder(
                        stream: userBloc.userListStream,
                        builder: (context, snapshot) {
                          // debugPrint('snap' + snapshot.data.toString());
                          if (snapshot.data != null) {
                            creators = snapshot.data as List<UserFilter>;
                            // debugPrint('stream' + responsibles.toString());
                            // setState(() => {});
                          }
                          
                          // return Autocomplete<UserFilter>(
                          return Autocomplete<String>(
                            initialValue: TextEditingValue(text: _creator),
                            optionsBuilder: (TextEditingValue textEditingValue) async {

                              _creator = textEditingValue.text;

                              // ФИКС ФИЛЬТРА
                              _filter.creatorId = "";

                              _getCreators();


                              final Iterable<UserFilter> options = creators;
                              if (_creator != textEditingValue.text) {
                                // return _lastOptions;
                                return _lastOptions.map((resp) => resp.fullName);
                              }
                              _lastOptions = options;
                              // debugPrint('opt' + options.toString());
                              // return options;
                              return options.map((resp) => resp.fullName);
                            },
                            fieldViewBuilder: ((context,
                                textEditingController,
                                focusNode,
                                onFieldSubmitted) {
                              return TextField(
                                style: const TextStyle(fontSize: 18),
                                controller: textEditingController,
                                focusNode: focusNode,
                                onEditingComplete: onFieldSubmitted,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  border: OutlineInputBorder(),
                                  labelText: 'Создал',
                                  hintText: 'Создал'),
                              );
                            }),
                            onSelected: (String selection) {
                              selectField(selection, 'creator');
                            },
                          );
                        }
                      ),                           
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                      child: StreamBuilder(
                        stream: userBloc.userListStream,
                        builder: (context, snapshot) {
                          // debugPrint('snap' + snapshot.data.toString());
                          if (snapshot.data != null) {
                            responsibles = snapshot.data as List<UserFilter>;
                            // debugPrint('stream' + responsibles.toString());
                            // setState(() => {});
                          }
                          
                          // return Autocomplete<UserFilter>(
                          return Autocomplete<String>(
                            initialValue: TextEditingValue(text: _responsible),
                            optionsBuilder: (TextEditingValue textEditingValue) async {


                              _responsible = textEditingValue.text;

                              // ФИКС ФИЛЬТРА
                              _filter.setUserId = "";

                              _getResponsibles();


                              final Iterable<UserFilter> options = responsibles;
                              if (_responsible != textEditingValue.text) {
                                // return _lastOptions;
                                return _lastOptions.map((resp) => resp.fullName);
                              }
                              _lastOptions = options;
                              // debugPrint('opt' + options.toString());
                              // return options;
                              return options.map((resp) => resp.fullName);
                            },
                            fieldViewBuilder: ((context,
                                textEditingController,
                                focusNode,
                                onFieldSubmitted) {
                              return TextField(
                                style: const TextStyle(fontSize: 18),
                                controller: textEditingController,
                                focusNode: focusNode,
                                onEditingComplete: onFieldSubmitted,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  border: OutlineInputBorder(),
                                  labelText: 'Ответственный',
                                  hintText: 'Ответственный'),
                              );
                            }),
                            onSelected: (String selection) {
                              selectField(selection, 'responsible');
                            },
                          );
                        }
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 5.0, left: 20.0),
                            child: TextField(
                              style: const TextStyle(fontSize: 18),
                              controller: _minSumController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), 
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                border: OutlineInputBorder(),
                                labelText: 'Сумма от',
                                hintText: 'Сумма от'),
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0),
                            child: TextField(
                              style: const TextStyle(fontSize: 18),
                              controller: _maxSumController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), 
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                border: OutlineInputBorder(),
                                labelText: 'Сумма до',
                                hintText: 'Сумма до'),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                      child: StreamBuilder(
                        stream: contractBloc.contractListStream,
                        builder: (context, snapshot) {
                          // debugPrint('snap' + snapshot.data.toString());
                          if (snapshot.data != null) {
                            contracts = snapshot.data as List<ContractFilter>;
                            // debugPrint('stream' + responsibles.toString());
                            // setState(() => {});
                          }
                          
                          // return Autocomplete<ContractFilter>(
                          return Autocomplete<String>(
                            initialValue: TextEditingValue(text: _contract),
                            optionsBuilder: (TextEditingValue textEditingValue) async {

                              
                              // ТЕСТ ДЕБАУНСА
                              // Добавлял я
                              Iterable<ContractFilter> options = contracts;

                              _contract = textEditingValue.text;

                              if (_debounce?.isActive ?? false) _debounce?.cancel();
                              _debounce = Timer(const Duration(milliseconds: 1500), () {
                                
                                
                                // debugPrint('deb' + _contract);
                                _getContracts();

                                // Добавлял я
                                options = contracts;
                                _lastContractOptions = options;
                                setState(() {
                                  
                                });



                                // if (_contract != textEditingValue.text) {
                                //   return _lastContractOptions.map((resp) => resp.name);
                                // }
                                // _lastContractOptions = options;

                                // return options.map((resp) => resp.name);

                              });

                              //РАБОЧИЙ ВАРИАНТ
                            //   _contract = textEditingValue.text;

                            //   debugPrint(_contract);

                            //   _filter.documentId.clear();
                            //   _filter.contractId = "";
                            //   _getContracts();
                            //  final Iterable<ContractFilter> options = contracts;

                              if (_contract != textEditingValue.text) {
                                // return _lastContractOptions;
                                return _lastContractOptions.map((resp) => resp.name);
                              }
                              _lastContractOptions = options;
                              // debugPrint('opt' + options.toString());
                              // return options;
                              return options.map((resp) => resp.name);
                            },
                            fieldViewBuilder: ((context,
                                textEditingController,
                                focusNode,
                                onFieldSubmitted) {
                              return TextField(
                                style: const TextStyle(fontSize: 18),
                                controller: textEditingController,
                                focusNode: focusNode,
                                onEditingComplete: onFieldSubmitted,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  border: OutlineInputBorder(),
                                  labelText: 'Договор',
                                  hintText: 'Договор'),
                              );
                            }),
                            onSelected: (String selection) {
                              selectField(selection, 'contract');
                            },
                            // onSelected: (ContractFilter c) {
                            //   selectField(c.name, 'contract');
                            // },
                          );
                        }
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                      child: StreamBuilder(
                        stream: projectBloc.projectListStream,
                        builder: (context, snapshot) {
                          // debugPrint('snap' + snapshot.data.toString());
                          if (snapshot.data != null) {
                            projects = snapshot.data as List<ProjectFilter>;
                          }

                          return Autocomplete<String>(
                            initialValue: TextEditingValue(text: _project),
                            optionsBuilder: (TextEditingValue textEditingValue) async {


                              _project = textEditingValue.text;

                              // ФИКС ФИЛЬТРА
                              _filter.projectId = "";
                              _filter.projectName = "";


                              // debugPrint(_project);
                              _getProjects();

                              final Iterable<ProjectFilter> options = projects;
                              if (_project != textEditingValue.text) {
                                // return _lastOptions;
                                return _lastProjectOptions.map((resp) => resp.name);
                              }
                              _lastProjectOptions = options;
                              // debugPrint('opt' + options.toString());
                              // return options;
                              return options.map((resp) => resp.name);
                            },
                            fieldViewBuilder: ((context,
                                textEditingController,
                                focusNode,
                                onFieldSubmitted) {
                              return TextField(
                                style: const TextStyle(fontSize: 18),
                                controller: textEditingController,
                                focusNode: focusNode,
                                onEditingComplete: onFieldSubmitted,
                                // onChanged: (value) => {
                                //   debugPrint(value)
                                // }
                                  
                                  // if (value.trim() == "") {
                                  //   _filter.documentId.clear()
                                  //   // _filter.contractId = "";
                                  // }
                                // ,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  border: OutlineInputBorder(),
                                  labelText: 'Проект',
                                  hintText: 'Проект'),
                              );
                            }),
                            onSelected: (String selection) {
                              selectField(selection, 'project');
                            },
                          );
                        }
                      ),
                    ),

                    Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                        child: 
                        DropdownButton<String>(
                            
                          value: dropdownvalue,
                          icon: const Icon(Icons.keyboard_arrow_down),    
                          items: items.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              // child: Text(item, style: theme.textTheme.titleMedium,),
                              child: Text(item, style: const TextStyle(color: Colors.black, fontSize: 16 ),),
                            );
                          }).toList(),
                          onChanged: (String? newValue) { 
                            // debugPrint(newValue);
                            setState(() {
                              if (newValue != null) {
                                debugPrint(newValue);
                                // debugPrint('est');
                              }
                              else {
                                // debugPrint('net');
                              }
                              _changePaymentCheck();
                              dropdownvalue = newValue!.toString();
                            });
                          },
                        ),
                      )
                      
                    ],) ),),
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
                          ),
                        ),
                      ),
                    )
                  ]
                // )
                )              
              );
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
                      return SchetCard(
                        schet: list[i],
                        roles: _roles,
                        userId: _userId,
                        onUpdate: () {
                          if (i == 0) {
                            _filter.skip = 0;
                            list = [];
                            _schetListBloc.add(LoadSchetList(true, _filter));
                          } else {
                            list = list.skip(0).take(i).toList();
                            _filter.skip = i;
                            _schetListBloc.add(LoadSchetList(false, _filter));
                          }
                        },
                      );
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

// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get_it/get_it.dart';
// import 'package:myapp/features/schets/schet_list/bloc/contract_bloc.dart';
// import 'package:myapp/features/schets/schet_list/bloc/userList_bloc.dart';
// // import 'package:myapp/features/schets/services/schet.pb.dart';

// import '../../../../generated/account.pb.dart';
// import '../../../../generated/schet.pb.dart';
// import '../../../../generated/wrappers.pb.dart';
// import '../../../login/bloc/login_bloc.dart';
// import '../../repository/abstractSchetRepository.dart';
// // import '../../services/schet.pb.dart';

// import '../bloc/counterparty_bloc.dart';
// import '../bloc/project_bloc.dart';
// import '../bloc/schet_list_bloc.dart';
// // import '../bloc/user_list_bloc.dart';
// import '../widgets/schet_card.dart';

// class SchetList extends StatefulWidget {
//   const SchetList({super.key});

//   @override
//   State<SchetList> createState() => _SchetListState();
// }

// class _SchetListState extends State<SchetList> {
  

//   Timer? _debounce;

//   final ScrollController _scrollController = ScrollController();
//   var _filter = GetIt.I<AbstractSchetRepository>().InitFilterSchet();
//   var _result = ResultSchetListView.create();
//   final _schetListBloc = SchetListBloc(GetIt.I<AbstractSchetRepository>(),
//       GetIt.I<AbstractSchetRepository>().InitFilterSchet());
//   var _totalCount = 0;
//   List<SchetView> list = [];
//   final _storage = const FlutterSecureStorage();

//   bool dateFromSelected = false;
//   bool dateToSelected = false;
//   // responsibles
//   // FIX USERBLOC
//   // final _userListBloc = UserListBloc(GetIt.I<AbstractSchetRepository>(),
//   //     GetIt.I<AbstractSchetRepository>().InitFilterSchet());

//   // ВАРИАНТ СО СТРМОМ
//   final userBloc = ListUserBloc();
//   final contractBloc = ContractListBloc();
//   final counterpartyBloc = CounterpartyListBloc();

//   final projectBloc = ProjectListBloc();

//   var _usersResult = UserListReply.create();


//   // фикс автокомплита
//   // List<UserFilter> responsibles = [];

//   static List<UserFilter> responsibles = <UserFilter>[];

//   static List<UserFilter> creators = <UserFilter>[];

//   static List<ContractFilter> contracts = <ContractFilter>[];

//   static List<CounterpartyFilter> counterparties = <CounterpartyFilter>[];

//   static List<ProjectFilter> projects = <ProjectFilter>[];

//   late Iterable<UserFilter> _lastOptions = <UserFilter>[];

//   late Iterable<ContractFilter> _lastContractOptions = <ContractFilter>[];

//   late Iterable<CounterpartyFilter> _lastCounterpartyOptions = <CounterpartyFilter>[];

//   late Iterable<ProjectFilter> _lastProjectOptions = <ProjectFilter>[];
//   // late User user;
//   var user;

//   final _schetNumberController = TextEditingController();
//   String _schetNumber = "";

//   final _TNNumberController = TextEditingController();
//   String _TNNumber = "";

//   final _TNDescriptionController = TextEditingController();
//   String _TNDescription = "";

//   final _organizationController = TextEditingController();
//   String _organization = "";

//   final _counterpartyController = TextEditingController();
//   String _counterparty = "";
  
//   final _creatorController = TextEditingController();
//   String _creator= "";

//   final _responsibleController = TextEditingController();
//   String _responsible = "";

//   final _minSumController = TextEditingController();
//   String _minSum = "";

//   final _maxSumController = TextEditingController();
//   String _maxSum = "";

//   final _contractController = TextEditingController();
//   String _contract = "";

//   final _projectController = TextEditingController();
//   String _project = "";

//   DateTime _dateFrom = DateTime.now();
//   DateTime _dateTo = DateTime.now();

//   String dropdownvalue = 'Все';

//   var items = [ 
//     'Все', 
//     'Без платежного поручения',
//     'С платежным поручением',
//     'С оплаченным ПП',
//     'Без оплаченного ПП',
//   ];

//   var statuses = [ 
//     'Все', 
//     'Без платежного поручения',
//     'С платежным поручением',
//     'С оплаченным ПП',
//     'Без оплаченного ПП',
//   ];

//   @override
//   void initState() {
//   // void initState() async {
//     // получаем юзера из стейта
//     try {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         final state = BlocProvider.of<LoginBloc>(context).state;
//         if (state is LoginSuccessed) {
//           debugPrint('userState');
//           user = state.user;
//         }

//         // final userState = BlocProvider.of<UserListBloc>(context, listen: true).state;
//         // debugPrint(state.toString());
//         // if (userState is UserListSuccessed) {
//         //   debugPrint('state');
//         //   debugPrint(userState.toString());
//         //   responsibles = userState.users;
//         //   // setState(() {});
//         // }
//       });
//     }
//     catch(e) {
//       debugPrint(e.toString());
//     }


//     // WidgetsBinding.instance.addPostFrameCallback((_) {
//     //   final state = BlocProvider.of<UserListBloc>(context).state;
//     //   debugPrint(state.toString());
//     //   if (state is UserListSuccessed) {
//     //     debugPrint('state');
//     //     debugPrint(state.toString());
//     //     responsibles = state.users;
//     //     // setState(() {});
//     //   }
//     // });
    
//     // final user = await _getUserData();

//     // Не работает
//     // user = userString as User;
//     // User user = User.fromJson(userString);

//     // debugPrint(user.toString());
//     debugPrint(_filter.contractId.toString());
//     // if (user != null) {
//     //   _filter.userId = user.id;
//     // }

//     // ФИКС ПЕРЕОТКРЫТИЯ  
//     debugPrint('contracts' + contracts.toString());
//     if (contracts.isNotEmpty) {
//       ContractFilter selectedContract = contracts.firstWhere((r) => r.id == _filter.contractId);
//       _contract = selectedContract.name;
//     }


//   // _project = _projectController.text);
//   // _minSum = _minSumController.text);
//   // _maxSum = _maxSumController.text);
//   // _creator = _creatorController.text);
//   // _responsible = _responsibleController.text);
//   // _counterparty = _counterpartyController.text);

//   // _schetNumber = _schetNumberController.text);

//   // _TNNumber = _TNNumberController.text);
//   // _TNDescription = _TNDescriptionController.text);


//     _schetListBloc.add(LoadSchetList(true, _filter));
//     setState(() => _filter = _filter);
//     setState(() => _result = _result);
//     _scrollController.addListener(_scrolListner);
//     super.initState();

//     _schetNumberController.text = _TNNumber;
//     _schetNumberController.addListener(_changeSchetNumber);

//     _TNNumberController.text = _TNDescription;
//     _TNNumberController.addListener(_changeTNNumber);

//     _TNDescriptionController.text = _schetNumber;
//     _TNDescriptionController.addListener(_changeTNDescription);

//     _organizationController.text = _organization;
//     _organizationController.addListener(_changeOrganization);

//     _counterpartyController.text = _counterparty;
//     _counterpartyController.addListener(_changeCounterparty);

//     _creatorController.text = _creator;
//     _creatorController.addListener(_changeCreator);

//     _responsibleController.text = _responsible;_contract;
//     _responsibleController.addListener(_changeResponsible);

//     _minSumController.text = _minSum;
//     _minSumController.addListener(_changeMinSum);

//     _maxSumController.text = _maxSum;
//     _maxSumController.addListener(_changeMaxSum);

//     _contractController.text = _contract;
//     _contractController.addListener(_changeContract);

//     _projectController.text = _project;
//     _projectController.addListener(_changeProject);
//   }

//   void _changeContract() {
//     setState(() => _contract = _contractController.text);
//     debugPrint(_contract);
//     if (_contract.trim() == "") {
//       _filter.documentId.clear();
//       _filter.contractId = "";
//     }
//   }

//   void _changeProject() {
//     setState(() => _project = _projectController.text);
//   }

//   void _changeMinSum() {
//     setState(() => _minSum = _minSumController.text);
//     // debugPrint(responsibles.toString());
//   }

//   void _changeMaxSum() {
//     setState(() => _maxSum = _maxSumController.text);
//   }

//   void _changeCreator() {
//     setState(() => _creator = _creatorController.text);
//   }

//   void _changeCounterparty() {
//     setState(() => _counterparty = _counterpartyController.text);
//   }

//   void _changeResponsible() {
//     setState(() => _responsible = _responsibleController.text);
//     _getResponsibles();
//   }

//   void _changeOrganization() {
//     setState(() => _organization = _organizationController.text);
//   }

//   void _changeSchetNumber() {
//     setState(() => _schetNumber = _schetNumberController.text);
//   }

//   void _changeTNNumber() {
//     setState(() => _TNNumber = _TNNumberController.text);
//   }

//   void _changeTNDescription() {
//     setState(() => _TNDescription = _TNDescriptionController.text);
//   }

//   void _changePaymentCheck() {
//     setState(() => {});
//   }

//   Future<Iterable<ProjectFilter>> _getProjects() async {

//     final event = ProjectListEvent();
//     event.type = ProjectListAction.GetAll;

//     var request = ProjectListRequest();
//     request.projectName = _project;
//     request.skip = 0;
//     request.take = 20;
//     request.filter = _filter;

//     debugPrint(request.toString());

//     event.payload = request;
//     projectBloc.eventSink.add(event);

//     return projects;
//   }

//   Future<Iterable<ContractFilter>> _getContracts() async {

//     final event = ContractListEvent();
//     event.type = ContractListAction.GetAll;

//     var request = new ContractListRequest();
//     request.contractName = _contract;
//     request.skip = 0;
//     request.take = 20;
//     request.filter = _filter;

//     event.payload = request;
//     contractBloc.eventSink.add(event);

//     return contracts;
//   }

//   Future<Iterable<CounterpartyFilter>> _getCounterparties(bool isPaying) async {

//     final event = CounterpartyListEvent();
//     event.type = CounterpartyListAction.GetAll;

//     var request = new CounterpartyListRequest();
//     request.counterpartyName = _counterparty;
//     request.isPaying = isPaying;
//     request.skip = 0;
//     request.take = 20;
//     request.filter = _filter;

//     debugPrint(request.toString());

//     event.payload = request;
//     counterpartyBloc.eventSink.add(event);

//     return counterparties;
//   }


//   Future<Iterable<UserFilter>> _getCreators() async {
//     _filter.creatorName = _creator;

//     // ВАРИАНТ С ОБЫЧНЫМ БЛОКОМ
//     // _userListBloc.add(LoadUsers(_responsible, 0, 20, true, _filter));

//     // ВАРИАНТ СО СТРМОМ
//     final event = UserListEvent();
//     event.type = UserListAction.GetCreators;

//     var request = new UserListRequest();
//     request.firstName = _creator;
//     request.skip = 20;
//     request.take = 0;
//     request.filter = _filter;

//     event.payload = request;
//     userBloc.eventSink.add(event);

//     return creators;
//   }

//   Future<Iterable<UserFilter>> _getResponsibles() async {
//     debugPrint('call');
//     _filter.setUserName = _responsible;

//     // ВАРИАНТ С ОБЫЧНЫМ БЛОКОМ
//     // _userListBloc.add(LoadUsers(_responsible, 0, 20, true, _filter));

//     // ВАРИАНТ СО СТРМОМ
//     final event = UserListEvent();
//     event.type = UserListAction.GetAll;

//     var request = new UserListRequest();
//     request.firstName = _responsible;
//     request.skip = 20;
//     request.take = 0;
//     request.filter = _filter;

//     event.payload = request;
//     userBloc.eventSink.add(event);

//     // responsibles = _usersResult.users;
//     // debugPrint('userResult' + responsibles.toString());

//     // НЕ РАБОТАЕТ
//     // debugPrint('resp');
//     // debugPrint(responsibles.toString());

//     // StreamBuilder(
//     //   stream: userBloc.userListStream,
//     //   builder: (context, snapshot) {
//     //     debugPrint(snapshot.toString());
//     //     return Text(_responsible);
//     //   }
//     // );

    
//     return responsibles;
//   }

//   _getSchets() {
//     _filter.skip = 0;
//     _filter.numberSchet = _schetNumber;
//     _filter.numberTTNOrOrder = _TNNumber;

//     var stringDateFrom = StringValue();
//     if (dateFromSelected) {
//       stringDateFrom.value = _dateFrom.toLocal().toString();
//     }
//     else {
//       stringDateFrom.value = DateTime(2010,1,1).toLocal().toString();
//     }
    
//     _filter.dateFrom = stringDateFrom;

//     var stringDateTo = StringValue();
//     stringDateTo.value = _dateTo.toLocal().toString();
//     _filter.dateTo = stringDateTo;
//     // ????
//     switch(dropdownvalue) {
//       case 'Все':
//         _filter.paymentCheck = 1;
//         break;
//       case 'Без платежного поручения':
//         _filter.paymentCheck = 2;
//         break;
//       case 'С платежным поручением':
//         _filter.paymentCheck = 5;
//         break;
//       case 'Без оплаченного ПП':
//         _filter.paymentCheck = 3;
//         break;
//       case 'С оплаченным ПП':
//         _filter.paymentCheck = 4;
//         break;
//       default:
//         break;
//     }
    
//       // {
//       //   name: 'Все',
//       //   PaymentCheck: 1
//       // },
//       // {
//       //   name: 'Без платежного поручения',
//       //   PaymentCheck: 2
//       // },
//       // {
//       //   name: 'С платежным поручением',
//       //   PaymentCheck: 5
//       // },
//       // {
//       //   name: 'С оплаченными ПП',
//       //   PaymentCheck: 4
//       // },
//       // {
//       //   name: 'С неоплаченными ПП',
//       //   PaymentCheck: 3
//       // }

//     _filter.description = _TNDescription;
//     if (_maxSum != "") {
//       // _filter.summaMax = double.parse(_maxSum);
//       var doubleV = DoubleValue();
//       doubleV.value = double.parse(_maxSum);
//       _filter.summaMax = doubleV;
//     }
    
//     if (_minSum != "") {
//       var doubleV = DoubleValue();
//       doubleV.value = double.parse(_minSum);
//       _filter.summaMax = doubleV;
//       // _filter.summaMin = double.parse(_minSum);
//     }
    

//     // из запроса
//     // _filter.payingOrganizationId 
//     // _filter.directoryCounterpartiesId
//     // нет для создателя и ответственного


//     list = [];
//     _schetListBloc.add(LoadSchetList(true, _filter));
//     Navigator.pop(context);
//     setState(() {
      
//     });
//   }
//   // _changeField(String type){
//   //   switch(type) {
//   //     case 'number':
//   //       setState(() => _schetNumber = _schetNumberController.text);
//   //       break;
//   //     default: 
//   //       break;
//   //   }
//   // }

//   Future<User?> _getUserData() async {
//     final user = await _storage.read(
//       key: "user",
//       aOptions: _getAndroidOptions(),
//     );
//     debugPrint(user);
//     var result = null;
//     if (user != null) {
//       result = User.fromJson(user);
//       // Map<String, dynamic> valueMap = json.decode(user);
//       // нужно переписать fromJson или нормально воспользоваться существующим
//       // result = User.fromJson(valueMap);
//     }
//     return result;
//   }

//   void _scrolListner() {
//     if (_scrollController.position.pixels ==
//             _scrollController.position.maxScrollExtent &&
//         _result.list.length != _totalCount) {
//       _schetListBloc.add(LoadSchetList(false, _filter));
//     }
//   }  

//   AndroidOptions _getAndroidOptions() => const AndroidOptions(
//     encryptedSharedPreferences: true,
//   );


//   void selectField(String selection, String type) {
//     debugPrint('1' + selection);
//     switch(type) {
//       case 'responsible':
//         UserFilter selected = responsibles.firstWhere((r) => r.fullName == selection);
//         _filter.setUserId = selected.id;
//         _filter.setUserName = selected.fullName;

//       case 'creator':
//         UserFilter selected = creators.firstWhere((r) => r.fullName == selection);
//         _filter.creatorId = selected.id;
//         _filter.creatorName = selected.fullName;

//       case 'contract':
//         ContractFilter selected = contracts.firstWhere((r) => r.name == selection);

//         // ЭТО ВРОДЕ ДЛЯ РАМОЧНЫХ
//         _filter.contractId = selected.id;

//         _filter.documentId.add(selected.id);

//         // _filter.creatorName = selected.name;
//         debugPrint(selected.id.toString());

//       case 'payingOrg':
//         CounterpartyFilter selected = counterparties.firstWhere((r) => r.name == selection);
//         _filter.payingOrganizationId = selected.id;
//         _filter.payingOrganizationName = selected.name;

//       case 'counterparty':
//         CounterpartyFilter selected = counterparties.firstWhere((r) => r.name == selection);
//         _filter.payingOrganizationId = selected.id;
//         _filter.payingOrganizationName = selected.name; 

//       case 'project':
//         ProjectFilter selected = projects.firstWhere((r) => r.name == selection);
//         _filter.projectId = selected.id;
//         _filter.projectName = selected.name; 
//     }
//   }

//   // Future<void> GetSchets() async {
//   //   _result = await clientApp.GetSchets(_filter);
//   //   // debugPrint(_result.toString());
//   //   if(_result.succssed) {
//   //     list.addAll(_result.list);
//   //   }
//   // setState(() {});
//   // }
//   // @override
//   // void initState() {
//   //   GetSchets();
//   //   setState(() => _filter = _filter);
//   //   setState(() => _result = _result);
//   //   super.initState();
//   // }

//   Future<void> _logout() async {
//     await _storage.delete(
//       key: "token",
//       aOptions: _getAndroidOptions(),
//     );
//     Navigator.of(context).pushNamed('/login');
//   }


//   Future<DateTime?> pickDateFrom() => showDatePicker(
//     context: context, 
//     initialDate: _dateFrom, 
//     firstDate: DateTime(1900), 
//     lastDate: DateTime(2100),
//     locale: const Locale('ru')
//   );

//   Future<DateTime?> pickDateTo() => showDatePicker(
//     context: context, 
//     initialDate: _dateTo, 
//     firstDate: DateTime(1900), 
//     lastDate: DateTime(2100),
//     locale: const Locale('ru')
//   );

//   Future<void> _dialogBuilder(BuildContext context) {

//     final theme = Theme.of(context);

//     return showDialog<void>(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog.fullscreen(
//           child: 
//           Column(
//             mainAxisSize: MainAxisSize.max,
//             children:[
//               Expanded(child: SingleChildScrollView(
//                 // child: 
//                 // Padding(
//                 //   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: <Widget>[

//                       //СТРИМ
//                         // StreamBuilder(
//                         //   stream: userBloc.userListStream,
//                         //   builder: (context, snapshot) {
//                         //     debugPrint('snap' + snapshot.data.toString());
//                         //     if (snapshot.data != null) {
//                         //       responsibles = snapshot.data as List<UserFilter>;
//                         //       setState(() => {});
//                         //     }
                            
//                         //     return Text(_responsible);
//                         //   }
//                         // ),

//                           // Padding(
//                           //   padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
//                           //   child: TextField(
//                           //     style: const TextStyle(fontSize: 18),
//                           //     controller: _schetNumberController,
//                           //     decoration: const InputDecoration(
//                           //       contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                           //       border: OutlineInputBorder(),
//                           //       labelText: 'Номер счета',
//                           //       hintText: 'Номер счета'),
//                           //   ),
//                           // ),
//                           // Padding(
//                           //   padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
//                           //   child: TextField(
//                           //     style: const TextStyle(fontSize: 18),
//                           //     controller: _schetNumberController,
//                           //     decoration: const InputDecoration(
//                           //       contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                           //       border: OutlineInputBorder(),
//                           //       labelText: 'Номер ТТН / заказа',
//                           //       hintText: 'Номер ТТН / заказа'),
//                           //   ),
//                           // ),
//                           Padding(
//                             padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
//                             child: TextField(
//                               style: const TextStyle(fontSize: 18),
//                               controller: _TNDescriptionController,
//                               decoration: const InputDecoration(
//                                 contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                                 border: OutlineInputBorder(),
//                                 labelText: 'Описание ТТН / заказа',
//                                 hintText: 'Описание ТТН / заказа'),
//                             ),
//                           ),

//                           Padding(
//                             padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
//                             child: StreamBuilder(
//                               stream: counterpartyBloc.counterpartyListStream,
//                               builder: (context, snapshot) {
//                                 // debugPrint('snap' + snapshot.data.toString());
//                                 if (snapshot.data != null) {
//                                   counterparties = snapshot.data as List<CounterpartyFilter>;
//                                 }

//                                 return Autocomplete<String>(
//                                   initialValue: TextEditingValue(text: _counterparty),
//                                   optionsBuilder: (TextEditingValue textEditingValue) async {
//                                     _counterparty = textEditingValue.text;

//                                     // ФИКС ФИЛЬТРА
//                                     _filter.payingOrganizationId = "";
//                                     _filter.payingOrganizationName = "";

//                                     _getCounterparties(true);
//                                     final Iterable<CounterpartyFilter> options = counterparties;
//                                     if (_counterparty != textEditingValue.text) {
//                                       // return _lastOptions;
//                                       return _lastCounterpartyOptions.map((resp) => resp.name);
//                                     }
//                                     _lastCounterpartyOptions = options;
//                                     // debugPrint('opt' + options.toString());
//                                     // return options;
//                                     return options.map((resp) => resp.name);
//                                   },
//                                   fieldViewBuilder: ((context,
//                                       textEditingController,
//                                       focusNode,
//                                       onFieldSubmitted) {
//                                     return TextField(
//                                       style: const TextStyle(fontSize: 18),
//                                       controller: textEditingController,
//                                       focusNode: focusNode,
//                                       onEditingComplete: onFieldSubmitted,
//                                       decoration: const InputDecoration(
//                                         contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                                         border: OutlineInputBorder(),
//                                         labelText: 'Выберите оплачивающую организацию',
//                                         hintText: 'Выберите оплачивающую организацию'),
//                                     );
//                                   }),
//                                   onSelected: (String selection) {
//                                     selectField(selection, 'payingOrg');
//                                   },
//                                 );
//                               }
//                             ),
//                             // child: TextField(
//                             //   style: const TextStyle(fontSize: 18),
//                             //   controller: _organizationController,
//                             //   decoration: const InputDecoration(
//                             //     contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                             //     border: OutlineInputBorder(),
//                             //     labelText: 'Выберите оплачивающую организацию',
//                             //     hintText: 'Выберите оплачивающую организацию'),
//                             // ),
//                           ),

//                           Padding(
//                             padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
//                             child: StreamBuilder(
//                               stream: counterpartyBloc.counterpartyListStream,
//                               builder: (context, snapshot) {
//                                 // debugPrint('snap' + snapshot.data.toString());
//                                 if (snapshot.data != null) {
//                                   counterparties = snapshot.data as List<CounterpartyFilter>;
//                                 }

//                                 return Autocomplete<String>(
//                                   initialValue: TextEditingValue(text: _counterparty),
//                                   optionsBuilder: (TextEditingValue textEditingValue) async {

//                                     _counterparty = textEditingValue.text;

//                                     // ФИКС ФИЛЬТРА
//                                     _filter.directoryCounterpartiesId = "";
//                                     _filter.directoryCounterpartiesName = "";
//                                     _getCounterparties(false);

//                                     final Iterable<CounterpartyFilter> options = counterparties;
//                                     if (_counterparty != textEditingValue.text) {
//                                       // return _lastOptions;
//                                       return _lastCounterpartyOptions.map((resp) => resp.name);
//                                     }
//                                     _lastCounterpartyOptions = options;
//                                     // debugPrint('opt' + options.toString());
//                                     // return options;
//                                     return options.map((resp) => resp.name);
//                                   },
//                                   fieldViewBuilder: ((context,
//                                       textEditingController,
//                                       focusNode,
//                                       onFieldSubmitted) {
//                                     return TextField(
//                                       style: const TextStyle(fontSize: 18),
//                                       controller: textEditingController,
//                                       focusNode: focusNode,
//                                       onEditingComplete: onFieldSubmitted,
//                                       decoration: const InputDecoration(
//                                         contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                                         border: OutlineInputBorder(),
//                                         labelText: 'Выберите контрагента',
//                                         hintText: 'Выберите контрагента'),
//                                     );
//                                   }),
//                                   onSelected: (String selection) {
//                                     selectField(selection, 'counterparty');
//                                   },
//                                 );
//                               }
//                             ),
//                             // child: TextField(
//                             //   style: const TextStyle(fontSize: 18),
//                             //   controller: _counterpartyController,
//                             //   decoration: const InputDecoration(
//                             //     contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                             //     border: OutlineInputBorder(),
//                             //     labelText: 'Выберите контрагента',
//                             //     hintText: 'Выберите контрагента'),
//                             // ),
//                           ),
                          
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               Expanded(
//                                 flex: 1,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 5.0, left: 20.0),
//                                   child: TextField(
//                                     style: const TextStyle(fontSize: 18),
//                                     controller: _schetNumberController,
//                                     decoration: const InputDecoration(
//                                       contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                                       border: OutlineInputBorder(),
//                                       labelText: 'Номер счета',
//                                       hintText: 'Номер счета'),
//                                   ),
//                                 ),
//                               ),

//                               Expanded(
//                                 flex: 1,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
//                                   child: TextField(
//                                     style: const TextStyle(fontSize: 18),
//                                     controller: _TNNumberController,
//                                     decoration: const InputDecoration(
//                                       contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                                       border: OutlineInputBorder(),
//                                       labelText: 'Номер ТТН / заказа',
//                                       hintText: 'Номер ТТН / заказа'),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),

//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               Expanded(
//                                 flex: 1,
//                                 child: Column(
//                                   children: [
//                                     const Text(
//                                       'Дата создания ОТ', 
//                                       style: TextStyle(fontSize: 16)
//                                     ),
//                                     OutlinedButton(
//                                       onPressed: () async {
//                                         final date = await pickDateFrom();
//                                         if (date == null) return;
//                                         setState(() => _dateFrom = date);
//                                         setState(() => dateFromSelected = true);
//                                       }, 
//                                       style: ButtonStyle(
//                                         shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
//                                       ),
//                                       child: Text(
//                                         // '${_dateFrom.year}/${_dateFrom.month}/${_dateFrom.day}',
//                                         '${_dateFrom.day}.${_dateFrom.month}.${_dateFrom.year}',
//                                         style: const TextStyle(fontSize: 18)
//                                         )
//                                       )
//                                   ]
//                                 ),
//                               ),

//                               Expanded(
//                                 flex: 1,
//                                 child: Column(
//                                   children: [
//                                     const Text(
//                                       'Дата создания ДО', 
//                                       style: TextStyle(fontSize: 16)
//                                     ),
//                                     OutlinedButton(
//                                       onPressed: () async {
//                                         final date = await pickDateTo();
//                                         if (date == null) return;
//                                         setState(() => _dateTo = date);
//                                       }, 
//                                       style: ButtonStyle(
//                                         shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
//                                       ),
//                                       child: Text(
//                                         // '${_dateTo.year}/${_dateTo.month}/${_dateTo.day}',
//                                         '${_dateTo.day}.${_dateTo.month}.${_dateTo.year}',
//                                         style: const TextStyle(fontSize: 18)
//                                         )
//                                       )
//                                   ]
//                                 ),
//                               ),
//                             ],
//                           ),

//                           Padding(
//                             padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
//                             child: StreamBuilder(
//                               stream: userBloc.userListStream,
//                               builder: (context, snapshot) {
//                                 // debugPrint('snap' + snapshot.data.toString());
//                                 if (snapshot.data != null) {
//                                   creators = snapshot.data as List<UserFilter>;
//                                   // debugPrint('stream' + responsibles.toString());
//                                   // setState(() => {});
//                                 }
                                
//                                 // return Autocomplete<UserFilter>(
//                                 return Autocomplete<String>(
//                                   initialValue: TextEditingValue(text: _creator),
//                                   optionsBuilder: (TextEditingValue textEditingValue) async {

//                                     _creator = textEditingValue.text;

//                                     // ФИКС ФИЛЬТРА
//                                     _filter.creatorId = "";

//                                     _getCreators();


//                                     final Iterable<UserFilter> options = creators;
//                                     if (_creator != textEditingValue.text) {
//                                       // return _lastOptions;
//                                       return _lastOptions.map((resp) => resp.fullName);
//                                     }
//                                     _lastOptions = options;
//                                     // debugPrint('opt' + options.toString());
//                                     // return options;
//                                     return options.map((resp) => resp.fullName);
//                                   },
//                                   fieldViewBuilder: ((context,
//                                       textEditingController,
//                                       focusNode,
//                                       onFieldSubmitted) {
//                                     return TextField(
//                                       style: const TextStyle(fontSize: 18),
//                                       controller: textEditingController,
//                                       focusNode: focusNode,
//                                       onEditingComplete: onFieldSubmitted,
//                                       decoration: const InputDecoration(
//                                         contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                                         border: OutlineInputBorder(),
//                                         labelText: 'Создал',
//                                         hintText: 'Создал'),
//                                     );
//                                   }),
//                                   onSelected: (String selection) {
//                                     selectField(selection, 'creator');
//                                   },
//                                 );
//                               }
//                             ),
//                             // child: TextField(
//                             //   style: const TextStyle(fontSize: 18),
//                             //   controller: _creatorController,
//                             //   decoration: const InputDecoration(
//                             //     contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                             //     border: OutlineInputBorder(),
//                             //     labelText: 'Создал',
//                             //     hintText: 'Создал'),
//                             // ),
                            
//                           ),

//                           Padding(
//                             padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
//                             // child: TextField(
//                             //   style: const TextStyle(fontSize: 18),
//                             //   controller: _responsibleController,
//                             //   decoration: const InputDecoration(
//                             //     contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                             //     border: OutlineInputBorder(),
//                             //     labelText: 'Ответственный',
//                             //     hintText: 'Ответственный'),
//                             // ),
//                             child: StreamBuilder(
//                               stream: userBloc.userListStream,
//                               builder: (context, snapshot) {
//                                 // debugPrint('snap' + snapshot.data.toString());
//                                 if (snapshot.data != null) {
//                                   responsibles = snapshot.data as List<UserFilter>;
//                                   // debugPrint('stream' + responsibles.toString());
//                                   // setState(() => {});
//                                 }
                                
//                                 // return Autocomplete<UserFilter>(
//                                 return Autocomplete<String>(
//                                   initialValue: TextEditingValue(text: _responsible),
//                                   optionsBuilder: (TextEditingValue textEditingValue) async {


//                                     _responsible = textEditingValue.text;

//                                     // ФИКС ФИЛЬТРА
//                                     _filter.setUserId = "";

//                                     _getResponsibles();


//                                     final Iterable<UserFilter> options = responsibles;
//                                     if (_responsible != textEditingValue.text) {
//                                       // return _lastOptions;
//                                       return _lastOptions.map((resp) => resp.fullName);
//                                     }
//                                     _lastOptions = options;
//                                     // debugPrint('opt' + options.toString());
//                                     // return options;
//                                     return options.map((resp) => resp.fullName);
//                                   },
//                                   fieldViewBuilder: ((context,
//                                       textEditingController,
//                                       focusNode,
//                                       onFieldSubmitted) {
//                                     return TextField(
//                                       style: const TextStyle(fontSize: 18),
//                                       controller: textEditingController,
//                                       focusNode: focusNode,
//                                       onEditingComplete: onFieldSubmitted,
//                                       decoration: const InputDecoration(
//                                         contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                                         border: OutlineInputBorder(),
//                                         labelText: 'Ответственный',
//                                         hintText: 'Ответственный'),
//                                     );
//                                   }),
//                                   onSelected: (String selection) {
//                                     selectField(selection, 'responsible');
//                                   },
//                                 );
//                               }
//                             ),
//                             // child: Autocomplete<UserFilter>(
//                             //   optionsBuilder: (TextEditingValue textEditingValue) async {
//                             //     _responsible = textEditingValue.text;
//                             //     final Iterable<UserFilter> options =
//                             //         await _getResponsibles();
//                             //     if (_responsible != textEditingValue.text) {
//                             //       return _lastOptions;
//                             //     }
//                             //     _lastOptions = options;
//                             //     return options;
//                             //   },
                              
//                             //   // optionsBuilder: (TextEditingValue textEditingValue) {
//                             //   //   await _getResponsibles();
//                             //   //   if (textEditingValue.text == '') {
//                             //   //     return const Iterable<UserFilter>.empty();
//                             //   //   }
//                             //   //   return responsibles.where((UserFilter user) {
//                             //   //     return user.fullName.contains(textEditingValue.text.toLowerCase());
//                             //   //   });
//                             //   // },
//                             //   onSelected: (UserFilter selection) {
//                             //     debugPrint('You just selected $selection');
//                             //   },
//                             // )
//                           ),

//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               Expanded(
//                                 flex: 1,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 5.0, left: 20.0),
//                                   child: TextField(
//                                     style: const TextStyle(fontSize: 18),
//                                     controller: _minSumController,
//                                     keyboardType: TextInputType.number,
//                                     inputFormatters: <TextInputFormatter>[
//                                       FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), 
//                                       FilteringTextInputFormatter.digitsOnly
//                                     ],
//                                     decoration: const InputDecoration(
//                                       contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                                       border: OutlineInputBorder(),
//                                       labelText: 'Сумма от',
//                                       hintText: 'Сумма от'),
//                                   ),
//                                 ),
//                               ),

//                               Expanded(
//                                 flex: 1,
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0),
//                                   child: TextField(
//                                     style: const TextStyle(fontSize: 18),
//                                     controller: _maxSumController,
//                                     keyboardType: TextInputType.number,
//                                     inputFormatters: <TextInputFormatter>[
//                                       FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), 
//                                       FilteringTextInputFormatter.digitsOnly
//                                     ],
//                                     decoration: const InputDecoration(
//                                       contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                                       border: OutlineInputBorder(),
//                                       labelText: 'Сумма до',
//                                       hintText: 'Сумма до'),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),

//                           Padding(
//                             padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
//                             child: StreamBuilder(
//                               stream: contractBloc.contractListStream,
//                               builder: (context, snapshot) {
//                                 // debugPrint('snap' + snapshot.data.toString());
//                                 if (snapshot.data != null) {
//                                   contracts = snapshot.data as List<ContractFilter>;
//                                   // debugPrint('stream' + responsibles.toString());
//                                   // setState(() => {});
//                                 }
                                
//                                 // return Autocomplete<ContractFilter>(
//                                 return Autocomplete<String>(
//                                   initialValue: TextEditingValue(text: _contract),
//                                   optionsBuilder: (TextEditingValue textEditingValue) async {

                                    
//                                     // ТЕСТ ДЕБАУНСА
//                                     // Добавлял я
//                                     Iterable<ContractFilter> options = contracts;

//                                     _contract = textEditingValue.text;

//                                     if (_debounce?.isActive ?? false) _debounce?.cancel();
//                                     _debounce = Timer(const Duration(milliseconds: 1500), () {
                                      
                                      
//                                       debugPrint('deb' + _contract);
//                                       _getContracts();

//                                       // Добавлял я
//                                       options = contracts;
//                                       _lastContractOptions = options;
//                                       setState(() {
                                        
//                                       });



//                                       // if (_contract != textEditingValue.text) {
//                                       //   return _lastContractOptions.map((resp) => resp.name);
//                                       // }
//                                       // _lastContractOptions = options;

//                                       // return options.map((resp) => resp.name);

//                                     });

//                                     //РАБОЧИЙ ВАРИАНТ
//                                   //   _contract = textEditingValue.text;

//                                   //   debugPrint(_contract);

//                                   //   _filter.documentId.clear();
//                                   //   _filter.contractId = "";
//                                   //   _getContracts();
//                                   //  final Iterable<ContractFilter> options = contracts;

//                                     if (_contract != textEditingValue.text) {
//                                       // return _lastContractOptions;
//                                       return _lastContractOptions.map((resp) => resp.name);
//                                     }
//                                     _lastContractOptions = options;
//                                     // debugPrint('opt' + options.toString());
//                                     // return options;
//                                     return options.map((resp) => resp.name);
//                                   },
//                                   fieldViewBuilder: ((context,
//                                       textEditingController,
//                                       focusNode,
//                                       onFieldSubmitted) {
//                                     return TextField(
//                                       style: const TextStyle(fontSize: 18),
//                                       controller: textEditingController,
//                                       focusNode: focusNode,
//                                       onEditingComplete: onFieldSubmitted,
//                                       decoration: const InputDecoration(
//                                         contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                                         border: OutlineInputBorder(),
//                                         labelText: 'Договор',
//                                         hintText: 'Договор'),
//                                     );
//                                   }),
//                                   onSelected: (String selection) {
//                                     selectField(selection, 'contract');
//                                   },
//                                   // onSelected: (ContractFilter c) {
//                                   //   selectField(c.name, 'contract');
//                                   // },
//                                 );
//                               }
//                             ),
//                             // child: TextField(
//                             //   style: const TextStyle(fontSize: 18),
//                             //   controller: _contractController,
//                             //   decoration: const InputDecoration(
//                             //     contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                             //     border: OutlineInputBorder(),
//                             //     labelText: 'Договор',
//                             //     hintText: 'Договор'),
//                             // ),
//                           ),

//                           Padding(
//                             padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
//                             child: StreamBuilder(
//                               stream: projectBloc.projectListStream,
//                               builder: (context, snapshot) {
//                                 // debugPrint('snap' + snapshot.data.toString());
//                                 if (snapshot.data != null) {
//                                   projects = snapshot.data as List<ProjectFilter>;
//                                 }

//                                 return Autocomplete<String>(
//                                   initialValue: TextEditingValue(text: _project),
//                                   optionsBuilder: (TextEditingValue textEditingValue) async {


//                                     _project = textEditingValue.text;

//                                     // ФИКС ФИЛЬТРА
//                                     _filter.projectId = "";
//                                     _filter.projectName = "";


//                                     debugPrint(_project);
//                                     _getProjects();

//                                     final Iterable<ProjectFilter> options = projects;
//                                     if (_project != textEditingValue.text) {
//                                       // return _lastOptions;
//                                       return _lastProjectOptions.map((resp) => resp.name);
//                                     }
//                                     _lastProjectOptions = options;
//                                     // debugPrint('opt' + options.toString());
//                                     // return options;
//                                     return options.map((resp) => resp.name);
//                                   },
//                                   fieldViewBuilder: ((context,
//                                       textEditingController,
//                                       focusNode,
//                                       onFieldSubmitted) {
//                                     return TextField(
//                                       style: const TextStyle(fontSize: 18),
//                                       controller: textEditingController,
//                                       focusNode: focusNode,
//                                       onEditingComplete: onFieldSubmitted,
//                                       // onChanged: (value) => {
//                                       //   debugPrint(value)
//                                       // }
                                        
//                                         // if (value.trim() == "") {
//                                         //   _filter.documentId.clear()
//                                         //   // _filter.contractId = "";
//                                         // }
//                                       // ,
//                                       decoration: const InputDecoration(
//                                         contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                                         border: OutlineInputBorder(),
//                                         labelText: 'Проект',
//                                         hintText: 'Проект'),
//                                     );
//                                   }),
//                                   onSelected: (String selection) {
//                                     selectField(selection, 'project');
//                                   },
//                                 );
//                               }
//                             ),
//                             // child: TextField(
//                             //   style: const TextStyle(fontSize: 18),
//                             //   controller: _projectController,
//                             //   decoration: const InputDecoration(
//                             //     contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                             //     border: OutlineInputBorder(),
//                             //     labelText: 'Проект',
//                             //     hintText: 'Проект'),
//                             // ),
//                           ),

//                           Padding(
//                             padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
//                             child: 
//                             DropdownButton<String>(
                                
//                               value: dropdownvalue,
//                               icon: const Icon(Icons.keyboard_arrow_down),    
//                               items: items.map((String item) {
//                                 return DropdownMenuItem(
//                                   value: item,
//                                   // child: Text(item, style: theme.textTheme.titleMedium,),
//                                   child: Text(item, style: const TextStyle(color: Colors.black, fontSize: 16 ),),
//                                 );
//                               }).toList(),
//                               onChanged: (String? newValue) { 
//                                 // debugPrint(newValue);
//                                 setState(() {
//                                   if (newValue != null) {
//                                     debugPrint(newValue);
//                                     debugPrint('est');
//                                   }
//                                   else {
//                                     debugPrint('net');
//                                   }
//                                   _changePaymentCheck();
//                                   dropdownvalue = newValue!.toString();
//                                 });
//                               },
//                             ),
//                           )
                          
//                         ],) ),),
//                       Padding(
//                       padding: const EdgeInsets.only(top: 10.0),
//                       child: Align(
//                       alignment: Alignment.bottomRight,
//                       child: FilledButton(
//                         onPressed: () {
//                           _getSchets();
//                         },
//                         child: const Text(
//                           'Сохранить',
//                         ),
//                       ),
//                     ),
//                     )
//                   ]
//                 // )
//                 )
//           // Expanded(
//           //   child: Container(
//           //     padding: const EdgeInsets.all(16.0),
//           //     width: MediaQuery.of(context).size.width,
//           //     height: MediaQuery.of(context).size.height - 500,
//           //     // child: Column(
//           //     // // child: Column (
//           //     //   children: [
//           //        child: ListView(
//           //           scrollDirection: Axis.vertical,
//           //           shrinkWrap: true,
//           //       // child: Expanded(
//           //       // scrollDirection: Axis.vertical,
//           //       // child: ConstrainedBox(
//           //       //   constraints: const BoxConstraints(),
//           //           // child: Column(
//           //           children: <Widget>[
//           //               // Padding(
//           //               //   padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
//           //               //   child: TextField(
//           //               //     style: const TextStyle(fontSize: 18),
//           //               //     controller: _schetNumberController,
//           //               //     decoration: const InputDecoration(
//           //               //       contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//           //               //       border: OutlineInputBorder(),
//           //               //       labelText: 'Номер счета',
//           //               //       hintText: 'Номер счета'),
//           //               //   ),
//           //               // ),
//           //               // Padding(
//           //               //   padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
//           //               //   child: TextField(
//           //               //     style: const TextStyle(fontSize: 18),
//           //               //     controller: _schetNumberController,
//           //               //     decoration: const InputDecoration(
//           //               //       contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//           //               //       border: OutlineInputBorder(),
//           //               //       labelText: 'Номер ТТН / заказа',
//           //               //       hintText: 'Номер ТТН / заказа'),
//           //               //   ),
//           //               // ),
//           //               Padding(
//           //                 padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
//           //                 child: TextField(
//           //                   style: const TextStyle(fontSize: 18),
//           //                   controller: _TNDescriptionController,
//           //                   decoration: const InputDecoration(
//           //                     contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//           //                     border: OutlineInputBorder(),
//           //                     labelText: 'Описание ТТН / заказа',
//           //                     hintText: 'Описание ТТН / заказа'),
//           //                 ),
//           //               ),

//           //               Padding(
//           //                 padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
//           //                 child: TextField(
//           //                   style: const TextStyle(fontSize: 18),
//           //                   controller: _organizationController,
//           //                   decoration: const InputDecoration(
//           //                     contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//           //                     border: OutlineInputBorder(),
//           //                     labelText: 'Выберите оплачивающую организацию',
//           //                     hintText: 'Выберите оплачивающую организацию'),
//           //                 ),
//           //               ),

//           //               Padding(
//           //                 padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
//           //                 child: TextField(
//           //                   style: const TextStyle(fontSize: 18),
//           //                   controller: _counterpartyController,
//           //                   decoration: const InputDecoration(
//           //                     contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//           //                     border: OutlineInputBorder(),
//           //                     labelText: 'Выберите контрагента',
//           //                     hintText: 'Выберите контрагента'),
//           //                 ),
//           //               ),
                        
//           //               Row(
//           //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //                 children: <Widget>[
//           //                   Expanded(
//           //                     flex: 1,
//           //                     child: Padding(
//           //                       padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 5.0),
//           //                       child: TextField(
//           //                         style: const TextStyle(fontSize: 18),
//           //                         controller: _schetNumberController,
//           //                         decoration: const InputDecoration(
//           //                           contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//           //                           border: OutlineInputBorder(),
//           //                           labelText: 'Номер счета',
//           //                           hintText: 'Номер счета'),
//           //                       ),
//           //                     ),
//           //                   ),

//           //                   Expanded(
//           //                     flex: 1,
//           //                     child: Padding(
//           //                       padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
//           //                       child: TextField(
//           //                         style: const TextStyle(fontSize: 18),
//           //                         controller: _TNNumberController,
//           //                         decoration: const InputDecoration(
//           //                           contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//           //                           border: OutlineInputBorder(),
//           //                           labelText: 'Номер ТТН / заказа',
//           //                           hintText: 'Номер ТТН / заказа'),
//           //                       ),
//           //                     ),
//           //                   ),
//           //                 ],
//           //               ),

//           //               Row(
//           //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //                 children: <Widget>[
//           //                   Expanded(
//           //                     flex: 1,
//           //                     child: Column(
//           //                       children: [
//           //                         const Text(
//           //                           'Дата создание ОТ', 
//           //                           style: TextStyle(fontSize: 16)
//           //                         ),
//           //                         OutlinedButton(
//           //                           onPressed: () async {
//           //                             final date = await pickDate();
//           //                             if (date == null) return;
//           //                             setState(() => _dateFrom = date);
//           //                           }, 
//           //                           style: ButtonStyle(
//           //                             shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
//           //                           ),
//           //                           child: Text(
//           //                             '${_dateFrom.year}/${_dateFrom.month}/${_dateFrom.day}',
//           //                             style: const TextStyle(fontSize: 18)
//           //                             )
//           //                           )
//           //                       ]
//           //                     ),
//           //                   ),

//           //                   Expanded(
//           //                     flex: 1,
//           //                     child: Column(
//           //                       children: [
//           //                         const Text(
//           //                           'Дата создание ДО', 
//           //                           style: TextStyle(fontSize: 16)
//           //                         ),
//           //                         OutlinedButton(
//           //                           onPressed: () async {}, 
//           //                           style: ButtonStyle(
//           //                             shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
//           //                           ),
//           //                           child: Text(
//           //                             '${_dateTo.year}/${_dateTo.month}/${_dateTo.day}',
//           //                             style: const TextStyle(fontSize: 18)
//           //                             )
//           //                           )
//           //                       ]
//           //                     ),
//           //                   ),
//           //                 ],
//           //               ),

//           //               Padding(
//           //                 padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
//           //                 child: TextField(
//           //                   style: const TextStyle(fontSize: 18),
//           //                   controller: _creatorController,
//           //                   decoration: const InputDecoration(
//           //                     contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//           //                     border: OutlineInputBorder(),
//           //                     labelText: 'Создал',
//           //                     hintText: 'Создал'),
//           //                 ),
//           //               ),

//           //               Padding(
//           //                 padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
//           //                 child: TextField(
//           //                   style: const TextStyle(fontSize: 18),
//           //                   controller: _responsibleController,
//           //                   decoration: const InputDecoration(
//           //                     contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//           //                     border: OutlineInputBorder(),
//           //                     labelText: 'Ответственный',
//           //                     hintText: 'Ответственный'),
//           //                 ),
//           //               ),

//           //               Row(
//           //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //                 children: <Widget>[
//           //                   Expanded(
//           //                     flex: 1,
//           //                     child: Padding(
//           //                       padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 5.0),
//           //                       child: TextField(
//           //                         style: const TextStyle(fontSize: 18),
//           //                         controller: _minSumController,
//           //                         keyboardType: TextInputType.number,
//           //                         inputFormatters: <TextInputFormatter>[
//           //                           FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), 
//           //                           FilteringTextInputFormatter.digitsOnly
//           //                         ],
//           //                         decoration: const InputDecoration(
//           //                           contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//           //                           border: OutlineInputBorder(),
//           //                           labelText: 'Сумма от',
//           //                           hintText: 'Сумма от'),
//           //                       ),
//           //                     ),
//           //                   ),

//           //                   Expanded(
//           //                     flex: 1,
//           //                     child: Padding(
//           //                       padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
//           //                       child: TextField(
//           //                         style: const TextStyle(fontSize: 18),
//           //                         controller: _maxSumController,
//           //                         keyboardType: TextInputType.number,
//           //                         inputFormatters: <TextInputFormatter>[
//           //                           FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), 
//           //                           FilteringTextInputFormatter.digitsOnly
//           //                         ],
//           //                         decoration: const InputDecoration(
//           //                           contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//           //                           border: OutlineInputBorder(),
//           //                           labelText: 'Сумма до',
//           //                           hintText: 'Сумма до'),
//           //                       ),
//           //                     ),
//           //                   ),
//           //                 ],
//           //               ),

//           //               Padding(
//           //                 padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
//           //                 child: TextField(
//           //                   style: const TextStyle(fontSize: 18),
//           //                   controller: _contractController,
//           //                   decoration: const InputDecoration(
//           //                     contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//           //                     border: OutlineInputBorder(),
//           //                     labelText: 'Договор',
//           //                     hintText: 'Договор'),
//           //                 ),
//           //               ),

//           //               Padding(
//           //                 padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
//           //                 child: TextField(
//           //                   style: const TextStyle(fontSize: 18),
//           //                   controller: _projectController,
//           //                   decoration: const InputDecoration(
//           //                     contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//           //                     border: OutlineInputBorder(),
//           //                     labelText: 'Проект',
//           //                     hintText: 'Проект'),
//           //                 ),
//           //               ),

//           //               Padding(
//           //                 padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
//           //                 child: 
//           //                 DropdownButton<String>(
                              
//           //                   value: dropdownvalue,
//           //                   icon: const Icon(Icons.keyboard_arrow_down),    
//           //                   items: items.map((String item) {
//           //                     return DropdownMenuItem(
//           //                       value: item,
//           //                       // child: Text(item, style: theme.textTheme.titleMedium,),
//           //                       child: Text(item, style: TextStyle(color: Colors.black.withOpacity(0.6)),),
//           //                     );
//           //                   }).toList(),
//           //                   onChanged: (String? newValue) { 
//           //                     setState(() {
//           //                       dropdownvalue = newValue!;
//           //                     });
//           //                   },
//           //                 ),
//           //               )
                        
//           //             ]
//           //           // )
//           //         ),

//                   // Padding(
//                   //   padding: const EdgeInsets.only(top: 10.0),
//                   //   child: Align(
//                   //   alignment: Alignment.bottomRight,
//                   //   child: FilledButton(
//                   //     onPressed: () {
//                   //       _getSchets();
//                   //     },
//                   //     child: Text(
//                   //       'Сохранить',
//                   //     ),
//                   //   ),
//                   // ),
//                   // )
                
//               );

//             // )

//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Список счетов'),
//           actions: <Widget>[
//             IconButton(
//               icon: const Icon(Icons.logout),
//               tooltip: 'Выйти',
//               onPressed: () {
//                 _logout();
//               },
//             ),
//           ]
//         ),
//         body: BlocBuilder<SchetListBloc, SchetListState>(
//           bloc: _schetListBloc,
//           builder: (context, state) {
//             if (state is SchetListInitial) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else {
//               if (state is SchetListSuccessed) {
//                 list = [...list, ...state.listSchets];
//                 _totalCount = state.totalCount;
//               }
//               return ListView.builder(
//                 controller: _scrollController,
//                 padding: const EdgeInsets.all(10.0),
//                 itemBuilder: (context, i) {
//                   if (state is SchetListSuccessed) {
//                     if (i < list.length) {
//                       return SchetCard(schet: list[i]);
//                     }
//                   }
//                     if (state is SchetListLoading) {
//                       return const Card(
//                         child: Center(
//                           child: CircularProgressIndicator(),
//                         ),
//                       );
//                     }
//                     if (state is SchetListFailure) {
//                       return Card(
//                         child: Center(
//                           child: Text(
//                             state.errorMessage,
//                             style: const TextStyle(
//                                 color: Colors.red,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w900),
//                           ),
//                         ),
//                       );

//                   }
//                   return const Center(
//                     child: Text('Произошла ошибка',
//                         style: TextStyle(
//                             color: Colors.red,
//                             fontSize: 16,
//                             fontWeight: FontWeight.w900)),
//                   );
//                 },
//                 itemCount:  list.length < _totalCount ?  list.length + 1 : list.length
//               );
//             }
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () => _dialogBuilder(context),
//           shape: const CircleBorder(),
//           backgroundColor: Colors.blue[900],
//           child: const Icon(Icons.filter_alt_sharp , color: Colors.white,),
//         ),
//         );
//   }
// }