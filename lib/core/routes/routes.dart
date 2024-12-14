import 'package:busca_preco/core/pages/home/home_page.dart';
import 'package:busca_preco/core/pages/reset_password/reset_password.dart';

import '../pages/index/index_page.dart';
import '../pages/login/login_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String index = '/index';
  static const String login = '/login';
  static const String resetPassword = '/reset-password';
  static const String home = '/home';

  static final routes = <GetPage<dynamic>>[
    GetPage(
      name: index,
      page: IndexPage.new,
    ),
    GetPage(
      name: login,
      page: LoginPage.new,
    ),
    GetPage(
      name: resetPassword,
      page: ResetPassword.new,
    ),
    GetPage(
      name: home,
      page: HomePage.new,
    ),
  ];
}
