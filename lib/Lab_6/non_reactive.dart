import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance_lab/Lab_6/non_reactive_controller.dart';

class NonReactive extends StatelessWidget {
  NonReactive({super.key});

  final NonReactiveController nonReactiveController = NonReactiveController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Non reactive"),
        backgroundColor: Colors.blue,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("${nonReactiveController.x}"),
          ElevatedButton(onPressed: (){
            nonReactiveController.increment();
          }, child: Text("Increment"))
        ],
      ),
    );
  }
}
