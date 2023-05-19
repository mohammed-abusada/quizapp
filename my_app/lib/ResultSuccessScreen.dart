// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Homepage.dart';

class ResultSuccessScreen extends StatelessWidget {
  final int score;
  ResultSuccessScreen({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz app"),
        backgroundColor: Color.fromARGB(255, 0, 121, 109),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Congratulations!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 121, 109),
                )),
            SizedBox(height: 10),
            Image.network(
              "https://drive.google.com/file/d/1OwQOpZcdqX-8_BkdrJsll8iqYSpxg4mq/view?usp=share_link",
              width: 400,
              height: 400,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 10),
            Text("Your Score $score / 10",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                )),
            Text("Keep up the good work!"),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
              },
              child: Text(
                "Back to home",
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
}
