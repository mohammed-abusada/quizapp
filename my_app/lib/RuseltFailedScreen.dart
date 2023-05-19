// // import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Homepage.dart';

class ResultFailedScreen extends StatelessWidget {
  final int score;
  ResultFailedScreen({Key? key, required this.score}) : super(key: key);

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
            Text("Oops!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 121, 109),
                )),
            SizedBox(height: 10),
            Image.network(
              "https://drive.google.com/file/d/16FgUf5Ts4F9rqMTtyEJ4V66Kj02_hE-l/view?usp=share_link",
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
            Text("Sorry,better luck next time!"),
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
