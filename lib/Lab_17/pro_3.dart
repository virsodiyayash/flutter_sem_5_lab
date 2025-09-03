import 'package:flutter/material.dart';

class Pro3 extends StatelessWidget {
  const Pro3({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    final double padding = width > 1000 ? 80 : width > 700 ? 40 : 16;

    return Scaffold(
        appBar: AppBar(
          title: Text("Responsive UI With Padding"),
          backgroundColor: Colors.blue,
        ),

      body: Container(
        width: double.infinity,
        color: Colors.blue.shade100,
        padding: EdgeInsets.all(padding),
        child: Text(
          "Responsive Padding Example",
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
