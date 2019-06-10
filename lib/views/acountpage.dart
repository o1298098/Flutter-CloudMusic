import 'package:cloudmusic/actions/Adapt.dart';
import 'package:flutter/material.dart';

class AcountPage extends StatefulWidget {
  @override
  AcountPageState createState() => new AcountPageState();
}

class AcountPageState extends State<AcountPage> {
  bool showtitle=false;
  ScrollController scrollController=new ScrollController();
  @override
  void initState() {
    scrollController.addListener((){
       bool isscroll = scrollController.position.pixels >20.0;
       setState(() {
         showtitle=isscroll;
       });
    });
    super.initState();
  }
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          children: <Widget>[
            IconButton(
              iconSize: Adapt.px(60),
              icon: Icon(
                Icons.center_focus_weak,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
            Expanded(
              child: Center(child:  Text(showtitle?'账号':'', style: TextStyle(color: Colors.black)),),
            ),
            IconButton(
              iconSize: Adapt.px(60),
              icon: Icon(
                Icons.graphic_eq,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Container(
        child: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            SliverToBoxAdapter(child: Container(
              child: Row(),
            ),),
          ],
        )
      ),
    );
  }
}
