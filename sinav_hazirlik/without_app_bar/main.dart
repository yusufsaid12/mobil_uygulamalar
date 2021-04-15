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
              children : <Widget>[
                  Container(
                    child:Text('Merhaba Flutter!', style: TextStyle(fontSize:40)),
                  ),  
                ]
            ),
        ),
      ),
    );
  }
}


