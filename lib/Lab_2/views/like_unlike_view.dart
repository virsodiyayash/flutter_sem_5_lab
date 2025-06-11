import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance_lab/Lab_2/controller/like_unlike_controller.dart';

void main(){
  runApp(MaterialApp(home: LikeUnlike(),));
}

class LikeUnlike extends StatefulWidget {
  LikeUnlike({super.key});

  @override
  State<LikeUnlike> createState() => _LikeUnlikeState();
}

class _LikeUnlikeState extends State<LikeUnlike> {
  LikeUnlikeController likeUnlikeController = LikeUnlikeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello World"),
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                  child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: likeUnlikeController.users.length,
                      itemBuilder: (context, index) {

                      return ListTile(
                        title: Text(likeUnlikeController.users[index]["name"]),
                        trailing: IconButton(onPressed: (){

                          setState(() {
                            likeUnlikeController.favouriteUser(!likeUnlikeController.users[index]["isFav"], likeUnlikeController.users[index]["name"]);
                          });

                        }, icon: Icon(likeUnlikeController.users[index]["isFav"] ? Icons.favorite : Icons.favorite_border)),
                      );

                      },
                      ))
            ],
          ),
        ));
  }
}
