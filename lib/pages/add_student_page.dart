import 'package:flutter/material.dart';
import 'package:student_info_crud/db_helper/database_helper.dart';
import '../models/student.dart';

class AddStudentPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _studentIdController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 182, 241),
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 222, 182, 241),
          title: Center(
              child: Text(
            'All Students',
            style: TextStyle(
              fontSize: 20,
              color: const Color.fromARGB(255, 74, 3, 87),
            ),
          ))),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  }),
              TextFormField(
                  controller: _studentIdController,
                  decoration: InputDecoration(labelText: 'Student ID'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Student Id';
                    }
                    return null;
                  }),
              TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    return null;
                  }),
              TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  }),
              TextFormField(
                  controller: _locationController,
                  decoration: InputDecoration(labelText: 'Location'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your location';
                    }
                    return null;
                  }),
              SizedBox(height: 20),
              Container(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 74, 3, 87),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final student = Student(
                        name: _nameController.text,
                        studentId: _studentIdController.text,
                        phone: _phoneController.text,
                        email: _emailController.text,
                        location: _locationController.text,
                      );
                      await DatabaseHelper().insertStudent(student);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
