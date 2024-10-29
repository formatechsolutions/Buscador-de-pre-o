import 'package:busca_preco/core/pages/home/home.dart';
import 'package:busca_preco/core/pages/login/login.dart';
import 'package:get/get.dart';

class Routes {
  static const String home = '/home';
  static const String login = '/login';

  static final routes = <GetPage<dynamic>>[
    GetPage(
      name: home,
      page: HomePage.new,
    ),
    GetPage(
      name: login,
      page: LoginPage.new,
    ),
  ];
}
