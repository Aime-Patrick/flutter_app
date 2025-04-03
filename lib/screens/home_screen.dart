import 'package:assignment_app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:assignment_app/routes.dart';
import 'package:assignment_app/widgets/navigation_bar.dart' as custom;

class HomeScreen extends StatelessWidget {
  final User user;
  const HomeScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to our application! This is the Home page where we provide basic information.",
              style: TextStyle(fontSize: 18),
            ),
            Spacer(),
            custom.NavigationBar(currentRoute: AppRoutes.home),
          ],
        ),
      ),
    );
  }
}
