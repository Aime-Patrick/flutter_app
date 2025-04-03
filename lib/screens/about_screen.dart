import 'package:flutter/material.dart';
import 'package:assignment_app/sql/sql.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  List<Map<String, dynamic>> students = [];

  @override
  void initState() {
    super.initState();
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    List<Map<String, dynamic>> studentList = await DatabaseHelper.instance.getStudents();
    setState(() {
      students = studentList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Students List")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: students.isEmpty
            ? const Center(child: Text("No students found"))
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  border: TableBorder.all(),
                  columns: const [
                    DataColumn(label: Text("Reg Number", style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text("Student Name", style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: students
                      .map((student) => DataRow(cells: [
                            DataCell(Text(student['regNumber'])),
                            DataCell(Text(student['studentName'])),
                          ]))
                      .toList(),
                ),
              ),
      ),
    );
  }
}
