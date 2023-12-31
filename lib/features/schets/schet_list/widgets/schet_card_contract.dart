import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../generated/schet.pb.dart';

// import '../../services/schet.pb.dart';

class SchetCardContract extends StatelessWidget {
  final List<ObjectAccountSchet> objectAccountSchets;
  final bool shot;
  const SchetCardContract({
    super.key,
    required this.objectAccountSchets,
    required this.shot,
  });
  @override
  Widget build(BuildContext context) {
    var str = "";
    if (objectAccountSchets == null) {
      return Text(str);
    }

    for (var el in objectAccountSchets) {
      str += "${el.name}; ";
    }
    if (str.length > 200 && shot) {
      str = str.substring(0, 170) + "...";
    }
    double cWidth = MediaQuery.of(context).size.width * 0.9;

    return SizedBox(
      width: cWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          RichText(
              text: TextSpan(
                  text: "Договора: ",
                  style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                        text: str,
                        style: const TextStyle(fontWeight: FontWeight.normal))
                  ]),
              textAlign: TextAlign.justify)
        ],
      ),
    );
  }
}
