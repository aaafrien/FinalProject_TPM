import 'package:finalproject/components/navbar.dart';
import 'package:flutter/material.dart';
import 'package:finalproject/pages/homepage.dart';
import 'package:finalproject/pages/profile.dart';
import 'package:finalproject/pages/login.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/navbar':
        return MaterialPageRoute(builder: (_) => Navbar());
      case '/home':
        return MaterialPageRoute(builder: (_) => Homepage());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfilePage());
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
