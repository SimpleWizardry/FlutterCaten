import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/features/schets/services/schet.pb.dart';
import 'package:path_provider/path_provider.dart';

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
  }
  final AbstractSchetRepository schetRepository;
}
