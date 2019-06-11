import 'package:cloudmusic/actions/Adapt.dart';
import 'package:cloudmusic/actions/cloudmusicapihelper.dart';
import 'package:cloudmusic/models/model.dart';
import 'package:cloudmusic/views/startpage.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AcountPage extends StatefulWidget {
  @override
  AcountPageState createState() => new AcountPageState();
}

class AcountPageState extends State<AcountPage>
    with AutomaticKeepAliveClientMixin {
  bool showtitle = false;
  bool darkmode = false;
  String iconurl;
  String username = '';
  int vip = 0;
  AccountDetailModel accountDetailModel;
  ScrollController scrollController = new ScrollController();

  void getUserInfo() async {
    var pre = await SharedPreferences.getInstance();
    setState(() {
      username = pre.getString('username');
      iconurl = pre.getString('usericon');
    });
    int uid = pre.getInt('userId');
    if (uid != null) {
      var r = await CloudMusicApiHelper.accountDetal(uid);
      if (r.code == 200) {
        setState(() {
          accountDetailModel = r;
          vip = r.level;
        });
      }
    }
  }

  Widget getUserIcon() {
    if (iconurl == null) {
      return Container(
        width: Adapt.px(100),
        height: Adapt.px(100),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Adapt.px(50)),
          image: DecorationImage(image: AssetImage('images/CacheBG.jpg')),
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(Adapt.px(50)),
        child: FadeInImage.assetNetwork(
          width: Adapt.px(100),
          height: Adapt.px(100),
          placeholder: 'images/CacheBG.jpg',
          image: iconurl,
        ),
      );
    }
  }

  Widget getAccoutInfoCells() {
    if (accountDetailModel == null) {
      return Container();
    } else {
      return Container(
        padding: EdgeInsets.all(Adapt.px(30)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  accountDetailModel.profile.eventCount.toString(),
                  style: TextStyle(color: Colors.black, fontSize: Adapt.px(30)),
                ),
                Text('动 态',
                    style: TextStyle(
                        color: Colors.grey[500], fontSize: Adapt.px(22)))
              ],
            ),
            Container(
              width: Adapt.px(1),
              height: Adapt.px(60),
              color: Colors.grey[300],
            ),
            Column(
              children: <Widget>[
                Text(
                  accountDetailModel.profile.follows.toString(),
                  style: TextStyle(color: Colors.black, fontSize: Adapt.px(30)),
                ),
                Text('关 注',
                    style: TextStyle(
                        color: Colors.grey[500], fontSize: Adapt.px(22)))
              ],
            ),
            Container(
              width: Adapt.px(1),
              height: Adapt.px(60),
              color: Colors.grey[300],
            ),
            Column(
              children: <Widget>[
                Text(
                  accountDetailModel.profile.followeds.toString(),
                  style: TextStyle(color: Colors.black, fontSize: Adapt.px(30)),
                ),
                Text('粉 丝',
                    style: TextStyle(
                        color: Colors.grey[500], fontSize: Adapt.px(22)))
              ],
            ),
            Container(
              width: Adapt.px(1),
              height: Adapt.px(60),
              color: Colors.grey[300],
            ),
            Column(
              children: <Widget>[
                Icon(
                  Icons.create,
                  size: Adapt.px(35),
                ),
                Text('编辑资料',
                    style: TextStyle(
                        color: Colors.grey[500], fontSize: Adapt.px(22)))
              ],
            ),
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    scrollController.addListener(() {
      bool isscroll = scrollController.position.pixels > 50.0;
      setState(() {
        showtitle = isscroll;
      });
    });
    getUserInfo();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                Icons.flip,
                color: Colors.grey[800],
              ),
              onPressed: () {},
            ),
            Expanded(
              child: Center(
                child: Text(showtitle ? '账号' : '',
                    style: TextStyle(color: Colors.black)),
              ),
            ),
            IconButton(
              iconSize: Adapt.px(60),
              icon: Icon(
                Icons.graphic_eq,
                color: Colors.grey[800],
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Container(
          color: Colors.grey[100],
          child: CustomScrollView(
            controller: scrollController,
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(
                    Adapt.px(30),
                    0,
                    Adapt.px(30),
                    0,
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          getUserIcon(),
                          SizedBox(
                            width: Adapt.px(20),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                username,
                                style: TextStyle(
                                    fontSize: Adapt.px(30),
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: Adapt.px(5),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(Adapt.px(15),
                                    Adapt.px(5), Adapt.px(15), Adapt.px(5)),
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius:
                                        BorderRadius.circular(Adapt.px(15))),
                                child: Text(
                                  'Lv$vip',
                                  style: TextStyle(
                                      fontSize: Adapt.px(20),
                                      color: Colors.grey[700]),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Container(
                            width: Adapt.px(120),
                            height: Adapt.px(50),
                            child: RaisedButton(
                              padding: EdgeInsets.fromLTRB(Adapt.px(15),
                                  Adapt.px(5), Adapt.px(15), Adapt.px(5)),
                              color: Colors.red,
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.view_headline,
                                    color: Colors.white,
                                    size: Adapt.px(25),
                                  ),
                                  SizedBox(
                                    width: Adapt.px(5),
                                  ),
                                  Text(
                                    '签到',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                              shape: new RoundedRectangleBorder(
                                  borderRadius:
                                      new BorderRadius.circular(25.0)),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                      getAccoutInfoCells(),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: Adapt.px(15),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(Adapt.px(20)),
                              child: Image.asset(
                                'images/ic_setting_b.png',
                                width: Adapt.px(40),
                              ),
                            ),
                            Text(
                              '设置',
                              style: TextStyle(
                                  color: Colors.black, fontSize: Adapt.px(28)),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey[300],
                              size: Adapt.px(50),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: Adapt.px(80)),
                        height: Adapt.px(2),
                        color: Colors.grey[200],
                      ),
                      GestureDetector(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(Adapt.px(20)),
                              child: Image.asset(
                                'images/ic_moon.png',
                                width: Adapt.px(40),
                              ),
                            ),
                            Text(
                              '夜间模式',
                              style: TextStyle(
                                  color: Colors.black, fontSize: Adapt.px(28)),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            CupertinoSwitch(
                              value: darkmode,
                              onChanged: (bool e) {
                                setState(() {
                                  darkmode = !darkmode;
                                });
                              },
                              activeColor: Colors.red,
                            ),
                            SizedBox(
                              width: 4,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: Adapt.px(80)),
                        height: Adapt.px(2),
                        color: Colors.grey[200],
                      ),
                      GestureDetector(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(Adapt.px(20)),
                              child: Image.asset(
                                'images/ic_clock.png',
                                width: Adapt.px(40),
                              ),
                            ),
                            Text(
                              '定时关闭',
                              style: TextStyle(
                                  color: Colors.black, fontSize: Adapt.px(28)),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey[300],
                              size: Adapt.px(50),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: Adapt.px(80)),
                        height: Adapt.px(2),
                        color: Colors.grey[200],
                      ),
                      GestureDetector(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(Adapt.px(20)),
                              child: Image.asset(
                                'images/ic_clock2.png',
                                width: Adapt.px(40),
                              ),
                            ),
                            Text(
                              '音乐闹钟',
                              style: TextStyle(
                                  color: Colors.black, fontSize: Adapt.px(28)),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey[300],
                              size: Adapt.px(50),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: Adapt.px(15),
                        color: Colors.grey[100],
                      ),
                      GestureDetector(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(Adapt.px(20)),
                              child: Image.asset(
                                'images/ic_box_b.png',
                                width: Adapt.px(40),
                              ),
                            ),
                            Text(
                              '在线听歌免流量',
                              style: TextStyle(
                                  color: Colors.black, fontSize: Adapt.px(28)),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey[300],
                              size: Adapt.px(50),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: Adapt.px(80)),
                        height: Adapt.px(2),
                        color: Colors.grey[200],
                      ),
                      GestureDetector(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(Adapt.px(20)),
                              child: Image.asset(
                                'images/ic_ticket.png',
                                width: Adapt.px(40),
                              ),
                            ),
                            Text(
                              '优惠卷',
                              style: TextStyle(
                                  color: Colors.black, fontSize: Adapt.px(28)),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey[300],
                              size: Adapt.px(50),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: Adapt.px(15),
                        color: Colors.grey[100],
                      ),
                      GestureDetector(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(Adapt.px(20)),
                              child: Image.asset(
                                'images/ic_music_cb.png',
                                width: Adapt.px(40),
                              ),
                            ),
                            Text(
                              '加入网易音乐人',
                              style: TextStyle(
                                  color: Colors.black, fontSize: Adapt.px(28)),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey[300],
                              size: Adapt.px(50),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: Adapt.px(80)),
                        height: Adapt.px(2),
                        color: Colors.grey[200],
                      ),
                      GestureDetector(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(Adapt.px(20)),
                              child: Image.asset(
                                'images/ic_mic2_b.png',
                                width: Adapt.px(40),
                              ),
                            ),
                            Text(
                              '我要直播',
                              style: TextStyle(
                                  color: Colors.black, fontSize: Adapt.px(28)),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey[300],
                              size: Adapt.px(50),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: Adapt.px(80)),
                        height: Adapt.px(2),
                        color: Colors.grey[200],
                      ),
                      GestureDetector(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(Adapt.px(22)),
                              child: Icon(
                                Icons.open_in_new,
                                size: Adapt.px(35),
                                color: Colors.grey[800],
                              ),
                            ),
                            Text(
                              '分享网易云音乐',
                              style: TextStyle(
                                  color: Colors.black, fontSize: Adapt.px(28)),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey[300],
                              size: Adapt.px(50),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: Adapt.px(80)),
                        height: Adapt.px(2),
                        color: Colors.grey[200],
                      ),
                      GestureDetector(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(Adapt.px(22)),
                              child: Icon(
                                Icons.info_outline,
                                size: Adapt.px(35),
                                color: Colors.grey[800],
                              ),
                            ),
                            Text(
                              '关于',
                              style: TextStyle(
                                  color: Colors.black, fontSize: Adapt.px(28)),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: Colors.grey[300],
                              size: Adapt.px(50),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: Adapt.px(15),
                        color: Colors.grey[100],
                      ),
                      Container(
                        width: Adapt.screenW(),
                        child: FlatButton(
                          onPressed: () async {
                            String appDocPath = CloudMusicApiHelper.appDocPath;
                            var cookiejar = new PersistCookieJar(
                                dir: "$appDocPath/cookies");
                            cookiejar.deleteAll();
                            await Navigator.push(context, new MaterialPageRoute(
                                builder: (BuildContext context) {
                              return new StartPage();
                            }));
                          },
                          child: Text('退出登录',
                              style: TextStyle(
                                  color: Colors.red, fontSize: Adapt.px(30))),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
