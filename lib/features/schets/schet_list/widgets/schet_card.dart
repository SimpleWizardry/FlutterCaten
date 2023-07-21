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


class SchetCardTitle extends StatelessWidget {
  final SchetListView schet;

  const SchetCardTitle({super.key, required this.schet});
  Widget getTitle(){
    var str = "";
    if(this.schet == null){
      return Text(str);
    }

    this.schet.objectsAccountSchets.forEach((el) {
      str += el.name + "; ";
    });

    return Text(str);
  }
  @override
  Widget build(BuildContext context) {
    return getTitle();
  }
}
