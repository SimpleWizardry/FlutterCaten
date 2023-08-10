import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/features/schets/schet_list/widgets/schet_card_contract.dart';
import 'package:myapp/features/schets/schet_list/widgets/schet_card_description.dart';
import 'package:myapp/features/schets/schet_list/widgets/schet_sum_space.dart';
import 'package:myapp/models/account/account.dart';

import '../../services/schet.pb.dart';
import 'button_schet_card.dart';

class SchetCard extends StatelessWidget {
  final SchetListView schet;

  const SchetCard({super.key, required this.schet});

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
                            RichText(
                              text: TextSpan(
                                  text: "Номер: ",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 16,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text:
                                            schet.number.trimLeft().trimRight(),
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
                                        text: schet.date,
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
                                        text: schet.status.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.normal))
                                  ]),
                            ),
                          ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(width: 8),
                            SchetCardDescription(schet: schet)
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
            ButtonSchetCard(schet: schet as SchetView),
          ],
        ),
      ),
    );
  }
}
