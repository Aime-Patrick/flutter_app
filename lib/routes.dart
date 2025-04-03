import 'package:assignment_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/about_screen.dart';
import 'screens/data_screen.dart';
import 'screens/help_screen.dart';
import 'screens/signup_screen.dart';

class AppRoutes {
  static const String login = '/';
  static const String home = '/home';
  static const String about = '/about';
  static const String data = '/data';
  static const String help = '/help';
  static const String signup = '/signup';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen(user: User(username: 'username', email: 'email@example.com', password: 'password'),));
      case about:
        return MaterialPageRoute(builder: (_) => AboutScreen());
      case data:
        return MaterialPageRoute(builder: (_) => DataScreen());
      case help:
        return MaterialPageRoute(builder: (_) => HelpScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      default:
        return MaterialPageRoute(builder: (_) => LoginScreen());
    }
  }
}
