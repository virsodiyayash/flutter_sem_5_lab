import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarPractice extends StatefulWidget {
  const SnackbarPractice({super.key});

  @override
  State<SnackbarPractice> createState() => _SnackbarPracticeState();
}

class _SnackbarPracticeState extends State<SnackbarPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(onPressed: (){
            Get.snackbar(
                "Hello World",
                "You are in hello world model",
                icon: Icon(Icons.person , color: Colors.black54,),
              snackPosition: SnackPosition.BOTTOM,
              duration: Duration(milliseconds: 3000)
            );
          }, child: Text("Snackbar here")),
      ),
    );
  }
}
