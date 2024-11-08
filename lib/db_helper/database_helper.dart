import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/student.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'student.db');

    return await openDatabase(
      path,
      version: 1, // Ensure the version number matches your latest schema
      onCreate: (db, version) async {
        await _createDb(db);
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute('ALTER TABLE students ADD COLUMN studentId TEXT');
        }
      },
    );
  }

  Future<void> _createDb(Database db) async {
    await db.execute('''
      CREATE TABLE students (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        studentId TEXT,
        name TEXT,
        phone TEXT,
        email TEXT,
        location TEXT
      )
    ''');
    print("Database created with the correct schema.");
  }

  // Insert Student with try-catch and returning inserted row ID
  Future<int> insertStudent(Student student) async {
    try {
      final db = await database;
      int id = await db.insert('students', student.toMap());
      print('Student inserted with ID: $id');
      return id;
    } catch (e) {
      print('Error inserting student: $e');
      return -1;
    }
  }

  // Fetch students method
  Future<List<Student>> fetchStudents() async {
    final db = await database;
    final maps = await db.query('students');
    print('Fetched students: $maps');
    return List.generate(maps.length, (i) => Student.fromMap(maps[i]));
  }

  // Update student method
  Future<void> updateStudent(Student student) async {
    final db = await database;
    await db.update(
      'students',
      student.toMap(),
      where: 'id = ?',
      whereArgs: [student.id],
    );
    print('Student with ID ${student.id} updated');
  }

  // Delete student method
  Future<void> deleteStudent(int id) async {
    final db = await database;
    await db.delete('students', where: 'id = ?', whereArgs: [id]);
    print('Student with ID $id deleted');
  }
}
