import 'package:flutter/material.dart';

import '../../../../generated/schet.pb.dart';
import '../../schet_list/widgets/schet_row.dart';
import '../../schet_list/widgets/schet_sum_space.dart';
// import '../../services/schet.pb.dart';

class SchetResourceCard extends StatelessWidget {
  final ResourceSchet resource;
  const SchetResourceCard({super.key, required this.resource});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        const SizedBox(width: 8),
        SchetRow(
          description: resource.name.trimLeft().trimRight(),
          name: 'Наименование:',
        )
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        const SizedBox(width: 8),
        RichText(
          text: TextSpan(
              text: "Количество: ",
              style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    text: resource.count.toString() + " " + resource.unit,
                    style: const TextStyle(fontWeight: FontWeight.normal))
              ]),
        )
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        const SizedBox(width: 8),
        SchetSumSpace(
          schetSum: resource.price,
          currency: resource.currency,
          fieldName: 'Цена',
        )
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        const SizedBox(width: 8),
        SchetSumSpace(
          schetSum: resource.priceWithVAT,
          currency: resource.currency,
          fieldName: 'Цена с НДС',
        )
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        const SizedBox(width: 8),
        SchetSumSpace(
          schetSum: resource.price * resource.count,
          currency: resource.currency,
          fieldName: 'Стоимость',
        )
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        const SizedBox(width: 8),
        SchetSumSpace(
          schetSum: resource.priceWithVAT * resource.count,
          currency: resource.currency,
          fieldName: 'Стоимость с НДС',
        )
      ])
    ]));
  }
}
