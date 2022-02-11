import 'package:ejercicio3/screens/settings_screen.dart';
import 'package:flutter/material.dart';

// This is the main page that shows the first screen of the app (a trivia game)
// This screen calls settings screen
//This app uses https://opentdb.com/ API
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('True or False'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
              RichText(
                text: TextSpan(
                  text: "True",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.green,
                    fontSize: 30.0,
                  ),
                  children: [
                    TextSpan(
                      text: "or",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black,
                        fontSize: 30.0,
                      ),
                    ),
                    TextSpan(
                      text: "False",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.red,
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
              Text("A Trivia game of True or False questions"),
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
                          builder: (context) => SettingsScreen(),
                        ));
                  },
                  child: Text(
                    'Start Game',
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
