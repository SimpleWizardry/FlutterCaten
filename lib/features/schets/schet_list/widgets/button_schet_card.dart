import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../models/account/account.dart';
import '../../repository/abstractSchetRepository.dart';
import '../../services/schet.pb.dart';
import '../bloc/button_schet_card_bloc.dart';

class ButtonSchetCard extends StatefulWidget {
  final SchetView schet;
  const ButtonSchetCard({Key? key, required this.schet}) : super(key: key);

  @override
  State<ButtonSchetCard> createState() => _ButtonSchetCardState();
}

class _ButtonSchetCardState extends State<ButtonSchetCard> {
  final _buttonSchetCardBloc =
      ButtonSchetCardBloc(GetIt.I<AbstractSchetRepository>());

  downloadSchetFile() {
    _buttonSchetCardBloc.add(DownloadSchetFile(widget.schet.file!));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonSchetCardBloc, ButtonSchetCardState>(
        bloc: _buttonSchetCardBloc,
        builder: (context, state) {
          if (widget.schet == null) {
            return Container();
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: Colors.lightBlueAccent),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10)),
                        color: Colors.lightBlueAccent),
                    width: MediaQuery.of(context).size.width * 0.93 / 3,
                    child: const Center(
                      child: Icon(
                        Icons.download,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                InkWell(
                    child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.green),
                      color: Colors.green),
                  width: MediaQuery.of(context).size.width * 0.93 / 3,
                  child: const Center(
                    child: Icon(
                      Icons.thumb_up,
                      size: 30,
                    ),
                  ),
                )),
                InkWell(
                    child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.red),
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10)),
                      color: Colors.red),
                  width: MediaQuery.of(context).size.width * 0.93 / 3,
                  child: const Center(
                    child: Icon(
                      Icons.thumb_down,
                      size: 30,
                    ),
                  ),
                )),
              ],
            );
          }
        });
  }
}
