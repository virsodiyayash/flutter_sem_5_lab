import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance_lab/Lab_10/controller/db_controller.dart';
import 'package:flutter_advance_lab/Lab_10/model/student_model.dart';

class AddEditView extends StatelessWidget {
  AddEditView({super.key});

  DatabaseController _databaseController = DatabaseController();
  int id = 0;

  @override
  Widget build(BuildContext context) {

    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController enrollmentController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Edit View"),
        backgroundColor: Colors.blue,
      ),

      body: Expanded(
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter Name",
                labelText: "Enter Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)
                )
              ),
            ),

            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: "Enter Email",
                  labelText: "Enter Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                  )
              ),
            ),

            TextFormField(
              controller: enrollmentController,
              decoration: InputDecoration(
                  hintText: "Enter Enrollment",
                  labelText: "Enter Enrollment",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)
                  )
              ),
            ),

            ElevatedButton(onPressed: () {
                if(_databaseController.isEditView.value){
                  _databaseController.updateUser(
                      StudentModel(
                          name: nameController.text,
                          enrollment: enrollmentController.text,
                          email: emailController.text), id);

                  nameController.clear();
                  emailController.clear();
                  enrollmentController.clear();
                }
                else{
                  _databaseController.insertUser(
                      StudentModel(
                          name: nameController.text,
                          enrollment: enrollmentController.text,
                          email: emailController.text));

                  nameController.clear();
                  emailController.clear();
                  enrollmentController.clear();
                }

            }, child: Text(_databaseController.isEditView.value ? "Update Data" : "Add User")),

            SizedBox(height: 20,),

            Expanded(
              child: ListView.builder(
                itemCount: _databaseController.studentList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${_databaseController.studentList[index].name}"),
                    subtitle: Text("email : ${_databaseController.studentList[index].email} | enrollment : ${_databaseController.studentList[index].enrollment}"),
                    trailing: Row(
                      children: [
                        IconButton(onPressed: () {
                          id = _databaseController.studentList[index].id!;
                        }, icon: Icon(Icons.edit_outlined)),

                        IconButton(onPressed: () async{
                          await _databaseController.deleteUser(index);
                        }, icon: Icon(Icons.delete))
                      ],
                    ),
                  );
              },),
            )
          ],
        ),
      ),
    );
  }
}
