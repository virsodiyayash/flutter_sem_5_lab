import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetView extends StatefulWidget {
  const BottomSheetView({super.key});

  @override
  State<BottomSheetView> createState() => _BottomSheetViewState();
}

class _BottomSheetViewState extends State<BottomSheetView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          Get.bottomSheet(
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white
              ),
              height: 300,
              width: double.infinity,
              child: Column(
                children: [
                  Text("Hello 1" , style: TextStyle(fontSize: 30),),
                  Text("Hello 1" , style: TextStyle(fontSize: 30),),
                  Text("Hello 1" , style: TextStyle(fontSize: 30),),
                  Text("Hello 1" , style: TextStyle(fontSize: 30),),
                  Text("Hello 1" , style: TextStyle(fontSize: 30),),
                ],
              ),
            ),
            // isDismissible: true,
            // elevation: 5,
            // isScrollControlled: true
          );
        }, child: Text("click for bottom sheet")),
      ),
    );
  }
}
