import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance_lab/Lab_7/list_controller.dart';
import 'package:get/get.dart';

class ListViewDemo extends StatefulWidget {
  ListViewDemo({super.key});

  ListController controller = Get.put(ListController());

  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Crud With GetX"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: nameController,
          ),
          ElevatedButton(
              onPressed: () {
                widget.controller.usersList.add(nameController.text);
                nameController.clear();
              },
              child: Text("Submit")),
          Expanded(child: Obx(
            () {
              return ListView.builder(
                  itemCount: widget.controller.usersList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(widget.controller.usersList[index]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {

                              },
                              icon: Icon(Icons.favorite_border_outlined)),

                          IconButton(onPressed: () {
                            widget.controller.deleteUser(index);
                          }, icon: Icon(Icons.delete , color: Colors.red,))
                        ],
                      )
                    );
                  });
            },
          ))
        ],
      ),
    );
  }
}
