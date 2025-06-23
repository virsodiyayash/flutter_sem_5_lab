import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance_lab/Lab_5/data_passed_screen.dart';
import 'package:flutter_advance_lab/Lab_5/second_screen.dart';
import 'package:get/get.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({super.key});
  String name = "yash";
  int age = 18;

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("this is First screen"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          Get.toNamed("second");
        }, child: Text("Navigate to Second screen")),
      ),
    );
  }
}
