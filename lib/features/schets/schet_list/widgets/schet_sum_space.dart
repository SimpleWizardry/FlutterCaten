import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/schet.pb.dart';

class SchetSumSpace extends StatelessWidget {
  final SchetListView schet;
  final TextStyle? textStyle;
  const SchetSumSpace({super.key, required this.schet, this.textStyle});

  TextStyle getTextStyle(){
    if(textStyle == null){
      return const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 18
      );
    } else {
      return textStyle as TextStyle;
    }}



  @override
  Widget build(BuildContext context) {
    var summaSpace = "";
    if(schet == null){
      return  Text(summaSpace, style: getTextStyle());
    }

    if(schet.summa == null){
      return  Text(summaSpace, style: getTextStyle());
    }
    var summArray = schet.summa.toStringAsFixed(2).split('.');
    var wholePart = summArray[0].split('').reversed.join();
    var i = 0;
    for (var index = 0; index < wholePart.length; index++) {
      i++;
      summaSpace += wholePart[index];
      if(i== 3 && index != wholePart.length - 1){
        summaSpace += " ";
      }
    }
    summaSpace = summaSpace.split('').reversed.join();
    if (summArray[1] == 2){
      summaSpace += ".${summArray[1]}";
    }

    return RichText(
      text:  TextSpan(
          text: "Сумма: ",
          style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 18,
              color: Colors.black
          ),
          children: <TextSpan>[
            TextSpan(
                text: summaSpace,
                style: getTextStyle(),
            )
          ]
      ),
    );
  }
}