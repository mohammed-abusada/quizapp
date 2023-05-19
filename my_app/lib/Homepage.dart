// import 'package:flutter/material.dart';

// import 'CreateQuizScreen.dart';
// import 'StartQuizScreen.dart';

// class Homepage extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Quiz app"),
//         backgroundColor:Color.fromARGB(255, 0, 121, 109)
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             UserAccountsDrawerHeader(
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 0, 121, 109),
//               ),
//               accountName: Text('Mohammed Hazem AL-Shawwa'),
//               accountEmail: Text('mohammedshawa@gmail.com'),
//               currentAccountPicture: CircleAvatar(
//                 child: Text('M'),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.create),
//               title: Text('Create Quiz'),
//               onTap: () {
//                 // Navigate to create quiz screen
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => CreateQuizScreen()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.play_arrow),
//               title: Text('Start Quiz'),
//               onTap: () {
//                 // Navigate to start quiz screen
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => StartQuizScreen()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.exit_to_app),
//               title: Text('Exit'),
//               onTap: () {

//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// import 'CreateQuizScreen.dart';
// import 'StartQuizScreen.dart';

// class Homepage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Quiz app"),
//         backgroundColor: Color.fromARGB(255, 0, 121, 109),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             UserAccountsDrawerHeader(
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 0, 121, 109),
//               ),
//               accountName: Text('Mohammed Hazem AL-Shawwa'),
//               accountEmail: Text('mohammedshawa@gmail.com'),
//               currentAccountPicture: CircleAvatar(
//                 child: Text('M'),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.create),
//               title: Text('Create Quiz'),
//               onTap: () {
//                 // Navigate to create quiz screen
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => CreateQuizScreen()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.play_arrow),
//               title: Text('Start Quiz'),
//               onTap: () {
//                 // Navigate to start quiz screen
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => StartQuizScreen()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.exit_to_app),
//               title: Text('Exit'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.network(
//               "https://drive.google.com/uc?export=view&id=1__tkPTOt9u13x8dmOY0DSgM1roT6Gcvq",
//               width: 400,
//               height: 400,
//               fit: BoxFit.fill,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// import 'CreateQuizScreen.dart';
// import 'StartQuizScreen.dart';

// class Homepage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Quiz app"),
//         backgroundColor: Color.fromARGB(255, 0, 121, 109),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             UserAccountsDrawerHeader(
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 0, 121, 109),
//               ),
//               accountName: Text('Mohammed Hazem AL-Shawwa'),
//               accountEmail: Text('mohammedshawa@gmail.com'),
//               currentAccountPicture: CircleAvatar(
//                 child: Text('M'),
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.create),
//               title: Text('Create Quiz'),
//               onTap: () {
//                 // Navigate to create quiz screen
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => CreateQuizScreen()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.play_arrow),
//               title: Text('Start Quiz'),
//               onTap: () {
//                 // Navigate to start quiz screen
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => StartQuizScreen()),
//                 );
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.exit_to_app),
//               title: Text('Exit'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.network(
//               "https://drive.google.com/uc?export=view&id=1__tkPTOt9u13x8dmOY0DSgM1roT6Gcvq",
//               width: 400,
//               height: 400,
//               fit: BoxFit.fill,
//             ),
//             ElevatedButton(

//               onPressed: () {
//                 // Navigate to start quiz screen
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => StartQuizScreen()),
//                 );
//               },
//               child: Text("Let's Start!"),

//             ),
//           ],
//         ),
//       ),
//     );
//   }
//}
import 'package:flutter/material.dart';
import 'package:my_app/ErorrStartQuiz.dart';
import 'package:my_app/database_helper.dart';

import 'CreateQuizScreen.dart';
import 'StartQuizScreen.dart';
import 'models.dart';

class Homepage extends StatelessWidget {
  DatabaseHelper instance = DatabaseHelper();

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
                title: Text("Quiz app"),
                backgroundColor: Color.fromARGB(255, 0, 121, 109),
              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 121, 109),
                      ),
                      accountName: Text('Mohammed Hazem AL-Shawwa'),
                      accountEmail: Text('mohammedshawa@gmail.com'),
                      currentAccountPicture: CircleAvatar(
                        child: Text('M'),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.create),
                      title: Text('Create Quiz'),
                      onTap: () {
                        // Navigate to create quiz screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateQuizScreen()),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.play_arrow),
                      title: Text('Start Quiz'),
                      onTap: () {
                        if (questions.length > 4) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StartQuizScreen()),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ErrorStartQuiz()),
                          );
                        }
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text('Exit'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      "https://drive.google.com/uc?export=view&id=1__tkPTOt9u13x8dmOY0DSgM1roT6Gcvq",
                      width: 400,
                      height: 400,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StartQuizScreen()),
                        );
                      },
                      child: Text(
                        "Let's Start!",
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
        });
  }
}
