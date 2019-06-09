import 'package:cloudmusic/actions/Adapt.dart';
import 'package:cloudmusic/actions/cloudmusicapihelper.dart';
import 'package:cloudmusic/models/enum/loginpagetype.dart';
import 'package:cloudmusic/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  final LoginPageType pagetype;
  final String phone;
  LoginPage({this.pagetype, this.phone});
  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool isbuttonenable = false;
  bool ishaspwd = false;
  bool isshowpwd = true;
  String errtxt='';
  String phone;
  String pwd;
  TextEditingController phonetxtcontroller = new TextEditingController();
  Widget getView() {
    switch (widget.pagetype) {
      case LoginPageType.phone:
        return Container(
          margin: EdgeInsets.only(
              top: Adapt.px(80), left: Adapt.px(30), right: Adapt.px(30)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('未注册手机号登录后将自动创建账号',
                  style: TextStyle(
                      color: Colors.grey[500], fontSize: Adapt.px(28))),
              SizedBox(
                height: Adapt.px(50),
              ),
              TextField(
                onChanged: (String t) {
                  phone = t;
                  bool enable = false;
                  if (t.length == 11) {
                    enable = true;
                  }
                  setState(() {
                    isbuttonenable = enable;
                  });
                },
                autofocus: true,
                style: TextStyle(color: Colors.black, fontSize: Adapt.px(35)),
                maxLength: 11,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    hintText: '输入手机号码',
                    hasFloatingPlaceholder: true,
                    filled: true,
                    prefixText: '+86 ',
                    prefixStyle:
                        TextStyle(color: Colors.black, fontSize: Adapt.px(35)),
                    suffixIcon: Icon(
                      Icons.close,
                      color: Colors.grey[300],
                    )),
              ),
              SizedBox(
                height: Adapt.px(50),
              ),
              Container(
                width: Adapt.screenW(),
                height: Adapt.px(80),
                child: FlatButton(
                  color: isbuttonenable ? Colors.red : Colors.red[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Adapt.px(40))),
                  textColor: isbuttonenable ? Colors.white : Colors.white30,
                  onPressed: () async {
                    if (isbuttonenable) {
                      await Navigator.push(context, new MaterialPageRoute(
                          builder: (BuildContext context) {
                        return new LoginPage(
                            pagetype: LoginPageType.password, phone: phone);
                      }));
                    }
                  },
                  child: Text('下一步'),
                ),
              ),
            ],
          ),
        );
      case LoginPageType.password:
        return Container(
          padding: EdgeInsets.only(
              top: Adapt.px(20), left: Adapt.px(30), right: Adapt.px(30)),
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: (String t) {
                  pwd = t;
                  bool enable = false;
                  if (t.length > 0) {
                    enable = true;
                  }
                  setState(() {
                    ishaspwd = enable;
                  });
                },
                autofocus: true,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  hintText: '输入密码',
                  errorText: errtxt,
                  suffix: IconButton(
                    alignment: Alignment.bottomCenter,
                    iconSize: Adapt.px(30),
                    padding: EdgeInsets.all(0),
                    icon: isshowpwd
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                    onPressed: () {
                      setState(() {
                        isshowpwd = !isshowpwd;
                      });
                    },
                  ),
                ),
                obscureText: isshowpwd,
              ),
              SizedBox(
                height: Adapt.px(80),
              ),
              Container(
                width: Adapt.screenW(),
                height: Adapt.px(80),
                child: FlatButton(
                  color: ishaspwd ? Colors.red : Colors.red[400],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Adapt.px(40))),
                  textColor: ishaspwd ? Colors.white : Colors.white30,
                  onPressed: () async {
                    if (ishaspwd) {
                      bool r =
                          await CloudMusicApiHelper.login(widget.phone, pwd);
                      if (r) {
                        await Navigator.pushAndRemoveUntil(context,
                            new MaterialPageRoute(
                                builder: (BuildContext context) {
                          return new TutorialHome();
                        }), ModalRoute.withName('/home'));
                      } 
                      else {
                        setState(() {
                          errtxt='密码有误';
                        });
                      }
                    }
                  },
                  child: Text('立刻登录'),
                ),
              ),
            ],
          ),
        );
      case LoginPageType.sms:
        return Container();
    }
    return Container();
  }

  @override
  void initState() {
    super.initState();
  }

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
      body: getView(),
    );
  }
}
