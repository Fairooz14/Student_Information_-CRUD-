import 'package:flutter/material.dart';
import 'package:student_info_crud/db_helper/database_helper.dart';
import '../models/student.dart';


class StudentDetailPage extends StatefulWidget {
  final Student student;

  StudentDetailPage({required this.student});

  @override
  _StudentDetailPageState createState() => _StudentDetailPageState();
}

class _StudentDetailPageState extends State<StudentDetailPage> {
  late TextEditingController _nameController;
  late TextEditingController _studentIdController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _locationController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.student.name);
    _studentIdController = TextEditingController(text: widget.student.studentId);
    _phoneController = TextEditingController(text: widget.student.phone);
    _emailController = TextEditingController(text: widget.student.email);
    _locationController = TextEditingController(text: widget.student.location);
  }

  void _updateStudent() async {
    final updatedStudent = Student(
      id: widget.student.id,
      name: _nameController.text,
      studentId: _studentIdController.text,
      phone: _phoneController.text,
      email: _emailController.text,
      location: _locationController.text,
    );

    await DatabaseHelper().updateStudent(updatedStudent);
    Navigator.pop(context, true); // Passing true to indicate update
  }

  void _deleteStudent() async {
    await DatabaseHelper().deleteStudent(widget.student.id!);
    Navigator.pop(context, true); // Passing true to indicate delete
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 215, 198),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 227, 215, 198),
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: const Color.fromARGB(255, 74, 3, 87),
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Text('Student Detail',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 74, 3, 87))),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _studentIdController,
              decoration: InputDecoration(labelText: 'Student ID'),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: _updateStudent,
                  child: Text('Update', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 20, 118, 37)),
                ),
                ElevatedButton(
                  onPressed: _deleteStudent,
                  child: Text('Delete', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
