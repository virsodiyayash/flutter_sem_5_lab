import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInExample extends StatefulWidget {
  const GoogleSignInExample({super.key});

  @override
  State<GoogleSignInExample> createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignInExample> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  List users = [];
  bool isEdit = false;
  int? editId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  void getUsers() async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("users").get();
    users.clear();
    for(var user in querySnapshot.docs){
      users.add(user);
      print(user);
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google SignIn Example"),
        backgroundColor: Colors.blue,
      ),

      body: Column(
        children: [

          TextFormField(
            controller: nameController,
          ),

          TextFormField(
            controller: emailController,
          ),

          ElevatedButton(onPressed: () async {
            if(editId != null){
              Map<String , dynamic> user = {
                "name" : nameController.text,
                "email" : emailController.text
              };
              await FirebaseFirestore.instance.collection("users").doc(editId.toString()).update(user);
              getUsers();
            }
            else{
              Map<String , dynamic> user = {
                "name" : nameController.text,
                "email" : emailController.text
              };

              await FirebaseFirestore.instance.collection("users").add(user);
              getUsers();
              setState(() {

              });
            }
            nameController.clear();
            emailController.clear();
          }, child: Text("Sign In")),


          Expanded(child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(users[index].data()["name"]),
                subtitle: Text(users[index].data()["email"]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {
                      isEdit = true;
                      nameController.text = users[index].data()["name"];
                      emailController.text = users[index].data()["email"];
                      editId = users[index].id;

                      setState(() {

                      });
                    }, icon: Icon(Icons.edit)),

                    IconButton(onPressed: () async {
                      String id = users[index].id;
                      await FirebaseFirestore.instance.collection("users").doc(id.toString()).delete();
                      getUsers();
                    }, icon: Icon(Icons.delete)),
                  ],
                ),
              );
          },))
        ],
      ),
    );
  }
}
