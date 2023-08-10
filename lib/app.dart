
import 'package:flutter/material.dart';
import 'package:myapp/router/router.dart';
import 'package:myapp/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: commonTheme,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('ru'),
      ],
      // home: const Home(title: 'КАЛЮР mobile'),
      // routes: {
      //   '/': (context) => const LoginScreen(),
      //   '/home': (context) => const Home(title: 'КАЛЮР mobile',),
      // },
      // initialRoute: '/login',
      // home: const LoginScreen(),
      routes: routes
    );
  }
}