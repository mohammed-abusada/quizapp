import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
    String path = join(await getDatabasesPath(), 'quiz.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE questions (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        questionText TEXT,
        option1Text TEXT,
        option2Text TEXT,
        option3Text TEXT,
        option4Text TEXT,
        correctAnswer TEXT
      )
      ''');
  }

  Future<int> insertQuestion(Map<String, dynamic> question) async {
    Database db = await instance.database;
    return await db.insert('questions', question);
  }

  Future<List<Map<String, dynamic>>> getAllQuestions() async {
    Database db = await instance.database;
    return await db.query('questions');
  }

  Future<void> deleteQuestion(int id) async {
    Database db = await instance.database;
    await db.delete('questions', where: 'id = ?', whereArgs: [id]);
  }
}
