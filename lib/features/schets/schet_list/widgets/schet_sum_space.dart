import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/schet.pb.dart';

class SchetSumSpace extends StatelessWidget {
  final double schetSum;
  final TextStyle? textStyle;
  final String? currency;
  final String? fieldName;
  const SchetSumSpace(
      {super.key,
      required this.schetSum,
      this.textStyle,
      this.currency,
      this.fieldName});

  TextStyle getTextStyle() {
    if (textStyle == null) {
      return const TextStyle(
          color: Colors.black, fontWeight: FontWeight.normal, fontSize: 16);
    } else {
      return textStyle as TextStyle;
    }
  }

  getFieldName() {
    if (fieldName == null) {
      return 'Сумма: ';
    } else {
      return fieldName! + ': ';
    }
  }

  @override
  Widget build(BuildContext context) {
    var summaSpace = "";
    if (schetSum == null) {
      return Text(summaSpace, style: getTextStyle());
    }

    var summArray = schetSum.toStringAsFixed(2).split('.');
    var wholePart = summArray[0].split('').reversed.join();
    var i = 0;
    for (var index = 0; index < wholePart.length; index++) {
      i++;
      summaSpace += wholePart[index];
      if (i == 3 && index != wholePart.length - 1) {
        summaSpace += " ";
      }
    }
    summaSpace = summaSpace.split('').reversed.join();
    if (summArray[1] == 2) {
      summaSpace += ".${summArray[1]}";
    }

    if (currency != null) {
      if (currency == 'RUB') {
        summaSpace += ' руб.';
      }
      if (currency == 'USD') {
        summaSpace += ' дол.';
      }
      if (currency == 'EUR') {
        summaSpace += ' евро';
      }
    }

    return RichText(
      text: TextSpan(
          text: getFieldName(),
          style: const TextStyle(
              fontWeight: FontWeight.w900, fontSize: 18, color: Colors.black),
          children: <TextSpan>[
            TextSpan(
              text: summaSpace,
              style: getTextStyle(),
            )
          ]),
    );
  }
}
