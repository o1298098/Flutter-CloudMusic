import 'package:cloudmusic/actions/Adapt.dart';
import 'package:cloudmusic/models/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class UserPage extends StatefulWidget {
  @override
  UserPageState createState()=>new UserPageState();
}

class UserPageState extends State<UserPage>{
  List<Item> buttonitem=new List<Item>()
  ..add(Item('私人FM','images/ic_fm_w.png'))
  ..add(Item('最新电音','images/ic_ball_w.png'))
  ..add(Item('Sati空间','images/ic_addmoon_w.png'))
  ..add(Item('私藏推荐','images/ic_barheart_w.png'))
  ..add(Item('亲子频道','images/ic_kidchannel_w.png'))
  ..add(Item('古典专区','images/ic_piano_w.png'))
  ..add(Item('跑步FM','images/ic_runman_w.png'))
  ..add(Item('小冰电台','images/ic_ice_w.png'))
  ..add(Item('爵士电台','images/ic_jazz_w.png'))
  ..add(Item('驾驶模式','images/ic_car_w.png'));
  Widget buildCricleButton(Item item){
    return Padding(
      padding: EdgeInsets.only(left: Adapt.px(35),right: Adapt.px(35)),
      child: Column(
      children: <Widget>[
        Container(
          width: Adapt.px(80),
          height: Adapt.px(80),
          child:  IconButton(
          color: Colors.red,
          icon: Image.asset(item.value,fit: BoxFit.cover),
          onPressed: (){},
        ),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Adapt.px(40)),
          color: Colors.red,
        ),),
        SizedBox(height: Adapt.px(20),),
        Text(item.name,style: TextStyle(color: Colors.black,fontSize: Adapt.px(25)),)
      ],
    ),
    ) ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text('我的音乐',style:TextStyle(color: Colors.black)),
      ),
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child:Container(
                padding: EdgeInsets.only(top:Adapt.px(20),bottom:Adapt.px(20) ),
                height: Adapt.px(190),
                child: ListView(
                scrollDirection: Axis.horizontal,
                children:buttonitem.map(buildCricleButton).toList(),
              ) ,) ,
            ),
            SliverToBoxAdapter(
              child: Container(color: Colors.grey[300],height: 1,),
            ),
            SliverToBoxAdapter(
              child:Column(
                children: <Widget>[
                  Row(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left:Adapt.px(40),right: Adapt.px(40),top: Adapt.px(25),bottom: Adapt.px(25)),
                    child: Image.asset('images/ic_musicb_b.png',width: Adapt.px(60),),
                  ),
                  Text('本地音乐',style: TextStyle(color:Colors.black,fontSize: Adapt.px(35)),),
                  Expanded(child: Container(),),
                  Text('0',style:TextStyle(color: Colors.grey[600],fontSize: Adapt.px(30))),
                  Icon(Icons.navigate_next,color: Colors.grey[300],),
                  SizedBox(width: Adapt.px(20),)
                  ],),
                  Container(color:Colors.grey[300],height: 1,margin: EdgeInsets.only(left: Adapt.px(140)),),
                  Row(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left:Adapt.px(40),right: Adapt.px(40),top: Adapt.px(25),bottom: Adapt.px(25)),
                    child: Image.asset('images/ic_playwbar_b.png',width: Adapt.px(60),),
                  ),
                  Text('最近播放',style: TextStyle(color:Colors.black,fontSize: Adapt.px(35)),),
                  Expanded(child: Container(),),
                  Text('0',style:TextStyle(color: Colors.grey[600],fontSize: Adapt.px(30))),
                  Icon(Icons.navigate_next,color: Colors.grey[300],),
                  SizedBox(width: Adapt.px(20),)
                  ],),
                  Container(color:Colors.grey[300],height: 1,margin: EdgeInsets.only(left: Adapt.px(140)),),
                  Row(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left:Adapt.px(40),right: Adapt.px(40),top: Adapt.px(25),bottom: Adapt.px(25)),
                    child: Image.asset('images/ic_circlemuscib_b.png',width: Adapt.px(60),),
                  ),
                  Text('我的电台',style: TextStyle(color:Colors.black,fontSize: Adapt.px(35)),),
                  Expanded(child: Container(),),
                  Text('0',style:TextStyle(color: Colors.grey[600],fontSize: Adapt.px(30))),
                  Icon(Icons.navigate_next,color: Colors.grey[300],),
                  SizedBox(width: Adapt.px(20),)
                  ],),
                  Container(color:Colors.grey[300],height: 1,margin: EdgeInsets.only(left: Adapt.px(140)),),
                  Row(children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left:Adapt.px(40),right: Adapt.px(40),top: Adapt.px(25),bottom: Adapt.px(25)),
                    child: Image.asset('images/ic_userwstar_b.png',width: Adapt.px(60),),
                  ),
                  Text('我的收藏',style: TextStyle(color:Colors.black,fontSize: Adapt.px(35)),),
                  Expanded(child: Container(),),
                  Text('0',style:TextStyle(color: Colors.grey[600],fontSize: Adapt.px(30))),
                  Icon(Icons.navigate_next,color: Colors.grey[300],),
                  SizedBox(width: Adapt.px(20),)
                  ],),
                  Container(color:Colors.grey[100],height: 8),
                ],
              ) ,
            ),
          ],
        ),
      ),
    );
  }
}