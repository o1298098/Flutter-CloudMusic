import 'package:flutter/material.dart';
class UserPage extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("User"),
      ),
      body: new Center(
        child: new Text(
          "User",
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}