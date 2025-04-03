import 'package:flutter/material.dart';
import 'package:assignment_app/sql/sql.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController regController = TextEditingController();

  void _submitData() async {
    String name = nameController.text;
    String reg = regController.text;

    if (name.isNotEmpty && reg.isNotEmpty) {
      await DatabaseHelper.instance.insertStudent({
        'regNumber': name,
        'studentName': reg,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Data Saved: $name, $reg")),
      );
      nameController.clear();
      regController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Data Entry")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Enter Name"),
            ),
            TextField(
              controller: regController,
              decoration: InputDecoration(labelText: "Enter Registration ID"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitData,
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
