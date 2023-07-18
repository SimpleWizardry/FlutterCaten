import '../features/home/home.dart';
import '../features/login/view/login_screen.dart';

final routes = {
  '/': (context) => const LoginScreen(),
  '/home': (context) => const Home(title: 'КАЛЮР mobile',),
};