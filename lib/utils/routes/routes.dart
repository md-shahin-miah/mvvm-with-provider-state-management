import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_mvvm_state_management/utils/routes/routes_name.dart';
import 'package:provider_mvvm_state_management/view/screens/login_screen.dart';
import 'package:provider_mvvm_state_management/view/screens/my_home_page.dart';

class Routes {
  static MaterialPageRoute<dynamic> generateRoutes(
      RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MyHomePage());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(child: Text("no route defined")),
          );
        });
    }
  }
}
