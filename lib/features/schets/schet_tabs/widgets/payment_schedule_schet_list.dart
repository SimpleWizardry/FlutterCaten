import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/features/schets/schet_tabs/widgets/payment_schedule_schet_card.dart';
import 'package:myapp/features/schets/services/schet.pb.dart';

import '../../repository/abstractSchetRepository.dart';
import '../bloc/payment_schedule_schet_bloc.dart';

class PaymentScheduleSchetList extends StatefulWidget {
  final String id;
  const PaymentScheduleSchetList({super.key, required this.id});

  @override
  State<PaymentScheduleSchetList> createState() =>
      _PaymentScheduleSchetListState();
}

class _PaymentScheduleSchetListState extends State<PaymentScheduleSchetList> {
  ScrollController _scrollController = new ScrollController();
  final _paymentScheduleSchetBloc = PaymentScheduleSchetListBloc(
      GetIt.I<AbstractSchetRepository>(),
      GetIt.I<AbstractSchetRepository>().initFilterPaymentScheduleSchet());
  var _totalCount = 0;
  List<PaymentScheduleSchetDTO> list = [];

  @override
  void initState() {
    _paymentScheduleSchetBloc
        .add(PaymentScheduleSchetListLoad(init: true, id: widget.id));
    _scrollController.addListener(_scrolListner);
    super.initState();
  }

  void _scrolListner() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        list.length != _totalCount) {
      _paymentScheduleSchetBloc
          .add(PaymentScheduleSchetListLoad(init: false, id: widget.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentScheduleSchetListBloc,
        PaymentScheduleSchetListState>(
      bloc: _paymentScheduleSchetBloc,
      builder: (context, state) {
        if (state is PaymentScheduleSchetListInit) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (state is PaymentScheduleSchetListSuccessed) {
            list = [...list, ...state.listPaymentSchedule];
            _totalCount = state.totalCount;
          }
          return ListView.builder(
              controller: _scrollController,
              itemBuilder: (context, i) {
                if (state is PaymentScheduleSchetListSuccessed) {
                  if (i < list.length) {
                    return PaymentScheduleSchetCard(paymentSchedulece: list[i]);
                  }
                  return const SizedBox();
                }
                if (state is PaymentScheduleSchetListLoadin) {
                  return const Card(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (state is PaymentScheduleSchetListFailure) {
                  return Card(
                    child: Center(
                      child: Text(
                        state.errorMessage,
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  );
                }
                return const Center(
                  child: Text('Произошла ошибка',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w900)),
                );
              },
              itemCount: state is PaymentScheduleSchetListSuccessed
                  ? list.length + 1
                  : list.length);
        }
      },
    );
  }
}
