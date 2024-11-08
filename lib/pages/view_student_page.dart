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

  // Load students from database
  void _loadStudents() async {
    try {
      final data = await DatabaseHelper().fetchStudents();
      print('Loaded students: $data'); // Debug print to check data loading
      setState(() => students = data);
    } catch (e) {
      print('Error loading students: $e'); // Print any error that occurs
    }
  }

  // Delete student from database
  void _deleteStudent(int id) async {
    try {
      await DatabaseHelper().deleteStudent(id);
      print('Deleted student with ID: $id'); // Debug print for deletion
      _loadStudents(); // Reload the list after deletion
    } catch (e) {
      print('Error deleting student: $e'); // Handle any deletion errors
    }
  }

  // Navigate to student detail page
  Future<void> _navigateToStudentDetail(Student student) async {
    final bool? isDeleted = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudentDetailPage(student: student),
      ),
    );

    if (isDeleted == true) {
      _loadStudents(); // Reload list if a student was deleted in detail page
    }
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
            Text('All Students',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 74, 3, 87))),
          ],
        ),
      ),
      body: students.isEmpty
          ? Center(
              child: Text(
                'No students found.',
                style: TextStyle(color: const Color.fromARGB(255, 74, 3, 87), fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return ListTile(
                  title: Text(student.studentId ?? 'Unknown ID'), // Added null check
                  subtitle: Text(student.name ?? 'Unknown Name'), // Added null check
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: const Color.fromARGB(255, 182, 51, 42)),
                    onPressed: () {
                      if (student.id != null) {
                        _deleteStudent(student.id!);
                      } else {
                        print('Error: student ID is null');
                      }
                    },
                  ),
                  onTap: () => _navigateToStudentDetail(student),
                );
                
              },
            ),
            
    );
  }
}


