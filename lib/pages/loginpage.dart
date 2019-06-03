import 'package:cloudmusic/actions/Adapt.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          '手机号登录',
          style: TextStyle(color: Colors.black, fontSize: Adapt.px(35)),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
            top: Adapt.px(80), left: Adapt.px(30), right: Adapt.px(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('未注册手机号登录后将自动创建账号',
                style:
                    TextStyle(color: Colors.grey[500], fontSize: Adapt.px(28))),
            SizedBox(
              height: Adapt.px(50),
            ),
            TextField(
              style: TextStyle(color: Colors.black,fontSize: Adapt.px(35)),
              maxLength: 13,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                hintText: '输入手机号码',
                  filled: true,
                  prefixText: '+86 ',
                  prefixStyle: TextStyle(color: Colors.black,fontSize: Adapt.px(35)),
                  ),
            ),
            SizedBox(height: Adapt.px(50),),
            Container(
            alignment: Alignment.center,
            height: Adapt.px(80),
            decoration: BoxDecoration(
              color: Colors.red,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(Adapt.px(40))),
            child: FlatButton(
              textColor: Colors.white,
              onPressed: () {},
              child: Text('下一步'),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
