import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myapp/features/login/bloc/login_bloc.dart';

import '../../../generated/account.pb.dart';
import '../../../repositories/auth/auth_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _username = "";
  String _password = "";
  bool _isLoading = false;
  final _storage = const FlutterSecureStorage();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  final clientApp = AccountTerminalClient();

  final _loginBloc = LoginBloc();


// сократить
  Future<void> _addToken(String token) async {
    const String key = "token";
    final String value = token;

    debugPrint(token);
    try {
      await _storage.write(
        key: key,
        value: value,
        // iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _addRoles(User user) async {
    const String key = "roles";
    List<String> roles = [];
    for (var i = 0; i < user.roles.length; i++) {
      roles.add(user.roles[i].name);
    }
    debugPrint('$user');
    final String value = json.encode(roles);
    debugPrint(value);
    try {
      await _storage.write(
        key: key,
        value: value,
        // iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _addUserId(String userId) async {
    const String key = "userId";
    debugPrint(userId);
    try {
      await _storage.write(
        key: key,
        value: userId,
        // iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

// ТАК НЕ СРАБОТАЕТ НУЖЕН КАСТ
  // Future<void> _addUserData(User user) async {
  //   const String key = "user";
  //   final User value = user;

  //   // debugPrint(user);
  //   try {
  //     await _storage.write(
  //       key: key,
  //       value: value,
  //       // iOptions: _getIOSOptions(),
  //       aOptions: _getAndroidOptions(),
  //     );
  //   }
  //   catch(e) {
  //     debugPrint(e.toString());
  //   }
  // }
  Future<void> _addUserData(String user) async {
    const String key = "user";
    final String value = user;

    debugPrint(user);
    try {
      await _storage.write(
        key: key,
        value: value,
        // iOptions: _getIOSOptions(),
        aOptions: _getAndroidOptions(),
      );
    }
    catch(e) {
      debugPrint(e.toString());
    }
  }

  // IOSOptions _getIOSOptions() => IOSOptions(
  //   accountName: _getAccountName(),
  // );

  // IOSOptions _getIOSOptions() => IOSOptions(
  //   accessibility: IOSAccessibility.first_unlock,
  // );

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  @override
  void initState() {
    super.initState();
    _loginController.text = _username;
    _loginController.addListener(_changeName);

    _passwordController.text = _username;
    _passwordController.addListener(_changePassword);
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _changeName() {
    setState(() => _username = _loginController.text);
  }

  _changePassword() {
    setState(() => _password = _passwordController.text);
  }

  Future<void> _login() async {
    // _isLoading = true;
    setState(() => _isLoading = true);
    final request = LoginRequest()
      ..login = _username.toString()
      ..password = _password.toString();
    final response = await clientApp.login(request);
    // _isLoading = false;
    setState(() => _isLoading = false);
    if (response.succsecced == true) {

      // debugPrint(response.user.toString());
      // debugPrint(response.id);
      // final user = response.user as User;
      
      await _addUserData(jsonEncode(response.user));
      await _addToken(response.jwt);

      _loginBloc.add(Login(true, response.user));

      Navigator.of(context).pushNamed('/');
      // Navigator.of(context).pushNamed('/schet-list');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red[500],
          content: const Text('Неверный логин или пароль')));
    }
    // Navigator.of(context).pushNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.primaryColor,
        title: Text(
          'КАЛЮР mobile',
          style: theme.textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(
                  width: 200,
                  height: 150,
                  /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                  // child: Image.asset('asset/images/flutter-logo.png')
                ),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _loginController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Логин',
                    hintText: 'Ваш логин от портала катэн'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 15),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Пароль',
                    hintText: 'Пароль'),
              ),
            ),
            // TextButton(
            //   onPressed: (){
            //     //TODO FORGOT PASSWORD SCREEN GOES HERE
            //   },
            //   child: const Text(
            //     'Forgot Password',
            //     style: TextStyle(color: Colors.blue, fontSize: 15),
            //   ),
            // ),
            _isLoading
                ? const SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        // Navigator.of(context).pushNamed('/home');
                        _login();
                      },
                      child: const Text(
                        'Войти',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),

            // Container(
            //   height: 50,
            //   width: 250,
            //   decoration: BoxDecoration(
            //       color: Colors.blue[900],
            //       borderRadius: BorderRadius.circular(20)),
            //   // child: TextButton(
            //   //   onPressed: () {
            //   //     // Navigator.of(context).pushNamed('/home');
            //   //     _login();
            //   //   },
            //   //   child: const Text(
            //   //     'Войти',
            //   //     style: TextStyle(color: Colors.white, fontSize: 25),
            //   //   ),
            //   // ),
            //   child: _isLoading
            //     ? const SizedBox(
            //         height: 25,
            //         width: 25,
            //         child: CircularProgressIndicator(),
            //       )
            //     : TextButton(
            //     onPressed: () {
            //       // Navigator.of(context).pushNamed('/home');
            //       _login();
            //     },
            //     child: const Text(
            //       'Войти',
            //       style: TextStyle(color: Colors.white, fontSize: 25),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 130,
            ),
            // const Text('New User? Create Account')
          ],
        ),
      ),
      // body: Center(child:
      //   Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       TextField(decoration: const InputDecoration(
      //         border: OutlineInputBorder(),
      //         icon: Icon(Icons.login),
      //         hintText: "Введите логин",
      //         helperText: "Логин используется для входа в систему",
      //       ),
      //       // ElevatedButton(
      //       //     child: const Text("Click", style: TextStyle(fontSize: 22), ),
      //       //     onPressed:(){ Navigator.of(context).pushNamed('/home');}
      //       // ),
      //       ElevatedButton(
      //           child: const Text("Click", style: TextStyle(fontSize: 22), ),
      //           onPressed:(){ Navigator.of(context).pushNamed('/home');}
      //       ),
      //     ]
      //   ),
      // )
    );
  }
}
