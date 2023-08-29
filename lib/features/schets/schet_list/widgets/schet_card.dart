import 'package:flutter/material.dart';
import 'package:myapp/features/schets/schet_list/widgets/schet_card_contract.dart';
import 'package:myapp/features/schets/schet_list/widgets/schet_card_description.dart';
import 'package:myapp/features/schets/schet_list/widgets/schet_row.dart';
import 'package:myapp/features/schets/schet_list/widgets/schet_sum_space.dart';
import 'package:myapp/models/account/account.dart';

import '../../services/schet.pb.dart';
import 'button_schet_card.dart';

class SchetCard extends StatelessWidget {
  final SchetView schet;
  final String userId;
  final List<String> roles;
  final VoidCallback onUpdate;
  const SchetCard(
      {super.key,
      required this.schet,
      required this.userId,
      required this.roles,
      required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(children: [
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed('/schet', arguments: schet.id);
                },
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(width: 8),
                            SchetSumSpace(schetSum: schet.summa)
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(width: 8),
                            SchetRow(
                              description: schet.number.trimLeft().trimRight(),
                              name: 'Номер:',
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(width: 8),
                            SchetRow(
                              description: schet.date,
                              name: 'Дата:',
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(width: 8),
                            SchetRow(
                              description: schet.status.name,
                              name: 'Статус:',
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(width: 8),
                            SchetRow(
                              description: schet.counterpartyName,
                              name: 'Контрагент:',
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(width: 8),
                            SchetRow(
                              description: schet.payingOrganizationName,
                              name: 'Опл. организация:',
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(width: 8),
                            SchetRow(
                              description: schet.description,
                              name: 'Описание:',
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(width: 8),
                            SchetCardContract(
                                shot: true,
                                objectAccountSchets: schet.objectsAccountSchets)
                          ])
                    ]),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.orangeAccent),
                      color: Colors.orangeAccent,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  width: 40,
                  height: 40,
                  child: const Center(
                    child: Icon(
                      Icons.arrow_forward,
                      size: 30.0,
                    ),
                  ),
                )
              ])
            ]),
            const Row(
              children: [
                SizedBox(
                  height: 6,
                )
              ],
            ),
            ButtonSchetCard(
              schet: schet,
              roles: roles,
              userId: userId,
              onUpdate: () {
                onUpdate();
              },
            ),
          ],
        ),
      ),
    );
  }
}
