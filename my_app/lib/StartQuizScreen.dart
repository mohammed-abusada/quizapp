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
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // Rounded corners for the question container
              ),
              child: Column(
                children: [
                  SizedBox(height: 16.0),
                  Text(
                    'Question ${currentQuestionIndex + 1}/${questions.length}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 0, 121, 109), // Background color for the question
                      borderRadius: BorderRadius.circular(10.0), // Rounded corners for the question container
                    ),
                    child: Text(
                      questions[currentQuestionIndex]['question'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: questions[currentQuestionIndex]['options'].length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 4.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 0, 121, 109), // Border color for the options
                      width: 3.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners for the options container
                  ),
                  child: ListTile(
                    title: Text(
                      questions[currentQuestionIndex]['options'][index],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    onTap: () => answerQuestion(index),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
