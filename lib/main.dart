import 'package:clima_tempo_app/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima Tempo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.white,
        primarySwatch: Colors.blue,
        fontFamily: "Heebo Regular",
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              fontFamily: "Heebo Regular",
              color: Colors.white),
          headline2: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
              fontFamily: "Heebo",
              color: Colors.white),
          headline3: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              fontFamily: "Heebo Regular",
              color: Colors.white),
          headline4: TextStyle(
              fontSize: 75.0,
              fontWeight: FontWeight.normal,
              fontFamily: "Heebo Regular",
              color: Colors.white),
          caption: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              fontFamily: "Heebo Regular",
              color: Colors.grey),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return _introScreen();
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 5,
        backgroundColor: Colors.lightBlueAccent,
        navigateAfterSeconds: HomePage(),
        loaderColor: Colors.transparent,
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/logo.png"),
            fit: BoxFit.none,
          ),
        ),
      ),
    ],
  );
}
