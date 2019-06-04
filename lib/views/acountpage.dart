import 'package:flutter/material.dart';
class AcountPage extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Acount"),
      ),
      body: new Center(
        child: new Text(
          "Acount",
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}