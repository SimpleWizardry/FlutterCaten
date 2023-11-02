import 'package:flutter/material.dart';

import '../widgets/payment_schedule_schet_list.dart';
import '../widgets/schet_full_card.dart';
import '../widgets/schet_resource_list.dart';

class SchetTabs extends StatefulWidget {
  const SchetTabs({super.key});

  @override
  State<SchetTabs> createState() => _SchetTabsState();
}

class _SchetTabsState extends State<SchetTabs> {
  String? schetId;
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      return;
    }
    if (args is! String) {
      return;
    }
    schetId = args as String;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Счет'),
            centerTitle: true,
            bottom: TabBar(tabs: [
              Tab(text: 'Информация'),
              Tab(text: 'Ресурсы'),
              Tab(text: 'График')
            ]),
          ),
          body: TabBarView(
            children: [
              SchetFullCard(id: schetId ?? ""),
              SchetResourceList(id: schetId ?? ""),
              PaymentScheduleSchetList(id: schetId ?? "")
            ],
          )));
}
