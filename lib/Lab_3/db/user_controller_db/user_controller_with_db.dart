import 'package:sqflite/sqflite.dart';

import '../user_model_db/user_model.dart';
import 'package:path/path.dart' as path;

class UserControllerwithdb{

  final List<UserModelDB> _userList = [];

  late Database db;

  void initDatabase() async{
    var db = await openDatabase(
      path.join(await getDatabasesPath(), "person.db"),
      onCreate: (db , version){
        db.execute('''
        CREATE TABLE student(
          ID INT AUTOINCREMENT
        )
        ''');
      }
    );
  }

  get getUser => _userList;

  void addUser(UserModelDB user){
    _userList.add(user);
    print("User is added into the list");
  }

  void deleteUser(UserModelDB user){
    _userList.removeWhere((element) => element.name == user.name);
  }

  void editUser(UserModelDB oldUser , UserModelDB newUser){
    int index = _userList.indexWhere((element) => element.name == oldUser.name);
    _userList[index] = newUser;
  }

  void displayUser(){

  }
}