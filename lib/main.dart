import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Random random = new Random();

  var color = Colors.white;
  int index = 0;
  List greetings = ["Hey there", "Hello", "Greetings", "Hi 🙂", "Bonjour!"];
  void changeColor() {
    setState(() => color = Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255)));
  }
  void changeGreeting(){
    setState(() => index = random.nextInt(greetings.length));
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: color,
        appBar: AppBar(
          title: Text("Test Task"),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: Stack(
          children: [
            GestureDetector(
              onTap: () {
                changeColor();
              },
              onDoubleTap: () {
                changeGreeting();
              },
            ),
            Center(
              child: GestureDetector(
                child: Center(
                  child: Text(greetings[index]),
                ),
                onTap: () {
                  changeColor();
                },
                onDoubleTap: () {
                  changeGreeting();
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                child: Text("Current $color"),
                onTap: () {
                  changeColor();
                },
                onDoubleTap: () {
                    changeGreeting();
                },
              ),
            )
          ],
        )
      ),
    );
  }
}



