import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance_lab/Lab_1/lab2.dart';
import 'package:flutter_advance_lab/Lab_2/controller/user_controller.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Data"),
        backgroundColor: Colors.blue,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 250,
            width: 500,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
               Colors.blue.shade400 , Colors.purple.shade400 , Colors.pink.shade400]),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(radius: 45, child: Icon(Icons.person , size: 40,),backgroundColor: Colors.white38,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                 color: Colors.white38,
                                  border: Border.all(color: Colors.white70)
                                ),
                                child: Icon(Icons.person , color: Colors.white70, size: 30,)),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Name : " , style: TextStyle(fontSize: 12 , color: Colors.white),),
                                Text("${UserController.user.name}" , style: TextStyle(fontSize: 18 , color: Colors.white70 , fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.white38,
                                    border: Border.all(color: Colors.white70)
                                ),
                                child: Icon(Icons.email , color: Colors.white70, size: 30,)),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Email : " , style: TextStyle(fontSize: 12 , color: Colors.white),),
                                Text("${UserController.user.email}" , style: TextStyle(fontSize: 18 , color: Colors.white70 , fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: Colors.white38,
                                    border: Border.all(color: Colors.white70)
                                ),
                                child: Icon(Icons.call , color: Colors.white70, size: 30,)),
                            SizedBox(width: 10,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Number : " , style: TextStyle(fontSize: 12 , color: Colors.white),),
                                Text("${UserController.user.number}" , style: TextStyle(fontSize: 18 , color: Colors.white70 , fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ),
          ),
        ),
      )
    );
  }
}
