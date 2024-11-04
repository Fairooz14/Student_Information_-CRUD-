import 'package:flutter/material.dart';
import 'package:student_info_crud/db_helper/database_helper.dart';
import '../models/student.dart';

class StudentDetailPage extends StatelessWidget {
  final Student student;

  StudentDetailPage({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ID: ${student.id}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text("Name: ${student.name}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text("Phone: ${student.phone}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text("Email: ${student.email}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text("Location: ${student.location}", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await DatabaseHelper().deleteStudent(student.id!);
                  Navigator.pop(context, true);
                },
                child: Text('Delete Student'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  textStyle: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
