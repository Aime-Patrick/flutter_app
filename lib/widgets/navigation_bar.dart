import 'package:flutter/material.dart';
import 'package:assignment_app/routes.dart';

class NavigationBar extends StatelessWidget {
  final String currentRoute;

  const NavigationBar({super.key, required this.currentRoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: currentRoute == AppRoutes.home
                ? null
                : () => Navigator.pushNamed(context, AppRoutes.home),
          ),
          IconButton(
            icon: Icon(Icons.info),
            onPressed: currentRoute == AppRoutes.about
                ? null
                : () => Navigator.pushNamed(context, AppRoutes.about),
          ),
          IconButton(
            icon: Icon(Icons.data_usage),
            onPressed: currentRoute == AppRoutes.data
                ? null
                : () => Navigator.pushNamed(context, AppRoutes.data),
          ),
          IconButton(
            icon: Icon(Icons.help),
            onPressed: currentRoute == AppRoutes.help
                ? null
                : () => Navigator.pushNamed(context, AppRoutes.help),
          ),
        ],
      ),
    );
  }
}