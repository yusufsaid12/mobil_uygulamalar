
import 'dart:io' show Directory;
import 'dart:io' show File;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;

import 'package:flutter/services.dart';

class DatabaseManagement {

  static final _databaseName = "varlik.db";


  // make this a singleton class
  DatabaseManagement._privateConstructor();
  static final DatabaseManagement instance = DatabaseManagement._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "working_db.db");
  
    ByteData data = await rootBundle.load(join("assets",_databaseName));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await new File(path).writeAsBytes(bytes);

    return await openDatabase(path);
  }

  
}