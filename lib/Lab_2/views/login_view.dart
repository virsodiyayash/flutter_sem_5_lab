import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: LoginView(),));
}

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LogIn Screen"),
        backgroundColor: Colors.blue,
      ),

      body: Form(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Name"),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
                )
              )
            ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Email"),
            ),
            TextField(
              controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                    )
                )
            ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Number"),
            ),
            TextField(
              controller: numberController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                    )
                )
            ),

            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Password"),
            ),
            TextField(
              controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                    )
                )
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Confirm Password"),
            ),
            TextField(
              controller: confirmPasswordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                    )
                )
            ),

            ElevatedButton(onPressed: (){
              if(_formKey.currentState!.validate()){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("User Login Successfully"))
                );
              }
            }, child: Text("Submit"),)
          ],
        ),
      ),
    );
  }
}

