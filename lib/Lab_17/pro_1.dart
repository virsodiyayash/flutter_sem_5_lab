import 'package:flutter/material.dart';

class Pro1 extends StatelessWidget {
  const Pro1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Height & Width"),
        backgroundColor: Colors.blue,
      ),

      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .6,
            width: MediaQuery.of(context).size.width * 0.6,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
