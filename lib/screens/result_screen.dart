import 'package:ejercicio3/main.dart';
import 'package:ejercicio3/model/settings.dart';
import 'package:flutter/material.dart';
import 'package:ejercicio3/widgets/question_widget.dart';

//Last screen of the api, it shows the results of the game and allows the user to go back to the main menu
class ResultScreen extends StatelessWidget {
  final Settings settings;
  ResultScreen({Key key, @required this.settings}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Results'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              Text(
                "End of game",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              Text(
                "You got " +
                    settings.getcorrectQuestions().toString() +
                    " of " +
                    settings.getNumberQuestion().toString() +
                    " questions correct.",
                style: TextStyle(
                  fontSize: 20,
                ),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ));
                  },
                  child: Text(
                    'Go to Main Menu',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
