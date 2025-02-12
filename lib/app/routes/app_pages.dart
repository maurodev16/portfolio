import 'package:get/get.dart';
import '../views/home_screen.dart';

abstract class Routes {
  static const HOME = '/home';
}

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
    ),
  ];
}
