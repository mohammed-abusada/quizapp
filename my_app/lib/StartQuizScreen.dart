import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/ResultSuccessScreen.dart';
import 'package:my_app/RuseltFailedScreen.dart';
import 'package:my_app/models.dart';
import 'database_helper.dart';

class StartQuizScreen extends StatefulWidget {
  @override
  _StartQuizScreenState createState() => _StartQuizScreenState();
}

class _StartQuizScreenState extends State<StartQuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;

  void answerQuestion(bool answer, List<Question> questions) {
    if (answer) {
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
      if (score >= 5) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResultSuccessScreen(score: score)),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResultFailedScreen(score: score)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Quiz>>(
      future: DatabaseHelper().getQuizzes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("loading");
        } else if (snapshot.hasError) {
          return Text('Error');
        } else if (!snapshot.hasData) {
          return Text('No quizzes.');
        } else {
          List<Quiz> quizzes = snapshot.data!;
          var questions = quizzes[0].questions;

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
                      borderRadius: BorderRadius.circular(
                          10.0), // Rounded corners for the question container
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
                            color: Color.fromARGB(255, 0, 121,
                                109), // Background color for the question
                            borderRadius: BorderRadius.circular(
                                10.0), // Rounded corners for the question container
                          ),
                          child: Text(
                            questions[currentQuestionIndex].questionText,
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
                    itemCount: questions[currentQuestionIndex].options.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 4.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromARGB(255, 0, 121,
                                109), // Border color for the options
                            width: 3.0,
                          ),
                          borderRadius: BorderRadius.circular(
                              8.0), // Rounded corners for the options container
                        ),
                        child: ListTile(
                          title: Text(
                            questions[currentQuestionIndex]
                                .options[index]
                                .optionText,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          onTap: () => answerQuestion(
                              questions[currentQuestionIndex]
                                  .options[index]
                                  .isCorrect,
                              questions),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
