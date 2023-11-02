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
  final String userId;
  final List<String> roles;
  final VoidCallback onUpdate;

  const ButtonSchetCard(
      {Key? key,
      required this.schet,
      required this.userId,
      required this.roles,
      required this.onUpdate})
      : super(key: key);

  @override
  State<ButtonSchetCard> createState() => _ButtonSchetCardState();
}

class _ButtonSchetCardState extends State<ButtonSchetCard> {
  final _buttonSchetCardBloc =
      ButtonSchetCardBloc(GetIt.I<AbstractSchetRepository>());
  String textReject = "";
  String textButtonReject = "";
  @override
  void initState() {
    setInitStateChangeStatus();
  }

  downloadSchetFile() {
    _buttonSchetCardBloc.add(DownloadSchetFile(widget.schet.file!));
  }

  setTextReject(String text) {
    text = text ?? "";
    this.textReject = text;

    if (this.textReject.length < 5) {
      textButtonReject = "Осталось ввести: " +
          (5 - this.textReject.length).toString() +
          " сим.";
    } else {
      textButtonReject = "Отклонить";
    }
  }

  bool isAccountant() {
    return widget.roles.contains("Accountant");
  }

  bool isDirector() {
    return widget.roles.contains("Director");
  }

  bool showButton(String type) {
    var result = false;
    var hierarchy = [];

    if (widget.userId == widget.schet.createrId) {
      if (type == "approve") {
        hierarchy.add(1);
        hierarchy.add(4);
        hierarchy.add(6);
      }
      if (type == "reject") {
        hierarchy = [];
      }
    }

    for (var i = 0; i < widget.schet.objectsAccountSchets.length; i++) {
      var item = widget.schet.objectsAccountSchets[i];
      if (widget.userId == item.userId) {
        if (widget.userId == widget.schet.createrId) {
          if (type == "approve") {
            hierarchy.add(1);
            hierarchy.add(4);
            hierarchy.add(6);
          }
          if (type == "reject") {
            hierarchy = [];
          }
        } else {
          if (type == "approve") {
            hierarchy.add(2);
          }
          if (type == "reject") {
            hierarchy.add(2);
          }
        }
      }
    }

    if (widget.roles.contains("Director")) {
      if (type == "approve") {
        hierarchy = [];
        hierarchy.add(1);
        hierarchy.add(2);
        hierarchy.add(3);
        hierarchy.add(4);
      }
      if (type == "reject") {
        hierarchy = [];
        hierarchy.add(1);
        hierarchy.add(2);
        hierarchy.add(3);
        hierarchy.add(4);
      }
    }

    if (hierarchy.contains(widget.schet.status.number)) {
      result = true;
    }

    return result;
  }

  int getCountButton() {
    var count = 1;
    if (showButton("approve")) {
      count++;
    }
    if (showButton("reject")) {
      count++;
    }
    return count;
  }

  setInitStateChangeStatus() {
    _buttonSchetCardBloc.add(BSCChangeStatusInitEvent());
  }

  approveSchet() {
    var hierarchy = 0;
    if (widget.userId == widget.schet.createrId) {
      hierarchy = 2;
    }
    if (widget.schet.objectsAccountSchets
        .map((e) => e.userId)
        .contains(widget.userId)) {
      hierarchy = 3;
    }
    if (isAccountant()) {
      hierarchy = 5;
    }
    if (isDirector()) {
      hierarchy = 5;
    }
    if (hierarchy != 0) {
      var filter = new FilterChangeStatus();
      filter.schetId = widget.schet.id;
      filter.number = hierarchy;
      _buttonSchetCardBloc.add(BSCChangeStatus(filter));
    }
  }

  rejectSchet() {
    var hierarchy = 0;
    if (widget.schet.objectsAccountSchets
        .map((e) => e.userId)
        .contains(widget.userId)) {
      hierarchy = 4;
    }
    if (isAccountant()) {
      hierarchy = 6;
    }
    if (isDirector()) {
      hierarchy = 6;
    }
    if (hierarchy != 0) {
      var filter = new FilterChangeStatus();
      filter.schetId = widget.schet.id;
      filter.number = hierarchy;
      var reject = new RejectSchetDTO();
      reject.schetId = widget.schet.id;
      reject.comment = textReject;
      reject.statusHierarchy = hierarchy;
      reject.userId = widget.userId;
      Navigator.pop(context);
      _buttonSchetCardBloc.add(BSCRejectSchet(reject));
    }
  }

  rejectViewDialog() {
    textButtonReject = "Осталось ввести: 5 сим.";
    textReject = "";
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return Dialog.fullscreen(
            child: Column(
              children: [
                TextField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText:
                        'Введите причину отклонения счета (минимальная длина 5 символов)',
                  ),
                  onChanged: (value) {
                    value = value ?? "";
                    textReject = value;
                  },
                ),
                Row(children: [
                  InkWell(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(color: Colors.red),
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: const Center(
                            child: Text('Отклонить',
                                style: TextStyle(fontSize: 18))),
                      ),
                      onTap: () {
                        if (textReject.length > 5) {
                          rejectSchet();
                        }
                      }),
                  InkWell(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(color: Colors.grey[350]),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: const Center(
                          child: Text('Назад', style: TextStyle(fontSize: 18))),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ])
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonSchetCardBloc, ButtonSchetCardState>(
        bloc: _buttonSchetCardBloc,
        builder: (context, state) {
          if (widget.schet == null) {
            return Container();
          }
          if (state is BSCChangeStatusInit) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 1, color: Colors.lightBlueAccent),
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        color: Colors.lightBlueAccent),
                    width: MediaQuery.of(context).size.width *
                        0.93 /
                        getCountButton(),
                    child: const Center(
                      child: Icon(
                        Icons.download,
                        size: 30,
                      ),
                    ),
                  ),
                  onTap: () {
                    downloadSchetFile();
                  },
                ),
                InkWell(
                    onTap: () {
                      approveSchet();
                    },
                    child: !showButton("approve")
                        ? const SizedBox(width: 0)
                        : Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.green),
                                color: Colors.green),
                            width: MediaQuery.of(context).size.width *
                                0.93 /
                                getCountButton(),
                            child: const Center(
                              child: Icon(
                                Icons.thumb_up,
                                size: 30,
                              ),
                            ),
                          )),
                InkWell(
                    onTap: () {
                      rejectViewDialog();
                    },
                    child: !showButton("reject")
                        ? const SizedBox(width: 0)
                        : Container(
                            decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Colors.red),
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(10)),
                                color: Colors.red),
                            width: MediaQuery.of(context).size.width *
                                0.93 /
                                getCountButton(),
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
          if (state is BSCChangeStatusLoading) {
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
                    width: MediaQuery.of(context).size.width *
                        0.93 /
                        getCountButton(),
                    child: const Center(
                      child: Icon(
                        Icons.download,
                        size: 30,
                      ),
                    ),
                  ),
                  onTap: () {
                    downloadSchetFile();
                  },
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        color: Colors.grey[300]),
                    width: MediaQuery.of(context).size.width *
                        (0.93 / getCountButton()) *
                        (getCountButton() - 1),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  onTap: () {
                    downloadSchetFile();
                  },
                ),
              ],
            );
          }
          if (state is BSCChangeStatusSuccessed) {
            widget.onUpdate();
          }
          if (state is BSCChangeStatusFuile) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                    onTap: () {
                      setInitStateChangeStatus();
                    },
                    child: Row(children: <Widget>[
                      Text(
                        state.errorMessage,
                        style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.arrow_back,
                        size: 30.0,
                        color: Colors.red,
                      ),
                    ])),
              ],
            );
          }
          return SizedBox(
            width: 0,
          );
        });
  }
}
