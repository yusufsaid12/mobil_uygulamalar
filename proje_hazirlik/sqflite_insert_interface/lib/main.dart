import 'database_management.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';


void main() {
  runApp(SqfliteUygulamasi());
}

class SqfliteUygulamasi extends StatelessWidget{

  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'SQFLite Uygulaması',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sqflite'),
        ),
        body: TextButton(
          child: Text('insert', style: TextStyle(fontSize: 24),),
          onPressed: (){_insert(); },
        ),
      ), 
    );

  }



  _insert() async{

    Database db = await DatabaseManagement.instance.database;
    

    

   List<Map> result = await db.query('\"esyalar\"');
    result.forEach((row) => print(row));

  }

}