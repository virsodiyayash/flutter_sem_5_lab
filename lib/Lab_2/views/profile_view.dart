import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance_lab/Lab_2/controller/profile_controller.dart';
import 'package:flutter_advance_lab/Lab_2/controller/user_controller.dart';
import 'package:flutter_advance_lab/Lab_2/views/user_view.dart';

void main(){
  runApp(MaterialApp(home: ProfileView(),));
}

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  final ProfileController _profileController = ProfileController();
  final UserController _userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile View"),
          backgroundColor: Colors.blue,
        ),

      body: Form(
        key: _formKey,
        child: Column(
          children: [

            SizedBox(height: 5,),

            TextFormField(
              controller: nameController,
              validator: _profileController.validateName,
              decoration: InputDecoration(
                  hintText: "Enter Name",
                label: Text("Enter Name"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
                )
              ),
            ),

            SizedBox(height: 5,),

            TextFormField(
              controller: emailController,
              validator: _profileController.validateEmail,
              decoration: InputDecoration(
                  hintText: "Enter Email",
                  label: Text("Enter Email"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                  )
              ),
            ),

            SizedBox(height: 5,),

            TextFormField(
              controller: numberController,
              validator: _profileController.validateNumber,
              decoration: InputDecoration(
                hintText: "Enter Phone Number",
                  label: Text("Enter Phone Number"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                  )
              ),
            ),

            ElevatedButton(onPressed: (){

              print(numberController.text);
              print(nameController.text);
              print(emailController.text);

              if(!_formKey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Something Went Wrong"))
                );
              }
              else{
                _userController.setDetails(nameController.text,
                    emailController.text, numberController.text);

                print("Move to the amnotehr em,klnalkdm");

                Navigator.push(context, MaterialPageRoute(builder: (context) => UserView()));
              }

            }, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
