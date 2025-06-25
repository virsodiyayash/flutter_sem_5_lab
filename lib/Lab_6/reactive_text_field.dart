import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance_lab/Lab_6/reactive_text_field_controller.dart';
import 'package:get/get.dart';

class ReactiveTextField extends StatelessWidget {
  ReactiveTextField({super.key});

  final ReactiveTextFieldController reactiveTextFieldController = ReactiveTextFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reactive Text Field"),
        backgroundColor: Colors.blue,
      ),

      body: Column(
          children: [
            TextField(
              onChanged: (val) => reactiveTextFieldController.text.value = val,
              decoration: InputDecoration(
                hintText: "Enter Name"
              ),
            ),

            SizedBox(height: 20,),
            
            Obx(() => Text("${reactiveTextFieldController.text.value}"),),
          ],
      ),
    );
  }
}
