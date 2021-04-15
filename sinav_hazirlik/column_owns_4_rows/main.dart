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
              crossAxisAlignment: CrossAxisAlignment.center,
              children : <Widget>[
                  Container( child: Row(
                      mainAxisAlignment : MainAxisAlignment.center, 
                      children: <Widget>[
                        Container(
                          width: 80,
                          height: 50,
                          color: Colors.grey[100],
                          child: Text( 'Container',  style: TextStyle(fontSize: 18), ),
                        ),
                        Container(
                          width: 80,
                          height: 50,
                          color: Colors.grey[100],
                          child: Text('Container', style:  TextStyle(fontSize: 18),),
                        ),
                      ]
                    ),
                  ),
                  
                  Container(
                    
                    child: Row( 
                      mainAxisAlignment : MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 80,
                          height: 50,
                          color: Colors.grey[100],
                          child: Text( 'Container',  style: TextStyle(fontSize: 18), ),
                        ),
                        Container(
                          width: 80,
                          height: 50,
                          color: Colors.grey[100],
                          child: Text('Container', style:  TextStyle(fontSize: 18),),
                        ),
                      ]
                  ),
                  ),
                  Container(
                    
                    child: Row(
                      mainAxisAlignment : MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 80,
                          height: 50,
                          color: Colors.grey[100],
                          child: Text( 'Container',  style: TextStyle(fontSize: 18), ),
                        ),
                        Container(
                          width: 80,
                          height: 50,
                          color: Colors.grey[100],
                          child: Text('Container', style:  TextStyle(fontSize: 18),),
                        ),
                        Container(
                    
                    child: Row(
                      mainAxisAlignment : MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 80,
                          height: 50,
                          color: Colors.grey[100],
                          child: Text( 'Container',  style: TextStyle(fontSize: 18), ),
                        ),
                        Container(
                          width: 80,
                          height: 50,
                          color: Colors.grey[100],
                          child: Text('Container', style:  TextStyle(fontSize: 18),),
                        ),
                      ]
                  ),
                  ),
                 
              ]
            ),

        ),
      ),
    );
  }
}


