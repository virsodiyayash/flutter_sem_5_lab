import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

class PermissionMultiplePermission extends StatefulWidget {
  const PermissionMultiplePermission({super.key});

  @override
  State<PermissionMultiplePermission> createState() => _PermissionMultiplePermissionState();
}

class _PermissionMultiplePermissionState extends State<PermissionMultiplePermission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multiple Permission"),
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
          ),
          Center(
            child: ElevatedButton(onPressed: () async {
              final res = await Permission.location.request();

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
            }, child: Text("Location Permission")),
          ),
          Center(
            child: ElevatedButton(onPressed: () async {
              final res = await Permission.storage.request();

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
            }, child: Text("Storage access")),
          )
        ],
      ),
    );
  }
}
