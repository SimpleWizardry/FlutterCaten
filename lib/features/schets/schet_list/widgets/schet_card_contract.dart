import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/schet.pb.dart';

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
    if(str.length > 200) {
      str = str.substring(0, 170) + "...";
    }
    double cWidth = MediaQuery.of(context).size.width*0.9;

    return SizedBox (
      width: cWidth,
      child:  Column (
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
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