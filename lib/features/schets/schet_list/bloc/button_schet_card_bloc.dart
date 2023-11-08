import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
// import 'package:myapp/features/schets/services/schet.pb.dart';
import 'package:path_provider/path_provider.dart';

import 'package:myapp/generated/schet.pb.dart';

import '../../repository/abstractSchetRepository.dart';
part 'button_schet_card_event.dart';
part 'button_schet_card_state.dart';

class ButtonSchetCardBloc
    extends Bloc<ButtonSchetCardEvent, ButtonSchetCardState> {
  ButtonSchetCardBloc(this.schetRepository) : super(BSCInitial()) {
    on<DownloadSchetFile>((event, emit) async {
      try {
        emit(BSCDownloding());

        var _result =
            await GetIt.I<AbstractSchetRepository>().DownloadFile(event.file);
        if (_result.succssed) {
          debugPrint('File!: ${_result.file}');
          Directory tempDir = await getTemporaryDirectory();
          String tempPath = tempDir.path;
          File file = new File('$tempPath/${_result.file.name}');
          await file.writeAsBytes(_result.file.body);
          //displayImage(file);
          emit(BSCInitial());
        } else {
          emit(BSCDownlodFuile(errorMessage: 'Не удалось скачать файл'));
        }
      } catch (e) {
        emit(BSCDownlodFuile(errorMessage: 'Не удалось скачать файл'));
      }
    });

    on<BSCChangeStatusInitEvent>((event, emit) async {
      emit(BSCChangeStatusInit());
    });

    on<BSCChangeStatus>((event, emit) async {
      try {
        emit(BSCChangeStatusLoading());
        var _result = await GetIt.I<AbstractSchetRepository>()
            .ChangeStatusSchet(event.filter);
        if (_result.succssed) {
          debugPrint('Status!: ${_result.status}');
          emit(BSCChangeStatusSuccessed());
        } else {
          emit(
              BSCChangeStatusFuile(errorMessage: 'Не удалось изменить статус'));
        }
      } catch (e) {
        emit(BSCChangeStatusFuile(errorMessage: 'Не удалось изменить статус'));
      }
    });

    on<BSCRejectSchet>((event, emit) async {
      try {
        emit(BSCChangeStatusLoading());
        var _result =
            await GetIt.I<AbstractSchetRepository>().RejectSchet(event.reject);
        if (_result.succssed) {
          emit(BSCChangeStatusSuccessed());
        } else {
          emit(
              BSCChangeStatusFuile(errorMessage: 'Не удалось изменить статус'));
        }
      } catch (e) {
        emit(BSCChangeStatusFuile(errorMessage: 'Не удалось изменить статус'));
      }
    });
  }
  final AbstractSchetRepository schetRepository;
}
