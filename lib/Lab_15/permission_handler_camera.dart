import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerCamera extends StatefulWidget {
  const PermissionHandlerCamera({super.key});

  @override
  State<PermissionHandlerCamera> createState() => _PermissionHandlerCameraState();
}

class _PermissionHandlerCameraState extends State<PermissionHandlerCamera> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera permission handler"),
        backgroundColor: Colors.blue,
      ),

      body: Column(
        children: [
          Center(
            child: ElevatedButton(onPressed: () async {
              final res = await Permission.camera.request();

              if(res.isGranted){
                Get.snackbar("Permission Granted",
                    "You have granted the permission of camera" ,
                    snackPosition: SnackPosition.BOTTOM);
              }

              else{
                Get.snackbar("Permission Denied",
                    "You have denied the permission of camera" ,
                    snackPosition: SnackPosition.BOTTOM);
              }
            }, child: Text("Camera permission")),
          )
        ],
      ),
    );
  }
}
