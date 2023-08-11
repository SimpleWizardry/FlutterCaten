import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/schet.pb.dart';

class SchetCardDescription extends StatelessWidget {
  final SchetView schet;

  const SchetCardDescription({super.key, required this.schet});
  @override
  Widget build(BuildContext context) {
    var str = "";
    if (schet == null) {
      return Text(str);
    }
    if (str.length > 200) {
      str = str.substring(0, 170) + "...";
    }

    double cWidth = MediaQuery.of(context).size.width * 0.90;

    return SizedBox(
      width: cWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
                text: "Описание: ",
                style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    fontSize: 16),
                children: <TextSpan>[
                  TextSpan(
                      text: schet.description,
                      style: const TextStyle(fontWeight: FontWeight.normal))
                ]),
          )
        ],
      ),
    );
  }
}
