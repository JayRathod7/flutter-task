import 'dart:io';

import 'package:notbook/model/note_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static DataBaseHelper? _dataBaseHelper;
  static Database? _database;

  //table name
  String tableName = "note_data";

  //table columName
  static const colId = 'id';
  static const colTitle = 'title';
  static const colBody = 'body';
  static const colFontSize = 'fontSize';
  static const colIsBold = 'bold';
  static const colIsItalic = 'italic';
  static const colIsUnderLine = 'underline';
  static const colColor = 'color';
  static const colFonts = 'fontStyle';
  static const colNoteSaveDate = 'noteSaveDate';
  static const columnProfile = 'img';
  static const columnisSelected = 'selected';

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
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}database.db';

    // Open/create the database at a given path
    var notesDatabase =
        await openDatabase(path, version: 1, onCreate: onCreate);
    return notesDatabase;
  }

  onCreate(Database db, int newVersion) async {
    await db.execute('''
            
             CREATE TABLE IF NOT EXISTS $tableName( 
                          $colId INTEGER PRIMARY KEY AUTOINCREMENT,
                          $colTitle varchar(255) not null,
                          $colBody varchar(255) not null,
                          $colFontSize INTEGER not null,
                          $colIsBold BOOL not null,
                          $colIsItalic BOOL not null,
                          $colIsUnderLine BOOL not null,
                          $colColor INTEGER not null,
                          $colFonts varchar(255) not null,
                          $colNoteSaveDate varchar(255) not null,
                          $columnProfile TEXT,
                          $columnisSelected int
                      );
                      ''');
  }

  Future insertData(NoteModel model) async {
    Database db = await database;
    var result = await db.insert(tableName, model.toJson());
    return result;
  }

  Future<List<Map<String, dynamic>>> showData() async {
    Database db = await database;
    return db
        .rawQuery("select * from $tableName order by $colNoteSaveDate desc");
  }

  Future<int> deleteData(int id) async {
    Database db = await database;
    return await db.delete(tableName, where: '$colId = ?', whereArgs: [id]);
  }

  Future<int> updateData(NoteModel noteModel) async {
    Database db = await database;
    return await db.update(
      tableName,
      noteModel.toJson(),
      where: 'id = ?',
      whereArgs: [noteModel.id],
    );
  }
}
