import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
class MyDatabase{
  static final columnName="Name";
  static final columnEmail="email";
  static final columnPass="password";
  static final columnCPass="confirmPass";
  static final columnId="id";
  static Database _database;
  //static Database? database1;
  //static final MyDatabase db=MyDatabase.data1();
  MyDatabase._privateConstructor();
  static final MyDatabase instance = MyDatabase._privateConstructor();


  MyDatabase.data1();
  Future<Database> get database async {
    if(_database!=null) return _database;
    _database=await initDB();
    return _database;
  }
  initDB() async{
    Directory documentDir=await getApplicationDocumentsDirectory();
    final path=join(documentDir.path,"Test.db");
    return await openDatabase(path,version: 1,onOpen: (db){},
        onCreate: (Database db,int version)async{
          await db.execute('''
      create table MyTable1(
      ${columnId} INTEGER PRIMARY KEY,
      ${columnName} TEXT,
      ${columnEmail} TEXT,
      ${columnPass} VARCHAR,
      ${columnCPass} TEXT
      )
      ''');
        }
    );
  }
  Future<int> insert(Map<String, dynamic> row) async
  {
    Database db=await database;
    return await db.insert("MyTable1", row);
  }


  Future<List<Map<String,dynamic>>> queryAll() async{
    Database db=await database;
    return db.rawQuery("SELECT * FROM MyTable1 ");
    // return db.query(_tableName);
  }

}