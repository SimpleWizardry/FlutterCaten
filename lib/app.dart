
import 'package:flutter/material.dart';
import 'package:myapp/router/router.dart';
import 'package:myapp/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: commonTheme,
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