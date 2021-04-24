import 'package:flutter/material.dart';
import 'dart:io' show Directory;
import 'dart:io' show File;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;

import 'package:flutter/services.dart';


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


  _open() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "working_db.db");
  
    ByteData data = await rootBundle.load(join("assets","veritabani.db"));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await new File(path).writeAsBytes(bytes);

    Database db = await openDatabase(path);
    return db;
  }

  _insert() async{

    Database db = _open();

    Map<String, dynamic> row = {
      '\"tur\"' : '\"hediyelik\"',
      '\"adi\"' : '\"çiçekli çerçeve\"',
      '\"yeri\"' : '\"çalışma masası\"',
    };

  await db.insert('\"esyalar\"', row);

   List<Map> result = await db.query('\"esyalar\"');
    result.forEach((row) => print(row));

  }

}