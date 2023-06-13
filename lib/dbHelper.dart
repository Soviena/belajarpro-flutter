import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'session.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE sessions (
            id INTEGER PRIMARY KEY,
            email TEXT,
            uid INTEGER,
            loggedin TEXT,
            admin TEXT,
            name TEXT,
            profilePic TEXT
          )
        ''');
      },
    );
  }

  Future<void> saveSession(String email, int uid, String admin,
      String profilePic, String name) async {
    final db = await instance.database;
    await db.insert('sessions', {
      'email': email,
      'uid': uid,
      'loggedin': true,
      'admin': (admin.toLowerCase() == 'true'),
      'name': name,
      'profilePic': profilePic
    });
  }

  Future<bool> getLogin() async {
    final db = await instance.database;
    List<Map<String, dynamic>> result = await db.query('sessions', limit: 1);
    if (result.isNotEmpty) {
      return result.first['loggedin'] == '1';
    }
    return false;
  }

  Future<void> deleteSession() async {
    final db = await instance.database;
    await db.delete('sessions');
  }

  Future<dynamic> getSession() async {
    final db = await instance.database;
    List<Map<String, dynamic>> result = await db.query('sessions', limit: 1);
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }
}
