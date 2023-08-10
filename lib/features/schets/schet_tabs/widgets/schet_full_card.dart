import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/models/account/account.dart';

import '../../repository/abstractSchetRepository.dart';
import '../../schet_list/bloc/schet_list_bloc.dart';
import '../../schet_list/widgets/button_schet_card.dart';
import '../../schet_list/widgets/schet_card_contract.dart';
import '../../schet_list/widgets/schet_card_description.dart';
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
  @override
  void initState() {
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
            returnBody = Card(
              margin: EdgeInsets.all(10),
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
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
                            RichText(
                              text: TextSpan(
                                  text: "Номер: ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: state.schet.number
                                            .trimLeft()
                                            .trimRight(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal))
                                  ]),
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(width: 8),
                            RichText(
                              text: TextSpan(
                                  text: "Дата: ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: state.schet.date,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal))
                                  ]),
                            )
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(width: 8),
                            RichText(
                              text: TextSpan(
                                  text: "Статус: ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: state.schet.status.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal))
                                  ]),
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(width: 8),
                            RichText(
                              text: TextSpan(
                                  text: "Описание: ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: state.schet.description,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal))
                                  ]),
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(width: 8),
                            RichText(
                              text: TextSpan(
                                  text: "Контрагент: ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: state.schet.counterpartyName,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal))
                                  ]),
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(width: 8),
                            RichText(
                              text: TextSpan(
                                  text: "Опл. организация: ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            state.schet.payingOrganizationName,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal))
                                  ]),
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(width: 8),
                            RichText(
                              text: TextSpan(
                                  text: "Автор: ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: state.schet.createrName,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal))
                                  ]),
                            ),
                          ]),
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(width: 8),
                      SchetCardContract(
                          shot: false,
                          objectAccountSchets: state.schet.objectsAccountSchets)
                    ]),
                ButtonSchetCard(schet: state.schet)
              ]),
            );
          } else {
            returnBody = Text('fsefe');
          }
          return returnBody;
        });
  }
}
