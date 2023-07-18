import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _username = "s";
  final _loginController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loginController.text = _username;
    _loginController.addListener(_changeName);
  }

  @override
  void dispose() {
    _loginController.dispose();
    super.dispose();
  }

  _changeName(){
    setState(() => _username = _loginController.text);
  }

  _login() {
    debugPrint(_username.toString());
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
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: _loginController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Логин',
                    hintText: 'Ваш логин от портала катэн'),
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 15),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
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
            Container(
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
            const SizedBox(
              height: 130,
            ),
            const Text('New User? Create Account')
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
