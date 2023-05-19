// Define a function that inserts dogs into the database
import 'models.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await openDatabase(
      'flutter_project.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
            CREATE TABLE users(
              id INTEGER PRIMARY KEY,
              accountName TEXT,
              accountEmail TEXT,
              avatar TEXT
           )
         ''');

        await db.insert('users', {
          'accountName': 'Mohammed Mkhaimar AbuSada',
          'accountEmail': 'mohammedabusada@gmail.com',
          'avatar': 'MM',
        });

        await db.execute('''
          CREATE TABLE quizzes(
            id INTEGER PRIMARY KEY,
            title TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE questions(
            id INTEGER PRIMARY KEY,
            quiz_id INTEGER,
            question_text TEXT,
            FOREIGN KEY(quiz_id) REFERENCES quizzes(id)
          )
        ''');

        await db.execute('''
          CREATE TABLE options(
            id INTEGER PRIMARY KEY,
            question_id INTEGER,
            option_text TEXT,
            is_correct INTEGER,
            FOREIGN KEY(question_id) REFERENCES questions(id)
          )
        ''');
      },
    );

    return _database!;
  }

  Future<void> clearDatabase() async {
    final db = await database;

    // Delete all records from the quizzes table
    await db.delete('quizzes');

    // Delete all records from the questions table
    await db.delete('questions');

    // Delete all records from the options table
    await db.delete('options');
  }

  Future<void> addQuiz(Quiz quiz) async {
    final db = await database;

    await db.transaction((txn) async {
      final quizId = await txn.insert('quizzes', quiz.toMap());

      for (final question in quiz.questions) {
        question.quizId = quizId;
        final questionId = await txn.insert('questions', question.toMap());

        for (final option in question.options) {
          option.questionId = questionId;
          await txn.insert('options', option.toMap());
        }
      }
    });
  }

  Future<List<Quiz>> getQuizzes() async {
    final db = await database;

    // Query the quizzes with their titles
    final quizzesData = await db.query('quizzes');

    final quizzes = <Quiz>[];

    // Query the questions for each quiz
    for (final quizData in quizzesData) {
      final quiz = Quiz.fromMap(quizData);
      final questionsData = await db.query(
        'questions',
        where: 'quiz_id = ?',
        whereArgs: [quiz.id],
      );
      final questions = <Question>[];

      // Query the options for each question
      for (final questionData in questionsData) {
        final question = Question.fromMap(questionData);
        final optionsData = await db.query(
          'options',
          where: 'question_id = ?',
          whereArgs: [question.id],
        );
        final options = optionsData
            .map((optionData) => Option.fromMap(optionData))
            .toList();
        question.options = options;
        questions.add(question);
      }

      quiz.questions = questions;
      quizzes.add(quiz);
    }

    return quizzes;
  }

  Future<void> addQuestion(int quizId, Question question) async {
    final db = await database;
    await db.transaction((txn) async {
      // insert the question
      question.quizId = quizId;
      final questionId = await txn.insert('questions', question.toMap());

      // insert the options
      for (final option in question.options) {
        option.questionId = questionId;
        await txn.insert('options', option.toMap());
      }
    });
  }

  Future<void> deleteQuestion(int questionId) async {
    final db = await database;
    await db
        .delete('options', where: 'question_id = ?', whereArgs: [questionId]);
    await db.delete('questions', where: 'id = ?', whereArgs: [questionId]);
  }

  void printQuizzes(List<Quiz> quizzes) {
    for (Quiz quiz in quizzes) {
      print('Quiz ${quiz.id}: ${quiz.title}');
      print('Questions:');
      for (Question question in quiz.questions) {
        print('- ${question.id} ${question.questionText}');
        print('  Options:');
        for (Option option in question.options) {
          print(
              '  - ${option.optionText}${option.isCorrect ? ' (correct)' : ''}');
        }
      }
    }
  }
}
