import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionLocation extends StatefulWidget {
  const PermissionLocation({super.key});

  @override
  State<PermissionLocation> createState() => _PermissionLocationState();
}

class _PermissionLocationState extends State<PermissionLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Permission"),
        backgroundColor: Colors.blue,
      ),

      body: Column(
        children: [
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
          )
        ],
      ),
    );
  }
}
