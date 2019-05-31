import 'package:flutter/material.dart';
class ScrollVideoPage extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ScrollVideo"),
      ),
      body: new Center(
        child: new Text(
          "ScrollVideo",
          style: new TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}