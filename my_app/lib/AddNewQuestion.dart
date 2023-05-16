// class addNewQuestion extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 0, 121, 109),
//         title: Text('Add New Question'),
//       ),
//       body: Container(

//       ),
//     );
//   }
// }
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class AddNewQuestion extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 0, 121, 109),
//         title: Text('Add New Question'),
//       ),
//       body: Container(),
//     );
//   }
// }
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

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
//                 prefixIcon: Icon(Icons.question_answer),
//               ),
//             ),
//             SizedBox(height: 16.0),
//             buildAnswerField('a', option1Controller),
//             SizedBox(height: 16.0),
//             buildAnswerField('b', option2Controller),
//             SizedBox(height: 16.0),
//             buildAnswerField('c', option3Controller),
//             SizedBox(height: 16.0),
//             buildAnswerField('d', option4Controller),
//             SizedBox(height: 16.0),
//             DropdownButtonFormField<String>(
//               value: selectedCorrectAnswer,
//               onChanged: (value) {
//                 setState(() {
//                   selectedCorrectAnswer = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 labelText: 'Correct Answer',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.check),
//               ),
//               items: ['a', 'b', 'c', 'd'].map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 // Perform the logic to save the question and options
//                 String questionText = questionController.text;
//                 String option1Text = option1Controller.text;
//                 String option2Text = option2Controller.text;
//                 String option3Text = option3Controller.text;
//                 String option4Text = option4Controller.text;

//                 String correctAnswer = selectedCorrectAnswer ?? '';

//                 // TODO: Implement the logic to save the question and options
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
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildAnswerField(String label, TextEditingController controller) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         labelText: 'Answer $label',
//         border: OutlineInputBorder(),
//         prefixIcon: Text(label),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class Option {
  final String optionText;
  final bool isCorrect;

  Option({required this.optionText, required this.isCorrect});
}

class Question {
  final String questionText;
  final List<Option> options;

  Question({required this.questionText, required this.options});
}

class AddNewQuestion extends StatefulWidget {
  @override
  _AddNewQuestionState createState() => _AddNewQuestionState();
}

class _AddNewQuestionState extends State<AddNewQuestion> {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController option1Controller = TextEditingController();
  final TextEditingController option2Controller = TextEditingController();
  final TextEditingController option3Controller = TextEditingController();
  final TextEditingController option4Controller = TextEditingController();
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
              controller: questionController,
              decoration: InputDecoration(
                labelText: 'Question',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: option1Controller,
              decoration: InputDecoration(
                labelText: 'First Answer',
                border: OutlineInputBorder(),
                prefixIcon: Text('a.'),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: option2Controller,
              decoration: InputDecoration(
                labelText: 'Second Answer',
                border: OutlineInputBorder(),
                prefixIcon: Text('b.'),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: option3Controller,
              decoration: InputDecoration(
                labelText: 'Third Answer',
                border: OutlineInputBorder(),
                prefixIcon: Text('c.'),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: option4Controller,
              decoration: InputDecoration(
                labelText: 'Fourth Answer',
                border: OutlineInputBorder(),
                prefixIcon: Text('d.'),
              ),
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
              onPressed: () {
                String questionText = questionController.text;
                String option1Text = option1Controller.text;
                String option2Text = option2Controller.text;
                String option3Text = option3Controller.text;
                String option4Text = option4Controller.text;
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
                  questions.add(newQuestion);
                });

                questionController.clear();
                option1Controller.clear();
                option2Controller.clear();
                option3Controller.clear();
                option4Controller.clear();
                selectedCorrectAnswer = null;
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



