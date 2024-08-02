import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDataBase {
  late Database db;

  Future open() async {
    var dbpath = await getDatabasesPath();
    String path = join(dbpath, 'tops.db');
    print(path);

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) {
      return db.execute('''
            
             CREATE TABLE IF NOT EXISTS students( 
                          id INTEGER PRIMARY KEY AUTOINCREMENT,
                          name varchar(255) not null,
                          number varchar(255) not null,
                          email varchar(255) not null,
                          sid varchar(255) not null
                      );
                      ''');
    });
  }
}
