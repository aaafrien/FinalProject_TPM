import 'package:finalproject/pages/homepage.dart';
import 'package:finalproject/pages/login.dart';
import 'package:finalproject/pages/register.dart';
import 'package:finalproject/routes/router_name.dart';
import 'package:flutter/material.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.login:
        return MaterialPageRoute(builder: (_) => LoginPage());

      case RouterName.register:
        return MaterialPageRoute(builder: (_) => RegisterPage());

      case RouterName.homepage:
        return MaterialPageRoute(builder: (_) => Homepage());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text("Error")),
        body: Center(child: Text('Error page')),
      );
    });
  }
}
