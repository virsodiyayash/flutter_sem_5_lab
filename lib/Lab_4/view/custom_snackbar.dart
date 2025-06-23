import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar extends StatefulWidget {
  const CustomSnackbar({super.key});

  @override
  State<CustomSnackbar> createState() => _CustomSnackbarState();
}

class _CustomSnackbarState extends State<CustomSnackbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          Get.snackbar(
              "Vakanda", "Welcome , You are in vakanda World",
              icon: Icon(Icons.person , color: Colors.black54,),
              isDismissible: true,
              duration: Duration(milliseconds: 3000),
              backgroundColor: Colors.grey,
              snackPosition: SnackPosition.BOTTOM,
              animationDuration: Duration(milliseconds: 2000),
              barBlur: 10,
          );
        }, child: Text("Vakanda here")),
      ),
    );
  }
}
