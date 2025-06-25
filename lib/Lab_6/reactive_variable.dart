import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance_lab/Lab_6/rective_variable_controller.dart';
import 'package:get/get.dart';

class ReactiveVariable extends StatelessWidget {
  ReactiveVariable({super.key});

  RectiveVariableController rectiveVariableController = RectiveVariableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reactive Variables"),
        backgroundColor: Colors.blue,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(() => Text("${rectiveVariableController.x.value}")),
          ElevatedButton(onPressed: (){
            rectiveVariableController.increment();
          }, child: Text("Increment"))
        ],
      ),
    );
  }
}
