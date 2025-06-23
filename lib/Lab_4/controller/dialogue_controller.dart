import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance_lab/Lab_4/model/dialogue_practice.dart';
import 'package:get/get.dart';

class DialogueController{

  void showDialogueBox(DialoguePractice dialogue){

    Get.defaultDialog(
      title: "Alert Dialog",
      middleText: "Are you sure you want to delete",
      textCancel: "Cancel",
        textConfirm: "confirm",
       onCancel: () => Get.back(),
      onConfirm: () => Get.back()
    );
  }

}