import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/features/schets/services/schet.pb.dart';

import '../../../../generated/account.pb.dart';
import '../../../login/bloc/login_bloc.dart';
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
  List<SchetListView> list = [];
  final _storage = const FlutterSecureStorage();

  // late User user;
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
  // void initState() async {
    // получаем юзера из стейта
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = BlocProvider.of<LoginBloc>(context).state;
      if (state is LoginSuccessed) {
        user = state.user;
      }
    });
    
    // final user = await _getUserData();

    // Не работает
    // user = userString as User;
    // User user = User.fromJson(userString);

    // debugPrint(user.toString());

    // if (user != null) {
    //   _filter.userId = user.id;
    // }
    

    _schetListBloc.add(LoadSchetList(true, _filter));
    setState(() => _filter = _filter);
    setState(() => _result = _result);
    _scrollController.addListener(_scrolListner);
    super.initState();

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


  _getSchets() {
    _filter.skip = 0;
    _filter.numberSchet = _schetNumber;
    _filter.numberTTNOrOrder = _TNNumber;
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
    
      // {
      //   name: 'Все',
      //   PaymentCheck: 1
      // },
      // {
      //   name: 'Без платежного поручения',
      //   PaymentCheck: 2
      // },
      // {
      //   name: 'С платежным поручением',
      //   PaymentCheck: 5
      // },
      // {
      //   name: 'С оплаченными ПП',
      //   PaymentCheck: 4
      // },
      // {
      //   name: 'С неоплаченными ПП',
      //   PaymentCheck: 3
      // }

    _filter.description = _TNDescription;
    if (_maxSum != "") {
      _filter.summaMax = double.parse(_maxSum);
    }
    
    if (_minSum != "") {
      _filter.summaMin = double.parse(_minSum);
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
    final user = await _storage.read(
      key: "user",
      aOptions: _getAndroidOptions(),
    );
    debugPrint(user);
    var result = null;
    if (user != null) {
      result = User.fromJson(user);
      // Map<String, dynamic> valueMap = json.decode(user);
      // нужно переписать fromJson или нормально воспользоваться существующим
      // result = User.fromJson(valueMap);
    }
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
                // child: 
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
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
                            child: TextField(
                              style: const TextStyle(fontSize: 18),
                              controller: _organizationController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                border: OutlineInputBorder(),
                                labelText: 'Выберите оплачивающую организацию',
                                hintText: 'Выберите оплачивающую организацию'),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                            child: TextField(
                              style: const TextStyle(fontSize: 18),
                              controller: _counterpartyController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                border: OutlineInputBorder(),
                                labelText: 'Выберите контрагента',
                                hintText: 'Выберите контрагента'),
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
                                      'Дата создание ОТ', 
                                      style: TextStyle(fontSize: 16)
                                    ),
                                    OutlinedButton(
                                      onPressed: () async {
                                        final date = await pickDate();
                                        if (date == null) return;
                                        setState(() => _dateFrom = date);
                                      }, 
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
                                      ),
                                      child: Text(
                                        '${_dateFrom.year}/${_dateFrom.month}/${_dateFrom.day}',
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
                                      'Дата создание ДО', 
                                      style: TextStyle(fontSize: 16)
                                    ),
                                    OutlinedButton(
                                      onPressed: () async {}, 
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
                                      ),
                                      child: Text(
                                        '${_dateTo.year}/${_dateTo.month}/${_dateTo.day}',
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
                            child: TextField(
                              style: const TextStyle(fontSize: 18),
                              controller: _creatorController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                border: OutlineInputBorder(),
                                labelText: 'Создал',
                                hintText: 'Создал'),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                            child: TextField(
                              style: const TextStyle(fontSize: 18),
                              controller: _responsibleController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                border: OutlineInputBorder(),
                                labelText: 'Ответственный',
                                hintText: 'Ответственный'),
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
                            child: TextField(
                              style: const TextStyle(fontSize: 18),
                              controller: _contractController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                border: OutlineInputBorder(),
                                labelText: 'Договор',
                                hintText: 'Договор'),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 20.0, left: 20.0),
                            child: TextField(
                              style: const TextStyle(fontSize: 18),
                              controller: _projectController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                border: OutlineInputBorder(),
                                labelText: 'Проект',
                                hintText: 'Проект'),
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
                                    debugPrint('est');
                                  }
                                  else {
                                    debugPrint('net');
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
                        child: Text(
                          'Сохранить',
                        ),
                      ),
                    ),
                    )
                  ]
                // )
                )
          // Expanded(
          //   child: Container(
          //     padding: const EdgeInsets.all(16.0),
          //     width: MediaQuery.of(context).size.width,
          //     height: MediaQuery.of(context).size.height - 500,
          //     // child: Column(
          //     // // child: Column (
          //     //   children: [
          //        child: ListView(
          //           scrollDirection: Axis.vertical,
          //           shrinkWrap: true,
          //       // child: Expanded(
          //       // scrollDirection: Axis.vertical,
          //       // child: ConstrainedBox(
          //       //   constraints: const BoxConstraints(),
          //           // child: Column(
          //           children: <Widget>[
          //               // Padding(
          //               //   padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          //               //   child: TextField(
          //               //     style: const TextStyle(fontSize: 18),
          //               //     controller: _schetNumberController,
          //               //     decoration: const InputDecoration(
          //               //       contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //               //       border: OutlineInputBorder(),
          //               //       labelText: 'Номер счета',
          //               //       hintText: 'Номер счета'),
          //               //   ),
          //               // ),
          //               // Padding(
          //               //   padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          //               //   child: TextField(
          //               //     style: const TextStyle(fontSize: 18),
          //               //     controller: _schetNumberController,
          //               //     decoration: const InputDecoration(
          //               //       contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //               //       border: OutlineInputBorder(),
          //               //       labelText: 'Номер ТТН / заказа',
          //               //       hintText: 'Номер ТТН / заказа'),
          //               //   ),
          //               // ),
          //               Padding(
          //                 padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          //                 child: TextField(
          //                   style: const TextStyle(fontSize: 18),
          //                   controller: _TNDescriptionController,
          //                   decoration: const InputDecoration(
          //                     contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //                     border: OutlineInputBorder(),
          //                     labelText: 'Описание ТТН / заказа',
          //                     hintText: 'Описание ТТН / заказа'),
          //                 ),
          //               ),

          //               Padding(
          //                 padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          //                 child: TextField(
          //                   style: const TextStyle(fontSize: 18),
          //                   controller: _organizationController,
          //                   decoration: const InputDecoration(
          //                     contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //                     border: OutlineInputBorder(),
          //                     labelText: 'Выберите оплачивающую организацию',
          //                     hintText: 'Выберите оплачивающую организацию'),
          //                 ),
          //               ),

          //               Padding(
          //                 padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          //                 child: TextField(
          //                   style: const TextStyle(fontSize: 18),
          //                   controller: _counterpartyController,
          //                   decoration: const InputDecoration(
          //                     contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //                     border: OutlineInputBorder(),
          //                     labelText: 'Выберите контрагента',
          //                     hintText: 'Выберите контрагента'),
          //                 ),
          //               ),
                        
          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: <Widget>[
          //                   Expanded(
          //                     flex: 1,
          //                     child: Padding(
          //                       padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 5.0),
          //                       child: TextField(
          //                         style: const TextStyle(fontSize: 18),
          //                         controller: _schetNumberController,
          //                         decoration: const InputDecoration(
          //                           contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //                           border: OutlineInputBorder(),
          //                           labelText: 'Номер счета',
          //                           hintText: 'Номер счета'),
          //                       ),
          //                     ),
          //                   ),

          //                   Expanded(
          //                     flex: 1,
          //                     child: Padding(
          //                       padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          //                       child: TextField(
          //                         style: const TextStyle(fontSize: 18),
          //                         controller: _TNNumberController,
          //                         decoration: const InputDecoration(
          //                           contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //                           border: OutlineInputBorder(),
          //                           labelText: 'Номер ТТН / заказа',
          //                           hintText: 'Номер ТТН / заказа'),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),

          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: <Widget>[
          //                   Expanded(
          //                     flex: 1,
          //                     child: Column(
          //                       children: [
          //                         const Text(
          //                           'Дата создание ОТ', 
          //                           style: TextStyle(fontSize: 16)
          //                         ),
          //                         OutlinedButton(
          //                           onPressed: () async {
          //                             final date = await pickDate();
          //                             if (date == null) return;
          //                             setState(() => _dateFrom = date);
          //                           }, 
          //                           style: ButtonStyle(
          //                             shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
          //                           ),
          //                           child: Text(
          //                             '${_dateFrom.year}/${_dateFrom.month}/${_dateFrom.day}',
          //                             style: const TextStyle(fontSize: 18)
          //                             )
          //                           )
          //                       ]
          //                     ),
          //                   ),

          //                   Expanded(
          //                     flex: 1,
          //                     child: Column(
          //                       children: [
          //                         const Text(
          //                           'Дата создание ДО', 
          //                           style: TextStyle(fontSize: 16)
          //                         ),
          //                         OutlinedButton(
          //                           onPressed: () async {}, 
          //                           style: ButtonStyle(
          //                             shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
          //                           ),
          //                           child: Text(
          //                             '${_dateTo.year}/${_dateTo.month}/${_dateTo.day}',
          //                             style: const TextStyle(fontSize: 18)
          //                             )
          //                           )
          //                       ]
          //                     ),
          //                   ),
          //                 ],
          //               ),

          //               Padding(
          //                 padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          //                 child: TextField(
          //                   style: const TextStyle(fontSize: 18),
          //                   controller: _creatorController,
          //                   decoration: const InputDecoration(
          //                     contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //                     border: OutlineInputBorder(),
          //                     labelText: 'Создал',
          //                     hintText: 'Создал'),
          //                 ),
          //               ),

          //               Padding(
          //                 padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          //                 child: TextField(
          //                   style: const TextStyle(fontSize: 18),
          //                   controller: _responsibleController,
          //                   decoration: const InputDecoration(
          //                     contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //                     border: OutlineInputBorder(),
          //                     labelText: 'Ответственный',
          //                     hintText: 'Ответственный'),
          //                 ),
          //               ),

          //               Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: <Widget>[
          //                   Expanded(
          //                     flex: 1,
          //                     child: Padding(
          //                       padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 5.0),
          //                       child: TextField(
          //                         style: const TextStyle(fontSize: 18),
          //                         controller: _minSumController,
          //                         keyboardType: TextInputType.number,
          //                         inputFormatters: <TextInputFormatter>[
          //                           FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), 
          //                           FilteringTextInputFormatter.digitsOnly
          //                         ],
          //                         decoration: const InputDecoration(
          //                           contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //                           border: OutlineInputBorder(),
          //                           labelText: 'Сумма от',
          //                           hintText: 'Сумма от'),
          //                       ),
          //                     ),
          //                   ),

          //                   Expanded(
          //                     flex: 1,
          //                     child: Padding(
          //                       padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          //                       child: TextField(
          //                         style: const TextStyle(fontSize: 18),
          //                         controller: _maxSumController,
          //                         keyboardType: TextInputType.number,
          //                         inputFormatters: <TextInputFormatter>[
          //                           FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), 
          //                           FilteringTextInputFormatter.digitsOnly
          //                         ],
          //                         decoration: const InputDecoration(
          //                           contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //                           border: OutlineInputBorder(),
          //                           labelText: 'Сумма до',
          //                           hintText: 'Сумма до'),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),

          //               Padding(
          //                 padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          //                 child: TextField(
          //                   style: const TextStyle(fontSize: 18),
          //                   controller: _contractController,
          //                   decoration: const InputDecoration(
          //                     contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //                     border: OutlineInputBorder(),
          //                     labelText: 'Договор',
          //                     hintText: 'Договор'),
          //                 ),
          //               ),

          //               Padding(
          //                 padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          //                 child: TextField(
          //                   style: const TextStyle(fontSize: 18),
          //                   controller: _projectController,
          //                   decoration: const InputDecoration(
          //                     contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //                     border: OutlineInputBorder(),
          //                     labelText: 'Проект',
          //                     hintText: 'Проект'),
          //                 ),
          //               ),

          //               Padding(
          //                 padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          //                 child: 
          //                 DropdownButton<String>(
                              
          //                   value: dropdownvalue,
          //                   icon: const Icon(Icons.keyboard_arrow_down),    
          //                   items: items.map((String item) {
          //                     return DropdownMenuItem(
          //                       value: item,
          //                       // child: Text(item, style: theme.textTheme.titleMedium,),
          //                       child: Text(item, style: TextStyle(color: Colors.black.withOpacity(0.6)),),
          //                     );
          //                   }).toList(),
          //                   onChanged: (String? newValue) { 
          //                     setState(() {
          //                       dropdownvalue = newValue!;
          //                     });
          //                   },
          //                 ),
          //               )
                        
          //             ]
          //           // )
          //         ),

                  // Padding(
                  //   padding: const EdgeInsets.only(top: 10.0),
                  //   child: Align(
                  //   alignment: Alignment.bottomRight,
                  //   child: FilledButton(
                  //     onPressed: () {
                  //       _getSchets();
                  //     },
                  //     child: Text(
                  //       'Сохранить',
                  //     ),
                  //   ),
                  // ),
                  // )
                
              );

            // )

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
            ),
          ]
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
                itemCount:  list.length < _totalCount ?  list.length + 1 : list.length
              );
            }
          },
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
