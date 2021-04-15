import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[600],
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children : <Widget>[
                  Container(
                    color: Colors.grey[100],
                    width: 300,
                    height: 100,
                    child: Text( '1. Container', 
					style: TextStyle(fontSize: 40), ),
                  ),
                 ]),),),);}}


