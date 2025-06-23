import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is Second Screen"),
          backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
            Get.toNamed("/dataScreen");
        }, child: Text("Navigate back to first screen")),
      ),
    );
  }
}
