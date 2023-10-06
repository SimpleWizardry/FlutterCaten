part of 'login_bloc.dart';

class LoginEvent {}

class Login extends LoginEvent {
  final bool init;
  final user;
  // final FilterSchet filterSchet;

  Login(this.init, this.user);
  // LoadSchetList(this.init, this.filterSchet);
}
