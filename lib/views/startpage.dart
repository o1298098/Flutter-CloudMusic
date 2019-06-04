import 'package:cloudmusic/actions/Adapt.dart';
import 'package:cloudmusic/models/enum/loginpagetype.dart';
import 'package:cloudmusic/views/loginpage.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  @override
  StartPageState createState() => new StartPageState();
}

class StartPageState extends State<StartPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Container(
                alignment: Alignment.center,
                height: Adapt.px(120),
                width: Adapt.px(120),
                decoration: BoxDecoration(
                  color: Colors.red[300],
                  borderRadius: BorderRadius.circular(Adapt.px(60)),
                ),
                child: Text(
                  'dOb',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            width: Adapt.screenW() * 0.8,
            height: Adapt.px(80),
            decoration: BoxDecoration(
              color: Colors.white,
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(Adapt.px(40))),
            child: FlatButton(
              textColor: Colors.red,
              onPressed: () async{
                await Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) {
                  return new LoginPage(pagetype:LoginPageType.phone);
                }));
              },
              child: Text('手机号登录',style: TextStyle(fontSize: Adapt.px(30)),),
            ),
          ),
          SizedBox(height: Adapt.px(50),),
          Container(
            alignment: Alignment.bottomCenter,
            width: Adapt.screenW() * 0.8,
            height: Adapt.px(80),
            decoration: BoxDecoration(
              color: Colors.red,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(Adapt.px(40))),
            child: FlatButton(
              textColor: Colors.white,
              onPressed: () {},
              child: Text('TestAcount'),
            ),
          ),
          SizedBox(height:Adapt.px(50),)
        ],
      ),
    );
  }
}
