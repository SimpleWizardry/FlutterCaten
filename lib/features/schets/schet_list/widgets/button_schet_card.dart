import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/schet.pb.dart';

class ButtonSchetCard extends StatelessWidget {
  final SchetListView schet;
  const ButtonSchetCard({Key? key, required this.schet}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(schet == null) {
      return Container();
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          InkWell(

              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.lightBlueAccent
                  ),
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10)),
                  color: Colors.lightBlueAccent
                ),
                width: MediaQuery.of(context).size.width * 0.93/ 3,
                child: const Center(
                  child: Icon(
                      Icons.download,
                      size: 30,),
                ),
              )
          ),
          InkWell(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: Colors.green
                    ),
                  color: Colors.green
                ),
                width: MediaQuery.of(context).size.width * 0.93/ 3,
                child: const Center(
                  child: Icon(
                      Icons.thumb_up,
                      size: 30,),
                ),
              )
          ),
          InkWell(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: Colors.red
                    ),
                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10)),
                    color: Colors.red
                ),
                width: MediaQuery.of(context).size.width * 0.93/ 3,
                child: const Center(
                  child: Icon(
                      Icons.thumb_down,
                      size: 30,),
                ),
              )
          ),
        ],
      );
    }
  }
}
