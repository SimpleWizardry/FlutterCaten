import '../features/home/home.dart';
import '../features/login/view/login_screen.dart';
import '../features/navigation/view/navigation.dart';
import '../features/schets/schet_list/view/schet_list.dart';
import '../features/schets/schet_tabs/view/schet_tabs.dart';

final routes = {
  '/': (context) => const Navigation(),
  '/schet-list': (context) => const SchetList(),
<<<<<<< HEAD
  '/schet': (context) => const SchetTabs(),
=======
  '/login': (context) => const LoginScreen(),
>>>>>>> 331dc9018ed5e844625d7c37304d353922bd7b1e
  '/home': (context) => const Home(
        title: 'КАЛЮР mobile',
      ),
};
