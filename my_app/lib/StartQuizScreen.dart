import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartQuizScreen extends StatefulWidget {
  @override
  _StartQuizScreenState createState() => _StartQuizScreenState();
}

class _StartQuizScreenState extends State<StartQuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;

  List<Map<String, dynamic>> questions = [
    {
      'question': 'What is the capital of France?',
      'options': ['Paris', 'London', 'Rome', 'Madrid'],
      'correctAnswerIndex': 0,
    },
    {
      'question': 'What is the largest planet in our solar system?',
      'options': ['Mars', 'Jupiter', 'Earth', 'Saturn'],
      'correctAnswerIndex': 1,
    },
    // Add more questions...
  ];

  void answerQuestion(int selectedIndex) {
    if (selectedIndex == questions[currentQuestionIndex]['correctAnswerIndex']) {
      setState(() {
        score++;
      });
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      // Quiz is completed
      // Display the score or navigate to a new screen
      print('Quiz completed. Score: $score');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 121, 109),
        title: Text('Quiz App'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1}:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              questions[currentQuestionIndex]['question'],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Counter: ${currentQuestionIndex + 1}/${questions.length}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: questions[currentQuestionIndex]['options'].length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    questions[currentQuestionIndex]['options'][index],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  onTap: () => answerQuestion(index),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
