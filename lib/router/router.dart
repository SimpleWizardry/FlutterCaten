import '../features/home/home.dart';
import '../features/login/view/login_screen.dart';
import '../features/navigation/view/navigation.dart';
import '../features/schets/schet_list/view/schet_list.dart';
import '../features/schets/schet_tabs/view/schet_tabs.dart';

final routes = {
  '/': (context) => const Navigation(),
  '/schet-list': (context) => const SchetList(),
  '/schet': (context) => const SchetTabs(),
  '/home': (context) => const Home(
        title: 'КАЛЮР mobile',
      ),
};
