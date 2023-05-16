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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                prefixIcon: Icon(Icons.question_answer),
              ),
            ),
            SizedBox(height: 16.0),
            buildAnswerField('a', option1Controller),
            SizedBox(height: 16.0),
            buildAnswerField('b', option2Controller),
            SizedBox(height: 16.0),
            buildAnswerField('c', option3Controller),
            SizedBox(height: 16.0),
            buildAnswerField('d', option4Controller),
            SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: selectedCorrectAnswer,
              onChanged: (value) {
                setState(() {
                  selectedCorrectAnswer = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Correct Answer',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.check),
              ),
              items: ['a', 'b', 'c', 'd'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Perform the logic to save the question and options
                String questionText = questionController.text;
                String option1Text = option1Controller.text;
                String option2Text = option2Controller.text;
                String option3Text = option3Controller.text;
                String option4Text = option4Controller.text;

                String correctAnswer = selectedCorrectAnswer ?? '';

                // TODO: Implement the logic to save the question and options
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
          ],
        ),
      ),
    );
  }

  Widget buildAnswerField(String label, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'Answer $label',
        border: OutlineInputBorder(),
        prefixIcon: Text(label),
      ),
    );
  }
}
