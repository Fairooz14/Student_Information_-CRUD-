import 'package:flutter/material.dart';
import 'package:student_info_crud/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Information App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),  
    );
  }
}