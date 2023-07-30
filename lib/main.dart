import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:myapp/app.dart';

import 'features/schets/repository/abstractSchetRepository.dart';
import 'features/schets/repository/schetRepository.dart';

void main() {
  GetIt.I
      .registerLazySingleton<AbstractSchetRepository>(() => SchetRepository());
  runApp(const MyApp());
}
