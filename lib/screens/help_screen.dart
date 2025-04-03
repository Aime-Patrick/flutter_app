import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Help")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          "Need assistance? Contact ndagijimanapazo64@gmail.com",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
