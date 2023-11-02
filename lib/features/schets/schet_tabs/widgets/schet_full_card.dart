import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/models/account/account.dart';

import '../../repository/abstractSchetRepository.dart';
import '../../schet_list/bloc/schet_list_bloc.dart';
import '../../schet_list/widgets/button_schet_card.dart';
import '../../schet_list/widgets/schet_card_contract.dart';
import '../../schet_list/widgets/schet_card_description.dart';
import '../../schet_list/widgets/schet_row.dart';
import '../../schet_list/widgets/schet_sum_space.dart';
import '../../services/schet.pb.dart';
import '../bloc/schet_full_card_bloc.dart';

class SchetFullCard extends StatefulWidget {
  final String id;
  const SchetFullCard({super.key, required this.id});

  @override
  State<SchetFullCard> createState() => _SchetFullCardState();
}

class _SchetFullCardState extends State<SchetFullCard> {
  final _schetFullCardBloc =
      SchetFullCardBloc(GetIt.I<AbstractSchetRepository>());

  final _storage = const FlutterSecureStorage();

  List<String> _roles = [];
  String _userId = "";

  setRoles() async {
    final String? userString = await _storage.read(
      key: "roles",
      aOptions: _getAndroidOptions(),
    );

    _roles = List<String>.from(json.decode(userString as String));
    debugPrint('$_roles');
  }

  setUserId() async {
    final String? userString = await _storage.read(
      key: "userId",
      aOptions: _getAndroidOptions(),
    );

    _userId = userString as String;
    debugPrint('$_userId');
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  @override
  void initState() {
    setUserId();
    setRoles();
    _schetFullCardBloc.add(LoadSchetFullCard(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SchetFullCardBloc, SchetFullCardState>(
        bloc: _schetFullCardBloc,
        builder: (context, state) {
          Widget returnBody = Text('dddd');
          if (state is SchetFullCardLoading) {
            returnBody = const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SchetFullCardFailure) {
            returnBody = Card(
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
          } else if (state is SchetFullCardSuccessed) {
            returnBody =
                ListView(padding: const EdgeInsets.all(3.5), children: <Widget>[
              Card(
                margin: EdgeInsets.all(10),
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(width: 8),
                              SchetSumSpace(schetSum: state.schet.summa)
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(width: 8),
                              SchetRow(
                                description: state.schet.number,
                                name: 'Номер:',
                              ),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(width: 8),
                              SchetRow(
                                description: state.schet.date,
                                name: 'Дата:',
                              ),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(width: 8),
                              SchetRow(
                                description: state.schet.status.name,
                                name: 'Статус:',
                              ),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(width: 8),
                              SchetRow(
                                description: state.schet.description,
                                name: 'Описание:',
                              ),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(width: 8),
                              SchetRow(
                                description: state.schet.counterpartyName,
                                name: 'Контрагент:',
                              ),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(width: 8),
                              SchetRow(
                                description: state.schet.payingOrganizationName,
                                name: 'Опл. организация:',
                              ),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(width: 8),
                              SchetRow(
                                description: state.schet.createrName,
                                name: 'Автор:',
                              ),
                            ]),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(width: 8),
                        SchetCardContract(
                            shot: false,
                            objectAccountSchets:
                                state.schet.objectsAccountSchets)
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ButtonSchetCard(
                          schet: state.schet,
                          roles: _roles,
                          userId: _userId,
                          onUpdate: () {
                            _schetFullCardBloc
                                .add(LoadSchetFullCard(widget.id));
                          },
                        )
                      ])
                ]),
              ),
            ]);
          } else {
            returnBody = Text('fsefe');
          }
          return returnBody;
        });
  }
}
