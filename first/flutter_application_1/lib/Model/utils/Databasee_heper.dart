import 'package:flutter_application_1/Model/note.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:meenu_mega_test/Models/note.dart';

class DatabaseHelper {
  //Note n = new Note('_title', '_date', '_priority', '_name', '_password', '_email', '_aadhar', '_telephoneno');
  static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper
  static Database _database; // Singleton Database

  String noteTable = 'note_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';
  String colPriority = 'priority';
  String colDate = 'date';
  String colName = 'name';
  String colEmail = 'email';
  String colPassword = 'password';
  String colAadhar = 'Aadhar';
  String telePhoneNo = 'telephone_no';

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db';

    // Open/create the database at a given path
    var notesDatabase = await openDatabase(path,
        version: 1, onOpen: (db) {}, onCreate: _createDb);
    return notesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colTitle TEXT,'
        ' $colDescription TEXT,$colPriority INTEGER,$colDate TEXT,$colName TEXT,$colEmail TEXT,$colPassword TEXT,$colAadhar TEXT,)');
  }

  // Fetch Operation: Get all note objects from database
  Future<List<Map<String, dynamic>>> getNoteMapList() async {
    Database db = await this.database;
    var result =
        await db.rawQuery('SELECT * FROM $noteTable order by $colId ASC');
    //var result = await db.query(noteTable, orderBy: '$colPriority ASC');
    return result;
  }

  // Insert Operation: Insert a Note object to database
  // insertNote(Note note) async {
  //   Database db = await this.database;
  //   //var result = await db.insert(noteTable, note.toMap());
  //   //var result = await db.rawQuery('SELECT * FROM noteTable');
  //   var result = await db.rawInsert(
  //       "INSERT INTO noteTable(id,title,description,priority,date, name, email,password,Aadhar,telephone_no)"" VALUES(${note.id},${note.title},${note.description},${note.priority},${note.date},${note.name},${note.email},${note.password},${note.Aadhar},${note.telephone_no})");
  //   return result;
  // }
  insertNote(Note note) async {
    Database db = await this.database;
    var result = await db.rawInsert(
        "INSERT INTO noteTable(title, description, priority, date, name, email, password, Aadhar, telephone_no)"
        " VALUES (${note.title},${note.description},${note.priority},${note.date},${note.email},${note.password},${note.Aadhar},${note.telephone_no})");
    return result;
  }
  // Future<int> insertNote(Map<String, dynamic> row) async
  // {
  //   Database db=await database;
  //   return await db.insert("noteTable", row);
  // }
  //query
  // Future<List> getCustomers() async {
  //   var db = await this.database;
  //   var result = await db.rawQuery('SELECT * FROM noteTable');
  //   return result.toList();
  // }

  // Update Operation: Update a Note object and save it to database
  // Future<int> updateNote(Note note) async {
  //   var db = await this.database;
  //   var result = await db.update(noteTable, note.toMap(), where: '$colId = ?', whereArgs: [note.id]);
  //   return result;
  // }

  // Delete Operation: Delete a Note object from database
  // Future<int> deleteNote(int id) async {
  //   var db = await this.database;
  //   int result = await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
  //   return result;
  // }
  //
  // // Get number of Note objects in database
  // Future<int> getCount() async {
  //   Database db = await this.database;
  //   List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $noteTable');
  //   int result = Sqflite.firstIntValue(x);
  //   return result;
  // }

  // Get the 'Map List' [ List<Map> ] and convert it to 'Note List' [ List<Note> ]
  Future<List<Note>> getNoteList() async {
    var noteMapList = await getNoteMapList(); // Get 'Map List' from database
    int count =
        noteMapList.length; // Count the number of map entries in db table

    // ignore: deprecated_member_use
    List<Note> noteList = List<Note>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      noteList.add(Note.fromMapObject(noteMapList[i]));
    }

    return noteList;
  }
}
