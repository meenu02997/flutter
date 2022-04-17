//cretate a singleton class because for whole lifecycle of flutter app we want only one instance of the database..
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{

  static final _dbName = 'myDatabase.db';
  static final _dbVersion = 1;
  static final _tableName = 'myTable';

  static final columnId ='_id';
  static final columnName = 'name';

  //makeing singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async{
    if(_database != null){
      return _database;
    }else{
      //if _database == null then create a new database.
      _database = await _initiateDatabase();
      return _database;
    }
  }

  //create a new directory, join new path and open dtabase,and created databse.
  _initiateDatabase() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,_dbName);
    //open the database.
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
    //database version.

  }

  //create a table
  Future _onCreate(Database db, int version){
    db.execute(
      '''
      CREATE TABLE $_tableName( 
      $columnId INTEGER PRIMARY KEY,
      $columnName TEXT NOT NULL )
      '''
    );
  }

  //insert operation.
 Future<int> insert(Map<String, dynamic> row) async{
    Database db = await instance.database;
    return await db.insert(_tableName, row);
 }

 //Query operation.
 Future<List<Map<String,dynamic>>> queryAll() async{
    Database db = await instance.database;
    return await db.query(_tableName);
 }

 //Update Operation.
 Future update(Map<String,dynamic> row) async{
   Database db = await instance.database;
   int id = row[columnId];
   return await db.update(_tableName, row,where: '$columnId = ? ', whereArgs: [id]);
 }

 //Delete operation.
 Future<int> delete(int id) async{
    Database db = await instance.database;
    return await db.delete(_tableName,where: '$columnId = ?', whereArgs: [id]);
 }



}