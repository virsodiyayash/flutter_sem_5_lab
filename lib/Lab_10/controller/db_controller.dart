import 'package:flutter_advance_lab/Lab_10/db/student_database.dart';
import 'package:flutter_advance_lab/Lab_10/model/student_model.dart';
import 'package:get/get.dart';

class DatabaseController extends GetxController{
  StudentDatabase _database = StudentDatabase();
  RxList<StudentModel> studentList = <StudentModel>[].obs;
  RxBool isEditView = false.obs;

  @override
  void onInit() {
    _database.initDatabase();
    super.onInit();
  }

  Future<void> fetchUsers() async{
    List<Map<String , dynamic>> data = await _database.fetchData();
    data.forEach((user) => studentList.add(StudentModel.fromMap(user)));
  }

  Future<void> insertUser(StudentModel student) async{
    await _database.addStudent(student);
  }

  Future<void> updateUser(StudentModel student , int id) async{
    await _database.updateStudent(student, id);
  }

  Future<void> deleteUser(int id) async{
    await _database.deleteUser(id);
  }

}