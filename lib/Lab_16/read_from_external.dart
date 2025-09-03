import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

void main() async{
  runApp(MaterialApp(home: ReadFromExternal(),));
}

class ReadFromExternal extends StatefulWidget {
  ReadFromExternal({super.key});

  @override
  State<ReadFromExternal> createState() => _ReadFromExternalState();
}

class _ReadFromExternalState extends State<ReadFromExternal> {

  String? path;
  RxString data = "".obs;

  Future<String?> getPath() async{
    Directory? dir = await getExternalStorageDirectory();
    return dir!.path;
  }

  Future<void> writeFile(String data) async{
    path = await getPath();
    if(path == null){
      print("Path is null");
    }

    else{
      File file = File("$path/test.txt");
      file.writeAsStringSync(data);
      print("Data is setted into the file : $data");
    }
  }

  void readDataFromFile() async{
    path = await getPath();

    if(path == null){
      print("Path is null");
    }
    else{
      File file = File("$path/test.txt");
      data.value = file.readAsStringSync();
      print("Data is : $data");
    }
  }

  TextEditingController dataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read from external"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: dataController,
          ),
          ElevatedButton(onPressed: () async{
            await writeFile(dataController.text);
          }, child: Text("Add to file")),

          SizedBox(height: 20,),

          Text(data.value)
        ],
      ),
    );
  }
}
