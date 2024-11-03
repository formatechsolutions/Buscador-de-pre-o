import 'package:busca_preco/core/pages/home/HomePage.dart';
import 'package:busca_preco/core/pages/login/LoginPage.dart';
import 'package:busca_preco/core/pages/register/RegisterPage.dart';
import 'package:get/get.dart';

class Routes {
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';

  static final routes = <GetPage<dynamic>>[
    GetPage(
      name: home,
      page: HomePage.new,
    ),
    GetPage(
      name: register,
      page: RegisterPage.new,
    ),
    GetPage(
      name: login,
      page: LoginPage.new,
    ),
  ];
}
