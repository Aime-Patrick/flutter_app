import 'package:assignment_app/models/user_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class DatabaseHelper {
  static Database? _database;
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

 Future<Database> _initDatabase() async {
    try {
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, 'app_database.db');

      return await openDatabase(
        path,
        version: 2,
        onCreate: (db, version) async {
          await db.execute('''
            CREATE TABLE IF NOT EXISTS users (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              username TEXT NOT NULL, 
              email TEXT UNIQUE NOT NULL, 
              password TEXT NOT NULL
            )
          ''');

          await db.execute('''
            CREATE TABLE IF NOT EXISTS students (
              id INTEGER PRIMARY KEY AUTOINCREMENT, 
              regNumber TEXT UNIQUE NOT NULL, 
              studentName TEXT NOT NULL
            )
          ''');
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          if (oldVersion < 2) {
            await db.execute('''
              CREATE TABLE IF NOT EXISTS students (
                id INTEGER PRIMARY KEY AUTOINCREMENT, 
                regNumber TEXT UNIQUE NOT NULL, 
                studentName TEXT NOT NULL
              )
            ''');
          }
        },
      );
    } catch (e) {
      print('Error initializing database: $e');
      rethrow;
    }
  }

  Future<void> insertUser(Map<String, dynamic> user) async {
    try {
      final db = await database;
      await db.insert('users', user, conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      print('Error inserting user: $e');
    }
  }


  Future<List<Map<String, dynamic>>> getUsers() async {
    try {
      final db = await database;
      return await db.query('users');
    } catch (e) {
      print('Error fetching users: $e');
      return [];
    }
  }


  Future<User?> loginUser(String email, String password) async {
    try {
      final db = await database;
      final result = await db.query(
        'users',
        where: 'email = ? AND password = ?',
        whereArgs: [email, password],
      );

      if (result.isNotEmpty) {
        return User.fromMap(result.first);
      } else {
        return null; // Login failed
      }
    } catch (e) {
      print('Error logging in: $e');
      return null;
    }
  }

  // Insert Student
  Future<void> insertStudent(Map<String, dynamic> student) async {
    try {
      final db = await database;
      await db.insert('students', student, conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      print('Error inserting student: $e');
    }
  }

  // Fetch Students
  Future<List<Map<String, dynamic>>> getStudents() async {
    try {
      final db = await database;
      return await db.query('students');
    } catch (e) {
      print('Error fetching students: $e');
      return [];
    }
  }

  // Delete Student
  Future<void> deleteStudent(String regNumber) async {
    try {
      final db = await database;
      await db.delete('students', where: 'regNumber = ?', whereArgs: [regNumber]);
    } catch (e) {
      print('Error deleting student: $e');
    }
  }
}
