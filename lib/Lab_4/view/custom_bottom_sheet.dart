import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () async{
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

            await Future.delayed(Duration(milliseconds: 3000) , () => {
            if(Get.isBottomSheetOpen!){
              Get.back()
            }
            });

        }, child: Text("click for bottom sheet")),
      ),
    );
  }
}
