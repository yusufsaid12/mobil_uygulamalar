import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class BenimUygulamam extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[600],
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text('Karşılama', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.grey[500])),
        ),
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


