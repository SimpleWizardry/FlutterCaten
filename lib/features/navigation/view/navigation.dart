import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:myapp/features/login/bloc/login_bloc.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final _storage = const FlutterSecureStorage();
  String _timeOfDay = '';
  bool darkTheme = false;

  var user;

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  Future<void> _checkAuth() async {
    final token = await _storage.read(
      key: "token",
      aOptions: _getAndroidOptions(),
    );
    debugPrint(token);
    if (token == null) {
      Navigator.of(context).pushNamed('/login');
    }
  }

  Future<void> _logout() async {
    await _storage.delete(
      key: "token",
      aOptions: _getAndroidOptions(),
    );
    Navigator.of(context).pushNamed('/login');
  }

  // AndroidOptions _getAndroidOptions() => const AndroidOptions(
  //   encryptedSharedPreferences: true,
  // );

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    int hour = now.hour;

    // _timeOfDay = hour.toString();
    if (hour < 7) {
      _timeOfDay = 'Доброй ночи';
    }
    else if (hour < 13) {
      _timeOfDay = 'Доброе утро';
    }
    else if (hour < 19) {
      _timeOfDay = 'Добрый день';
    } 
    else {
      _timeOfDay = 'Добрый вечер';
    }


    WidgetsBinding.instance.addPostFrameCallback((_) {
      final state = BlocProvider.of<LoginBloc>(context).state;
      if (state is LoginSuccessed) {
        user = state.user;
      }
    });
    // String formattedTime = DateFormat.Hm().format(now);
    // if (formattedTime)
    // debugPrint(hour.toString());
    _checkAuth();
    // bool loggedIn = _checkAuth();
    // if (!loggedIn) {

    // }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(title: const Text("Навигация"), actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Выйти',
            onPressed: () {
              _logout();
            },
          ),
        ]),
        body: ListView.separated(
          itemBuilder: (context, i) => ListTile(
            trailing: const Icon(Icons.arrow_forward_ios),
            title:
                Text('Утверждение счетов', style: theme.textTheme.bodyMedium),
            onTap: () {
              Navigator.of(context).pushNamed('/schet-list');
            },
          ),
          separatorBuilder: (context, i) => const Divider(),
          itemCount: 1,
        ),
        drawer: const Drawer());
  }
}
