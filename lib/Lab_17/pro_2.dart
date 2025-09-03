import 'package:flutter/material.dart';

class Pro2 extends StatelessWidget {
  const Pro2({super.key});

  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;

    final bool isWeb = width > 700;

    return Scaffold(
      appBar: AppBar(
        title: Text("Responsive UI"),
        backgroundColor: Colors.blue,
      ),

      backgroundColor: isWeb ? Colors.grey : Colors.white,

      body: Center(
        child: Text(
          isWeb ? "WEB" : "MOBILE",
          style: TextStyle(
            fontSize: isWeb ? 32 : 24,
            fontWeight: FontWeight.bold,
            color: isWeb ? Colors.white : Colors.black
          ),
        ),
      ),
    );
  }
}
