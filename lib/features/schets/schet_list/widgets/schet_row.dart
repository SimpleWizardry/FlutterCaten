import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/schet.pb.dart';

class SchetRow extends StatelessWidget {
  final String name;
  final String description;

  const SchetRow({super.key, required this.name, required this.description});
  @override
  Widget build(BuildContext context) {
    var str = "";
    if (name == null) {
      return Text(str);
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
                text: name,
                style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    fontSize: 16),
                children: [
                  const WidgetSpan(
                    child: SizedBox(width: 8),
                  ),
                  TextSpan(
                      text: description,
                      style: const TextStyle(fontWeight: FontWeight.normal))
                ]),
          )
        ],
      ),
    );
  }
}
