import 'dart:io';

import 'package:module5/model/data_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static DataBaseHelper? _dataBaseHelper;
  static Database? _database;

  String tableName = "todo_data";

  String colId = 'id';
  String colName = 'name';
  String colDesc = 'desc';
  String colDate = 'date';
  String colTime = 'time';
  String colPriority = 'priority';
  String colIsDone = 'isDone';

  DataBaseHelper._createInstance();

  factory DataBaseHelper() {
    if (_dataBaseHelper == null) {
      _dataBaseHelper = DataBaseHelper._createInstance();
    }
    return _dataBaseHelper!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'database.db';

    // Open/create the database at a given path
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: onCreate);
    return notesDatabase;
  }

  onCreate(Database db, int newVersion) async {
    await db.execute('''
            
             CREATE TABLE IF NOT EXISTS $tableName( 
                          $colId INTEGER PRIMARY KEY AUTOINCREMENT,
                          $colName varchar(255) not null,
                          $colDesc varchar(255) not null,
                          $colDate varchar(255) not null,
                          $colTime varchar(255) not null,
                          $colPriority int not null,
                          $colIsDone int not null
                      );
                      ''');
  }

  Future insertData(DataModel model) async {
    Database db = await database;
    var result = await db.insert(tableName, model.toMap());
    return result;
  }

  Future<List<Map<String, dynamic>>> showData() async {
    Database db = await database;
    return await db.query(tableName);
  }

  Future<int> deleteData(int id) async {
    Database db = await database;
    return await db.delete(tableName, where: '$colId = ?', whereArgs: [id]);
  }

  Future<int> updateData(DataModel dataModel) async {
    Database db = await database;

    return await db.update(
      tableName,
      dataModel.toMap(),
      where: 'id = ?',
      whereArgs: [dataModel.id],
    );
  }

  updateStatus(DataModel dataModel) async {
    Database db = await database;
    var value = dataModel.isDone;
    var id = dataModel.id;
    print("finaldata: $value and $id");
    int fs;
    if (value == true) {
      fs = 1;
    } else {
      fs = 0;
    }
    db.rawUpdate("update $tableName set isDone='$fs' where id=$id");
  }
}
