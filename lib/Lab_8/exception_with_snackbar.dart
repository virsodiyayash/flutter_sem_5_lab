import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(GetMaterialApp(home: ExceptionWithSnackbar(),));
}

class ExceptionWithSnackbar extends StatefulWidget {
  const ExceptionWithSnackbar({super.key});

  @override
  State<ExceptionWithSnackbar> createState() => _ExceptionWithSnackbarState();
}

class _ExceptionWithSnackbarState extends State<ExceptionWithSnackbar> {

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exception with Snackbar"),
        backgroundColor: Colors.blue,
      ),

      body: Column(
        children: [
          TextFormField(
            controller: nameController,
          ),

          ElevatedButton(onPressed: () {
            try{
              int a = int.parse(nameController.text);
              print("The value of a is : $a");
            }
            on FormatException{
              Get.snackbar("Format Exception", "Please enter the valid format of text");
            }
            catch(e){
              Get.snackbar("Error detected", "$e");
            }
          }, child: Text("Format"))
        ],
      ),
    );
  }
}
