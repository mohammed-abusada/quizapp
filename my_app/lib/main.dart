import 'package:flutter/material.dart';
import 'home.dart';
import 'database_helper.dart';
import 'models.dart';

final quizInfo = Quiz(title: 'My Quiz', questions: [
  Question(
    questionText: 'Who painted the Mona Lisa?',
    options: [
      Option(optionText: 'Leonardo da Vinci', isCorrect: true),
      Option(optionText: 'Pablo Picasso', isCorrect: false),
      Option(optionText: 'Vincent van Gogh', isCorrect: false),
      Option(optionText: 'Michelangelo', isCorrect: false),
    ],
  ),
  Question(
    questionText: 'What is the largest planet in our solar system?',
    options: [
      Option(optionText: 'Jupiter', isCorrect: true),
      Option(optionText: 'Mars', isCorrect: false),
      Option(optionText: 'Saturn', isCorrect: false),
      Option(optionText: 'Earth', isCorrect: false),
    ],
  ),
  Question(
    questionText: 'Who wrote the play "Romeo and Juliet"?',
    options: [
      Option(optionText: 'William Shakespeare', isCorrect: true),
      Option(optionText: 'George Orwell', isCorrect: false),
      Option(optionText: 'Mark Twain', isCorrect: false),
      Option(optionText: 'Charles Dickens', isCorrect: false),
    ],
  ),
  Question(
    questionText: 'What is the chemical symbol for gold?',
    options: [
      Option(optionText: 'Au', isCorrect: true),
      Option(optionText: 'Ag', isCorrect: false),
      Option(optionText: 'Cu', isCorrect: false),
      Option(optionText: 'Fe', isCorrect: false),
    ],
  ),
  // Question(
  //   questionText: 'Which is the largest mammal in the world?',
  //   options: [
  //     Option(optionText: 'Elephant', isCorrect: false),
  //     Option(optionText: 'Giraffe', isCorrect: false),
  //     Option(optionText: 'Blue whale', isCorrect: true),
  //     Option(optionText: 'Hippopotamus', isCorrect: false),
  //   ],
  // ),
  // Question(
  //   questionText: 'What is the capital of France?',
  //   options: [
  //     Option(optionText: 'Paris', isCorrect: true),
  //     Option(optionText: 'London', isCorrect: false),
  //     Option(optionText: 'Rome', isCorrect: false),
  //     Option(optionText: 'Berlin', isCorrect: false),
  //   ],
  // ),
  // Question(
  //   questionText: 'Who invented the telephone?',
  //   options: [
  //     Option(optionText: 'Alexander Graham Bell', isCorrect: true),
  //     Option(optionText: 'Thomas Edison', isCorrect: false),
  //     Option(optionText: 'Nikola Tesla', isCorrect: false),
  //     Option(optionText: 'Albert Einstein', isCorrect: false),
  //   ],
  // ),
  // Question(
  //   questionText: 'What is the tallest mountain in the world?',
  //   options: [
  //     Option(optionText: 'Mount Everest', isCorrect: true),
  //     Option(optionText: 'K2', isCorrect: false),
  //     Option(optionText: 'Matterhorn', isCorrect: false),
  //     Option(optionText: 'Kilimanjaro', isCorrect: false),
  //   ],
  // ),
  // Question(
  //   questionText: 'Which planet is known as the "Red Planet"?',
  //   options: [
  //     Option(optionText: 'Mars', isCorrect: true),
  //     Option(optionText: 'Mercury', isCorrect: false),
  //     Option(optionText: 'Venus', isCorrect: false),
  //     Option(optionText: 'Neptune', isCorrect: false),
  //   ],
  // ),
  // Question(
  //   questionText: 'Who wrote the novel "Pride and Prejudice"?',
  //   options: [
  //     Option(optionText: 'Jane Austen', isCorrect: true),
  //     Option(optionText: 'Charlotte Bronte', isCorrect: false),
  //     Option(optionText: 'Emily Bronte', isCorrect: false),
  //     Option(optionText: 'Virginia Woolf', isCorrect: false),
  //   ],
  // ),
]);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().database;

  await DatabaseHelper().clearDatabase();
  await DatabaseHelper().addQuiz(quizInfo);

  runApp(const home());
}
