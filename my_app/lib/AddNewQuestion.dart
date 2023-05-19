import 'package:flutter/material.dart';
import 'package:my_app/CreateQuizScreen.dart';
import 'package:my_app/database_helper.dart';
import 'package:my_app/models.dart';

class AddNewQuestion extends StatefulWidget {
  @override
  _AddNewQuestionState createState() => _AddNewQuestionState();
}

class _AddNewQuestionState extends State<AddNewQuestion> {
  String questionController = '';
  String option1Controller = '';
  String option2Controller = '';
  String option3Controller = '';
  String option4Controller = '';
  String? selectedCorrectAnswer;
  List<Question> questions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 121, 109),
        title: Text('Add New Question'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Question',
                border: OutlineInputBorder(),
              ),
              onChanged: (newValue) {
                setState(() {
                  questionController = newValue;
                });
              },
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Text('a.  '),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Answer a',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        option1Controller = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Text('b.  '),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Answer b',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        option2Controller = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Text('c.  '),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Answer c',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        option3Controller = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Text('d.  '),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Answer d',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        option4Controller = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: selectedCorrectAnswer,
              decoration: InputDecoration(
                labelText: 'Correct Answer',
                border: OutlineInputBorder(),
              ),
              onChanged: (newValue) {
                setState(() {
                  selectedCorrectAnswer = newValue;
                });
              },
              items: ['a', 'b', 'c', 'd'].map((answer) {
                return DropdownMenuItem<String>(
                  value: answer,
                  child: Text(answer.toUpperCase()),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                String questionText = questionController;
                String option1Text = option1Controller;
                String option2Text = option2Controller;
                String option3Text = option3Controller;
                String option4Text = option4Controller;
                String correctAnswer = selectedCorrectAnswer ?? '';

                Question newQuestion = Question(
                  questionText: questionText,
                  options: [
                    Option(
                        optionText: option1Text,
                        isCorrect: correctAnswer == 'a'),
                    Option(
                        optionText: option2Text,
                        isCorrect: correctAnswer == 'b'),
                    Option(
                        optionText: option3Text,
                        isCorrect: correctAnswer == 'c'),
                    Option(
                        optionText: option4Text,
                        isCorrect: correctAnswer == 'd'),
                  ],
                );

                setState(() {
                  questionController = "";
                  option1Controller = "";
                  option2Controller = "";
                  option3Controller = "";
                  option4Controller = "";
                  selectedCorrectAnswer = null;
                });
                await DatabaseHelper().addQuestion(1, newQuestion);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CreateQuizScreen(),
                  ),
                );
              },
              child: Text(
                'Add Question',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 0, 121, 109),
                minimumSize: Size(200, 50),
              ),
            ),
            SizedBox(height: 16.0),
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
                            onPressed: () {
                              setState(() {
                                questions.removeAt(index);
                              });
                            },
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
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:my_app/database_helper.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class Option {
//   final String optionText;
//   final bool isCorrect;

//   Option({required this.optionText, required this.isCorrect});
// }

// class Question {
//   final String questionText;
//   final List<Option> options;

//   Question({required this.questionText, required this.options});
// }

// class AddNewQuestion extends StatefulWidget {
//   @override
//   _AddNewQuestionState createState() => _AddNewQuestionState();
// }

// class _AddNewQuestionState extends State<AddNewQuestion> {
//   final TextEditingController questionController = TextEditingController();
//   final TextEditingController option1Controller = TextEditingController();
//   final TextEditingController option2Controller = TextEditingController();
//   final TextEditingController option3Controller = TextEditingController();
//   final TextEditingController option4Controller = TextEditingController();
//   String? selectedCorrectAnswer;
//   List<Map<String, dynamic>> questions = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadQuestions();
//   }

//   Future<void> _loadQuestions() async {
//     List<Map<String, dynamic>> loadedQuestions =
//         await DatabaseHelper.instance.getAllQuestions();
//     setState(() {
//       questions = loadedQuestions;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 0, 121, 109),
//         title: Text('Add New Question'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextFormField(
//               controller: questionController,
//               decoration: InputDecoration(
//                 labelText: 'Question',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Row(
//               children: [
//                 Text('a.  '),
//                 Expanded(
//                   child: TextFormField(
//                     controller: option1Controller,
//                     decoration: InputDecoration(
//                       labelText: 'Option 1',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//             Row(
//               children: [
//                 Text('b.  '),
//                 Expanded(
//                   child: TextFormField(
//                     controller: option2Controller,
//                     decoration: InputDecoration(
//                       labelText: 'Option 2',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//             Row(
//               children: [
//                 Text('c.  '),
//                 Expanded(
//                   child: TextFormField(
//                     controller: option3Controller,
//                     decoration: InputDecoration(
//                       labelText: 'Option 3',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//             Row(
//               children: [
//                 Text('d.  '),
//                 Expanded(
//                   child: TextFormField(
//                     controller: option4Controller,
//                     decoration: InputDecoration(
//                       labelText: 'Option 4',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16.0),
//             DropdownButtonFormField<String>(
//               value: selectedCorrectAnswer,
//               decoration: InputDecoration(
//                 labelText: 'Correct Answer',
//                 border: OutlineInputBorder(),
//               ),
//               onChanged: (newValue) {
//                 setState(() {
//                   selectedCorrectAnswer = newValue;
//                 });
//               },
//               items: ['a', 'b', 'c', 'd'].map((answer) {
//                 return DropdownMenuItem<String>(
//                   value: answer,
//                   child: Text(answer.toUpperCase()),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () async {
//                 String questionText = questionController.text;
//                 String option1Text = option1Controller.text;
//                 String option2Text = option2Controller.text;
//                 String option3Text = option3Controller.text;
//                 String option4Text = option4Controller.text;
//                 String correctAnswer = selectedCorrectAnswer ?? '';

//                 Map<String, dynamic> newQuestion = {
//                   'questionText': questionText,
//                   'option1Text': option1Text,
//                   'option2Text': option2Text,
//                   'option3Text': option3Text,
//                   'option4Text': option4Text,
//                   'correctAnswer': correctAnswer,
//                 };

//                 int questionId =
//                     await DatabaseHelper.instance.insertQuestion(newQuestion);
//                 newQuestion['id'] = questionId;

//                 setState(() {
//                   questions.add(newQuestion);
//                 });

//                 questionController.clear();
//                 option1Controller.clear();
//                 option2Controller.clear();
//                 option3Controller.clear();
//                 option4Controller.clear();
//                 selectedCorrectAnswer = null;
//               },
//               child: Text(
//                 'Add Question',
//                 style: TextStyle(
//                   fontSize: 24,
//                 ),
//               ),
//               style: ElevatedButton.styleFrom(
//                 primary: Color.fromARGB(255, 0, 121, 109),
//                 minimumSize: Size(200, 50),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: questions.length,
//                 itemBuilder: (context, index) {
//                   final question = questions[index];

//                   return Card(
//                     margin: const EdgeInsets.all(8),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ListTile(
//                           title: Text(
//                             question['questionText'],
//                             style: Theme.of(context).textTheme.headline6,
//                           ),
//                           trailing: IconButton(
//                             icon: Icon(Icons.delete),
//                             onPressed: () async {
//                               await DatabaseHelper.instance
//                                   .deleteQuestion(question['id']);
//                               setState(() {
//                                 questions.removeAt(index);
//                               });
//                             },
//                           ),
//                         ),
//                         ListView.builder(
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           itemCount: 4,
//                           itemBuilder: (context, optionIndex) {
//                             final optionKey = 'option${optionIndex + 1}Text';
//                             final optionText = question[optionKey];
//                             final isCorrect = optionKey ==
//                                 'option${question['correctAnswer'].toUpperCase()}Text';

//                             return ListTile(
//                               leading: CircleAvatar(
//                                 backgroundColor: isCorrect
//                                     ? Colors.green
//                                     : Colors.grey.shade300,
//                                 child: Text((optionIndex + 1).toString()),
//                               ),
//                               title: Text(optionText),
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
