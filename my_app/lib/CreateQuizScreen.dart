import 'package:flutter/material.dart';
import 'package:my_app/AddNewQuestion.dart';
import 'package:my_app/database_helper.dart';
import 'models.dart';

class CreateQuizScreen extends StatefulWidget {
  CreateQuizScreen({Key? key}) : super(key: key);

  @override
  _CreateQuizScreenState createState() => _CreateQuizScreenState();
}

class _CreateQuizScreenState extends State<CreateQuizScreen> {
  DatabaseHelper instance = DatabaseHelper();

  Future<void> _confirmDeleteQuestion(int questionId) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Question'),
        content: Text('Are you sure you want to delete this question?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed ?? false) {
      await instance.deleteQuestion(questionId);
      setState(() {}); // Refresh the UI
    }
  }

  void _addNewQuestion() {
    _openAddNewQuestionScreen();
  }

  void _openAddNewQuestionScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewQuestion(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Quiz>>(
        future: instance.getQuizzes(),
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
                title: Text("Create Quiz"),
                backgroundColor: Color.fromARGB(255, 0, 121, 109),
              ),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: _addNewQuestion,
                      child: Text(
                        'Add new question',
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 0, 121, 109),
                        minimumSize: Size(200, 50),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: questions.length,
                      itemBuilder: (context, index) {
                        final question = questions[index];

                        return Card(
                          margin: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(
                                  question.questionText,
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () =>
                                      _confirmDeleteQuestion(question.id),
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: question.options.length,
                                itemBuilder: (context, optionIndex) {
                                  final option = question.options[optionIndex];

                                  return ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: option.isCorrect
                                          ? Colors.green
                                          : Colors.grey.shade300,
                                      child: Text((optionIndex + 1).toString()),
                                    ),
                                    title: Text(option.optionText),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
