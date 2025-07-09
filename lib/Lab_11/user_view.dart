import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance_lab/Lab_11/user_controller.dart';
import 'package:get/get.dart';

void main(){
  runApp(MaterialApp(home: UserView(),));
}

class UserView extends StatelessWidget {
  UserView({super.key});

  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API DATA"),
        backgroundColor: Colors.blue,
      ),

      body: Column(
        children: [
          TextFormField(
            controller: userController.nameController,
            onChanged: (value) {
              userController.filterUser(value);
            },
            decoration: InputDecoration(
              hintText: "search what you want",
              labelText: "search what you want",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)
              )
            ),
          ),
          
          Obx(() {
            switch (userController.apiState.value){
              case ApiState.loading:
                return Center(child: CircularProgressIndicator(),);

              case ApiState.success:
                return Obx(() => Expanded(
                  child: ListView.builder(
                    itemCount: userController.filteredUser.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("${userController.filteredUser[index].name}"),
                        subtitle: Text("${userController.filteredUser[index].city}"),
                      );
                    },),
                ),);

              case ApiState.error:
                return Center(child: Text("Something went wrong, Try again"));

              case ApiState.idle:
                return Center(child: Text("Please wait...."),);
            }
          },),
        ],
      ),
    );
  }
}
