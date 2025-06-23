import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance_lab/Lab_4/controller/dialogue_controller.dart';
import 'package:flutter_advance_lab/Lab_4/model/dialogue_practice.dart';

class DialogueView extends StatefulWidget {
  const DialogueView({super.key});

  @override
  State<DialogueView> createState() => _DialogueViewState();
}

class _DialogueViewState extends State<DialogueView> {

  DialogueController dialogueController = DialogueController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
                dialogueController.showDialogueBox(DialoguePractice(title: "Hello", message: "Are you sure you want to delete"));
              }, child: Text("Dialogue Box")),

      ),
    );
  }
}
