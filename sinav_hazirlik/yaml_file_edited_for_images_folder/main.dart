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
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text('Karşılama', style: TextStyle(fontWeight: FontWeight.bold, color:Colors.grey[500])),
        ),
        body: SafeArea(
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    child:Image.asset('assets/images/dusunce_bulutu.png')
                  ),
                  Container(
                    child:Image.asset('assets/images/konusma_balonu.png')
                  ),
                ],
              ),
            ),
            ),
        ),
      
    );
  }
}


