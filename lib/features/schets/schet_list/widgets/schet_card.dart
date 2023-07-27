import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/schet.pb.dart';



class SchetCard extends StatelessWidget {
  final SchetListView schet;

  
  
  const SchetCard({super.key, required this.schet});

  String getSumm(){
    var summaSpace = "";
    if(schet.summa == null){
      return  summaSpace;
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
    return summaSpace;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child:
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InkWell(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(width: 8),
                          RichText(
                            text:  TextSpan(
                                text: "Сумма: ",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                    color: Colors.black
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: getSumm(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                          fontSize: 18
                                      )
                                  )
                                ]
                            ),
                          ),
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(width: 8),
                          RichText(
                            text:  TextSpan(
                                text: "Номер: ",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: Colors.black
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: schet.number.trimLeft().trimRight(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.normal
                                      )
                                  )
                                ]
                            ),
                          )
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(width: 8),
                          RichText(
                            text:  TextSpan(
                                text: "Дата: ",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: Colors.black
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: schet.date,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.normal
                                      )
                                  )
                                ]
                            ),
                          )
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(width: 8),
                          RichText(
                            text:  TextSpan(
                                text: "Статус: ",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                    color: Colors.black
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: schet.status.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.normal
                                      )
                                  )
                                ]
                            ),
                          ),
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(width: 8),
                          SchetCardDescription(schet: schet)
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(width: 8),
                          SchetCardContract(schet: schet)
                        ]
                    )
                  ]
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Скачать файл'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('Отклонить'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('Утвердить'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class SchetCardContract extends StatelessWidget {
  final SchetListView schet;

  const SchetCardContract({super.key, required this.schet});
  @override
  Widget build(BuildContext context) {
    var str = "";
    if(schet == null){
      return Text(str);
    }

    for (var el in schet.objectsAccountSchets) {
      str += "${el.name}; ";
    }

    double cWidth = MediaQuery.of(context).size.width*0.9;

    return SizedBox (
      width: cWidth,
      child:  Column (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
           RichText(
              text:  TextSpan(
                  text: "Договора: ",
              style: const TextStyle(
                  fontWeight: FontWeight.w900,
                color: Colors.black,
                fontSize: 16
              ),
                  children: <TextSpan>[
                     TextSpan(
                        text: str,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal
                    ))
                  ]
              ),
               textAlign: TextAlign.justify
          )
        ],
      ),
    );
  }
}


class SchetSumSpace extends StatelessWidget {
   final double summa;
   final TextStyle? textStyle;
  const SchetSumSpace({super.key, required this.summa, this.textStyle});

  TextStyle getTextStyle(){
    if(textStyle == null){
     return const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 16
      );
    } else {
      return textStyle as TextStyle;
    }}



  @override
  Widget build(BuildContext context) {
    var summaSpace = "";
    if(summa == null){
      return  Text(summaSpace, style: getTextStyle());
    }
    var summArray = this.summa.toStringAsExponential(2).split('.');
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
    if (summArray[1] != null){
      summaSpace += "." + summArray[1];
    }

    return Text(summaSpace,
        style: getTextStyle());
  }
}

class SchetCardDescription extends StatelessWidget {
  final SchetListView schet;

  const SchetCardDescription({super.key, required this.schet});
  @override
  Widget build(BuildContext context) {
    var str = "";
    if(schet == null){
      return Text(str);
    }


    double cWidth = MediaQuery.of(context).size.width*0.90;

    return SizedBox (
      width: cWidth,
      child:  Column (
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          RichText(
            textAlign: TextAlign.start,
              text:  TextSpan(
                  text: "Описание: ",
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      fontSize: 16
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: schet.description,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal
                        ))
                  ]
              ),
          )
        ],
      ),
    );
  }
}