import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance_lab/Lab_6/timer_controller.dart';
import 'package:get/get.dart';

class TimerView extends StatelessWidget {
  TimerView({super.key});

  TimerController timerController = TimerController();

  @override
  Widget build(BuildContext context) {

    timerController.startTimer();

    return Scaffold(
      appBar: AppBar(
        title: Text("Timer Demo"),
        backgroundColor: Colors.blue,
      ),

      body: Center(
        child: Obx(() => Text("${timerController.remainingTimer.value}"),),
      ),
    );
  }
}
