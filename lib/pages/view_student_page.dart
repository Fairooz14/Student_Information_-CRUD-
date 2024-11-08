import 'package:flutter/material.dart';
import 'package:student_info_crud/db_helper/database_helper.dart';
import 'package:student_info_crud/pages/student_detail_page.dart';
import '../models/student.dart';


class ViewStudentsPage extends StatefulWidget {
  @override
  _ViewStudentsPageState createState() => _ViewStudentsPageState();
}

class _ViewStudentsPageState extends State<ViewStudentsPage> {
  List<Student> students = [];

  @override
  void initState() {
    super.initState();
    _loadStudents();
  }

  void _loadStudents() async {
    final data = await DatabaseHelper().fetchStudents();
    setState(() => students = data);
  }

  void _deleteStudent(int id) async {
    await DatabaseHelper().deleteStudent(id);
    _loadStudents();
  }

  Future<void> _navigateToStudentDetail(Student student) async {
    final bool? isDeleted = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudentDetailPage(student: student),
      ),
    );

    if (isDeleted == true) {
      _loadStudents();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 182, 241),
      appBar: AppBar(backgroundColor: const Color.fromARGB(255, 222, 182, 241),
          title: Center(
              child: Text(
            'All Students',
            style: TextStyle(
              fontSize: 20,
              color: const Color.fromARGB(255, 74, 3, 87),
            ),
          ))),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return ListTile(
            title: Text(student.studentId),

            subtitle: Text(student.name),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: const Color.fromARGB(255, 123, 11, 3)),
              onPressed: () => _deleteStudent(student.id!),
            ),
            onTap: () => _navigateToStudentDetail(student),
          );
        },
      ),
    );
  }
}
