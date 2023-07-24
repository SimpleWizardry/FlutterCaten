import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/schet.pb.dart';



class SchetCard extends StatelessWidget {
  final SchetListView schet;

  
  
  const SchetCard({super.key, required this.schet});

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
                          Text("Номер: " + this.schet.number),
                          const SizedBox(width: 8),
                          Text("Сумма: " + this.schet.summa.toStringAsFixed(2)),
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(width: 8),
                          Text("Описание: " + this.schet.description),
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(width: 8),
                          SchetCardContract(schet: this.schet)
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
    if(this.schet == null){
      return Text(str);
    }

    this.schet.objectsAccountSchets.forEach((el) {
      str += el.name + "; ";
    });

    double c_width = MediaQuery.of(context).size.width*0.8;

    return new Container (
      width: c_width,
      child: new Column (
        children: <Widget>[
          new Text("Договора: ",
            style: TextStyle(
              fontWeight: FontWeight.w900
            ),
          ),
          new Text (str)
        ],
      ),
    );
  }
}
