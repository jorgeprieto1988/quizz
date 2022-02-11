import 'package:ejercicio3/model/settings.dart';
import 'package:flutter/material.dart';
import 'package:ejercicio3/screens/question_screen.dart';

// This is the second screen, it allows the user to choose how many questions wants to answer and the difficulty
// This screen calls to question screen
class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreen createState() => _SettingsScreen();
}

class _SettingsScreen extends State<SettingsScreen> {
  //String dropdownnumberValue = '10';
  //String dropdowndificultyValue = 'medium';

  int numberQuestion = 10;
  String difficulty = "medium";
  int questionCounter = 0;
  int correctQuestions = 0;

  Settings settings = new Settings(
      numberQuestion: 10,
      difficulty: "medium",
      questionCounter: 1,
      correctQuestions: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Settings"),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Text(
                "Number of questions",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              DropdownButton<int>(
                value: numberQuestion,
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 4,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (int newValue) {
                  setState(() {
                    numberQuestion = newValue;
                  });
                },
                items: <int>[5, 10, 15, 20]
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(
                      value.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Difficulty",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              DropdownButton<String>(
                value: difficulty,
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 4,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String newValue) {
                  setState(() {
                    difficulty = newValue;
                  });
                },
                items: <String>['easy', 'medium', 'hard']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 50.0,
              ),
              ButtonTheme(
                minWidth: 200.0,
                height: 150.0,
                child: RaisedButton(
                  color: Colors.blue,
                  shape: CircleBorder(),
                  onPressed: () {
                    settings.setNumberQuestion(numberQuestion);
                    settings.setDifficulty(difficulty);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              QuestionScreen(settings: settings)),
                    );
                  },
                  child: Text(
                    'Play',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ])));
  }
}
