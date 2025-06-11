import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance_lab/Lab_2/model/user_model.dart';
import 'package:flutter_advance_lab/Lab_3/crud_controller/user_controller.dart';

void main(){
  runApp(MaterialApp(home: CrudView(),));
}

class CrudView extends StatefulWidget {
  const CrudView({super.key});

  @override
  State<CrudView> createState() => _CrudViewState();
}

class _CrudViewState extends State<CrudView> {

  TextEditingController nameController = TextEditingController();
  UserCrudController _userController = UserCrudController();

  late UserModel temp;

  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Crud"),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Text("Name"),
              Expanded(
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "enter Your Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                  ),
                ),
              ),

              ElevatedButton(onPressed: (){
                if(isEdit){
                  print("Edit is true");
                  // nameController.text = temp.name!;
                  _userController.editUser(temp, UserModel(name: nameController.text.toString()));
                  isEdit = false;
                }
                else{
                  _userController.addUser(UserModel(name: nameController.text.toString()));
                }
                nameController.clear();

                setState(() {

                });
                // print(isEdit ? "Edit" : "Add");
              }, child: Text(isEdit ? "Edit" : "Add")),

              SizedBox(height: 10,),

              Expanded(
                child: ListView.builder(
                    itemCount: _userController.getUser.length,
                    itemBuilder: (BuildContext context , int index){
                    return ListTile(
                      title: Text("${_userController.getUser[index].name}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(onPressed: (){
                            _userController.deleteUser(_userController.getUser[index]);

                            setState(() {

                            });
                          }, icon: Icon(Icons.delete , color: Colors.red,)),

                          IconButton(onPressed: (){
                            temp = _userController.getUser[index];
                            isEdit = true;
                            nameController.text = temp.name!;
                            setState(() {

                            });
                            print("Edit is pressed");
                            print(isEdit);
                          }, icon: Icon(Icons.edit , color: Colors.blue,))

                        ],
                      ),
                    );
                }),
              )
            ],
          ),
      ),
    );
  }
}
