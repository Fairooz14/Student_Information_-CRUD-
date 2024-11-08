# Student Info CRUD App

A simple Flutter app for managing student information, allowing users to add, update, and delete student data stored in a local SQLite database.


## Overview

This application provides a user-friendly interface to create, view, update, and delete student information. It is built with Flutter and uses SQLite as the local database to store and retrieve data. This is ideal for anyone looking to practice their Flutter and database integration skills.

## Watch the Preview

https://github.com/user-attachments/assets/dfcb0ce0-1da0-4d66-9a89-feedd4003f05




## Features

- Add a new student with details such as name, student Id, phone, email, and location.
- View all students with their respective information.
- Update existing student details.
- Delete a student from the database.
- Persist data locally using SQLite.



## Getting Started

### Prerequisites

- **Flutter**: Ensure that Flutter is installed. [Install Flutter](https://flutter.dev/docs/get-started/install)
- **SQLite**: The project uses SQLite for data storage. No additional installation is required as SQLite is supported by Flutter.

### Installation

1. **Clone the repository:**
   ```bash
   https://github.com/Fairooz14/Student_Information_-CRUD-.git
   ```
2. **Navigate to the project directory:**
   ```bash
   cd Student_Information_-CRUD-
   ```
3. **Install dependencies:**
   ```bash
   flutter pub get
   ```
4. **Run the app:**
   ```bash
   flutter run
   ```
### Project Structure
```
lib/
├── main.dart                 
├── models/                  
│   └── student.dart         
├── pages/                  
│   ├── home_page.dart    
│   ├── add_student_page.dart
├   ├── view_student_page.dart     
│   └── student_detail_page.dart   
└── bd_helper/                 
    └── database_helper.dart 
```

### Dependencies
```
dependencies:
  flutter:
    sdk: flutter
  sqflite: ^2.4.0
  fluttertoast: ^8.2.8
  awesome_dialog: ^3.2.1
  path: ^1.9.0
```
<hr>
Thank you for checking out this project! Happy coding! 🚀
