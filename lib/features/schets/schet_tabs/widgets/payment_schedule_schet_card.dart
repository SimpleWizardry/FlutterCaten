import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../schet_list/widgets/schet_sum_space.dart';
import '../../services/schet.pb.dart';

class PaymentScheduleSchetCard extends StatelessWidget {
  final PaymentScheduleSchetDTO paymentSchedulece;
  const PaymentScheduleSchetCard({super.key, required this.paymentSchedulece});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10),
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
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
                        text: paymentSchedulece.date,
                        style: const TextStyle(fontWeight: FontWeight.normal))
                  ]),
            )
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
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
                        text: paymentSchedulece.description,
                        style: const TextStyle(fontWeight: FontWeight.normal))
                  ]),
            )
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            const SizedBox(width: 8),
            SchetSumSpace(
              schetSum: paymentSchedulece.sum,
              fieldName: 'Сумма',
            )
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            const SizedBox(width: 8),
            SchetSumSpace(
              schetSum: paymentSchedulece.sumWithVAT,
              fieldName: 'Сумма с НДС',
            )
          ]),
        ]));
  }
}
