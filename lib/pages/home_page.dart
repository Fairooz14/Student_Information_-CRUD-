import 'package:flutter/material.dart';
import 'package:student_info_crud/pages/add_student_page.dart';
import 'package:student_info_crud/pages/view_student_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 215, 198),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 227, 215, 198),
          title: Center(
              child: Text(
            'Student Informtaion Dept of CSE',
            style: TextStyle(
              fontSize: 20,
              color: const Color.fromARGB(255, 74, 3, 87),
            ),
          ))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 400,
              decoration: BoxDecoration(
                // color: const Color.fromARGB(255, 74, 3, 87),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assests/images/campus.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('International University',
                style: TextStyle(
                  fontSize: 24,
                  color: const Color.fromARGB(255, 74, 3, 87),
                )),
            SizedBox(height: 50),
            Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 74, 3, 87),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddStudentPage(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_add),
                    SizedBox(width: 8),
                    Text('Add Students'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 74, 3, 87),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewStudentsPage(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.people),
                    SizedBox(width: 8),
                    Text('View All Students'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
