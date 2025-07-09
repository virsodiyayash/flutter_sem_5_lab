import 'package:flutter_advance_lab/Lab_10/model/student_model.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class StudentDatabase{
  late Database _database;

  Future<Database> initDatabase() async{
    _database = await openDatabase(
      path.join(await getDatabasesPath() , "student_database.db"),
      version: 1,
      onCreate: (db , version){
        db.execute('''
          CREATE TABLE STUDENT(
          STU_ID INTEGER PRIMARY KEY AUTOINCREMENT,
          NAME TEXT,
          ENROLLMENT TEXT,
          EMAIL TEXT,
          )
        ''');
      }
    );

    return _database;
  }

  Future<List<Map<String , dynamic>>> fetchData() async{
     var data = await _database.query("STUDENT");
     return data;
  }

  Future<void> deleteUser(int id) async{
    await _database.delete(
        "STUDENT",
        where: 'id = ?',
        whereArgs: [id]
    );
  }

  Future<void> addStudent(StudentModel student) async{
    await _database.insert("STUDENT", student.toMap());
  }

  Future<void> updateStudent(StudentModel student , int id) async{
    await _database.update(
      "STUDENT",
      student.toMap(),
      where: 'id = ?',
      whereArgs: [id]
    );
  }
}