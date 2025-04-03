import 'package:flutter/material.dart';
import 'routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter App")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "Navigation Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () => Navigator.pushNamed(context, AppRoutes.home),
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About Us"),
              onTap: () => Navigator.pushNamed(context, AppRoutes.about),
            ),
            ListTile(
              leading: Icon(Icons.data_usage),
              title: Text("Data"),
              onTap: () => Navigator.pushNamed(context, AppRoutes.data),
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Help"),
              onTap: () => Navigator.pushNamed(context, AppRoutes.help),
            ),
          ],
        ),
      ),
      body: Center(child: Text("Welcome! Select a page from the menu.")),
    );
  }
}
