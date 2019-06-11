import 'package:cloudmusic/actions/Adapt.dart';
import 'package:cloudmusic/actions/cloudmusicapihelper.dart';
import 'package:cloudmusic/models/model.dart';
import 'package:cloudmusic/views/videoplayeritem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';

import 'customwidgets/sliverappbardelegate.dart';

class FrientEventPage extends StatefulWidget {
  @override
  FrientEventPageState createState() => new FrientEventPageState();
}

class FrientEventPageState extends State<FrientEventPage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  AnimationController segmentAnimationController;
  Animation<Offset> segmentAnimation;
  FriendEventModel femodel;
  ScrollController scrollController = new ScrollController();
  bool segmentState = false;
  bool isBusy = false;
  int lasttime = -1;
  int eventcount = 0;
  double rightwidth = Adapt.screenW() - Adapt.px(110);

  void getFriendEvent() async {
    setState(() {
      isBusy = true;
    });
    var pre = await SharedPreferences.getInstance();
    int uid = pre.getInt('userId');
    if (uid != null) {
      var r = await CloudMusicApiHelper.userFriendEvent(30, lasttime);
      if (r.code == 200) {
        if (femodel == null) {
          setState(() {
            femodel = r;
            lasttime = r.lasttime;
          });
        } else {
          setState(() {
            femodel.event.addAll(r.event);
            lasttime = r.lasttime;
          });
        }
      }
      setState(() {
        isBusy = false;
      });
    }
  }

  Widget buildImageCell(PicData p) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Adapt.px(10)),
      child: Container(
        width: 100,
        height: 100,
        child: FadeInImage.assetNetwork(
          fadeOutDuration: Duration(microseconds: 0),
          placeholder: 'images/CacheBG.jpg',
          image: p.squareUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget getImageCells(FriendEventData d) {
    if (d.pics.length == 0) {
      return Container();
    } else {
      return Container(
        width: Adapt.screenW() - Adapt.px(110),
        margin: EdgeInsets.only(left: Adapt.px(70)),
        child: GridView.extent(
          physics: new NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          childAspectRatio: 1,
          padding: const EdgeInsets.all(4.0),
          maxCrossAxisExtent: Adapt.px(300),
          crossAxisSpacing: Adapt.px(8),
          mainAxisSpacing: Adapt.px(8),
          children: d.pics.map(buildImageCell).toList(),
        ),
      );
    }
  }

  Widget getVideoCells(FriendEventData d) {
    if (d.jsonstr.video == null) {
      return Container();
    } else {
      return Container(
        width: rightwidth,
        height: (rightwidth) * 9 / 16,
        margin: EdgeInsets.only(left: Adapt.px(70)),
        child: VideoPlayerItem(
          vc: VideoPlayerController.network(''),
          showplayer: d.jsonstr.video.state == 1 ? true : false,
          coverurl: d.jsonstr.video.coverUrl,
          playtime: d.jsonstr.video.playTime,
          duration: d.jsonstr.video.durationms,
        ),
      );
    }
  }

  Widget getMusicPlayerCell(FriendEventData d) {
    if (d.jsonstr.song == null) {
      return Container();
    } else {
      return Container(
        padding: EdgeInsets.all(Adapt.px(10)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Adapt.px(10)),
            color: Colors.grey[100]),
        width: rightwidth,
        margin: EdgeInsets.only(left: Adapt.px(70), top: Adapt.px(5)),
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(Adapt.px(5)),
                  child: FadeInImage.assetNetwork(
                    width: Adapt.px(65),
                    height: Adapt.px(65),
                    placeholder: 'images/CacheBG.jpg',
                    image: d.jsonstr.song.album.picUrl,
                  ),
                ),
                Container(
                    width: Adapt.px(65),
                    height: Adapt.px(65),
                    child: Icon(
                      Icons.play_circle_outline,
                      color: Colors.white,
                    ))
              ],
            ),
            SizedBox(
              width: Adapt.px(15),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: Adapt.screenW() * 0.6,
                  child: Text(d.jsonstr.song.name,
                      softWrap: true,
                      maxLines: 1,
                      style: TextStyle(color: Colors.black, fontSize: Adapt.px(26))),
                ),
                Text(
                  d.jsonstr.song.artists[0].name,
                  style: TextStyle(
                      color: Colors.grey[500], fontSize: Adapt.px(20)),
                )
              ],
            )
          ],
        ),
      );
    }
  }

  Widget buildFriendEventCell(FriendEventData d) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(
                Adapt.px(20), Adapt.px(20), Adapt.px(20), Adapt.px(10)),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(Adapt.px(30)),
                  child: Container(
                    width: Adapt.px(60),
                    height: Adapt.px(60),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'images/CacheBG.jpg',
                      image: d.user.avatarUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: Adapt.px(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      text: new TextSpan(
                        children: <TextSpan>[
                          new TextSpan(
                              text: '${d.user.nickname} ',
                              style:
                                  new TextStyle(color: Colors.lightBlue[700])),
                          new TextSpan(
                              text: d.jsonstr.song == null ? '分享视频:' : '分享单曲:',
                              style: new TextStyle(color: Colors.black87)),
                        ],
                      ),
                    ),
                    Text(d.rcmdInfo.userReason,
                        style: new TextStyle(
                            color: Colors.grey[400], fontSize: Adapt.px(20)))
                  ],
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  alignment: Alignment.center,
                  height: Adapt.px(40),
                  width: Adapt.px(100),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(Adapt.px(20))),
                  child: Text(
                    '+关注',
                    style:
                        TextStyle(color: Colors.white, fontSize: Adapt.px(25)),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: rightwidth,
            margin: EdgeInsets.only(left: Adapt.px(70)),
            child: Text(
              d.jsonstr.msg,
              style: TextStyle(color: Colors.black, fontSize: Adapt.px(28)),
            ),
          ),
          SizedBox(
            height: Adapt.px(10),
          ),
          getImageCells(d),
          getVideoCells(d),
          getMusicPlayerCell(d),
          Container(
            width: rightwidth,
            margin: EdgeInsets.only(left: Adapt.px(70)),
            child: Row(
              children: <Widget>[
                Container(
                  width: Adapt.px(150),
                  child: RaisedButton(
                    padding: EdgeInsets.only(left: 0),
                    elevation: 0.0,
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.repeat,
                          size: Adapt.px(30),
                          color: Colors.grey[700],
                        ),
                        SizedBox(
                          width: Adapt.px(10),
                        ),
                        Text(
                          d.forwardCount.toString(),
                          style: TextStyle(
                              color: Colors.grey[700], fontSize: Adapt.px(26)),
                        )
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: Adapt.px(150),
                  child: RaisedButton(
                    padding: EdgeInsets.only(left: 0),
                    elevation: 0.0,
                    color: Colors.transparent,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.comment,
                          size: Adapt.px(30),
                          color: Colors.grey[700],
                        ),
                        SizedBox(
                          width: Adapt.px(10),
                        ),
                        Text(
                          d.info.commentCount.toString(),
                          style: TextStyle(
                              color: Colors.grey[700], fontSize: Adapt.px(26)),
                        )
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  width: Adapt.px(150),
                  child: RaisedButton(
                    padding: EdgeInsets.only(left: 0),
                    elevation: 0.0,
                    color: Colors.transparent,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.thumb_up,
                          size: Adapt.px(30),
                          color: Colors.grey[700],
                        ),
                        SizedBox(
                          width: Adapt.px(10),
                        ),
                        Text(
                          d.info.likedCount.toString(),
                          style: TextStyle(
                              color: Colors.grey[700], fontSize: Adapt.px(26)),
                        )
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                IconButton(
                  padding: EdgeInsets.only(right: 0),
                  alignment: Alignment.centerRight,
                  icon: Icon(Icons.more_vert, color: Colors.grey[700]),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getFriengEventCells() {
    if (femodel == null) {
      return SliverToBoxAdapter(
        child: Container(),
      );
    } else {
      return SliverList(
        delegate: SliverChildListDelegate(
            femodel.event.map(buildFriendEventCell).toList()),
      );
    }
  }

  @override
  void initState() {
    segmentAnimationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 150));
    segmentAnimation = Tween<Offset>(begin: Offset.zero, end: Offset(1.0, 0.0))
        .animate(segmentAnimationController);
    getFriendEvent();
    scrollController.addListener(() {
      bool isBottom = scrollController.position.pixels ==
          scrollController.position.maxScrollExtent;
      if (isBottom) {
        getFriendEvent();
      }
    });
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
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0.0,
        title: Row(
          children: <Widget>[
            IconButton(
              alignment: Alignment.centerLeft,
              icon: Icon(
                Icons.person_add,
                color: Colors.black,
                size: Adapt.px(50),
              ),
              onPressed: () {},
            ),
            Expanded(
              child: Center(
                child: Container(
                    width: Adapt.px(192),
                    height: Adapt.px(50),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.red, width: Adapt.px(1)),
                        borderRadius: BorderRadius.circular(Adapt.px(25))),
                    child: Stack(
                      children: <Widget>[
                        SlideTransition(
                          position: segmentAnimation,
                          child: Container(
                            width: Adapt.px(95),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.circular(Adapt.px(25))),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: Adapt.px(95),
                              child: RaisedButton(
                                elevation: 0.0,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0)),
                                color: Colors.transparent,
                                padding: EdgeInsets.all(0),
                                child: Text('动态',
                                    style: TextStyle(
                                        color: segmentState
                                            ? Colors.red
                                            : Colors.white)),
                                onPressed: () {
                                  segmentAnimationController
                                      .reverse()
                                      .then((_) {
                                    setState(() {
                                      segmentState = false;
                                    });
                                  });
                                },
                              ),
                            ),
                            Container(
                              width: Adapt.px(95),
                              child: RaisedButton(
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(30.0)),
                                elevation: 0.0,
                                color: Colors.transparent,
                                padding: EdgeInsets.all(0),
                                child: Text('附近',
                                    style: TextStyle(
                                        color: segmentState
                                            ? Colors.white
                                            : Colors.red)),
                                onPressed: () {
                                  segmentAnimationController
                                      .forward()
                                      .then((_) {
                                    setState(() {
                                      segmentState = true;
                                    });
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
            IconButton(
              alignment: Alignment.centerRight,
              icon: Icon(
                Icons.graphic_eq,
                color: Colors.black,
                size: Adapt.px(50),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverPersistentHeader(
            floating: true,
            delegate: SliverAppBarDelegate(
                minHeight: Adapt.px(60),
                maxHeight: Adapt.px(60),
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 1,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.create,
                                  size: Adapt.px(35),
                                ),
                                SizedBox(
                                  width: Adapt.px(10),
                                ),
                                Text('发动态',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Adapt.px(26)))
                              ],
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.video_call,
                                  size: Adapt.px(35),
                                ),
                                SizedBox(
                                  width: Adapt.px(10),
                                ),
                                Text('发布视频',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Adapt.px(26)))
                              ],
                            ),
                          )),
                    ],
                  ),
                )),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.grey[100],
              height: Adapt.px(15),
            ),
          ),
          getFriengEventCells(),
          SliverToBoxAdapter(
              child: Container(
            height: Adapt.px(80),
            padding: EdgeInsets.all(Adapt.px(5)),
            child: Center(
              child: isBusy
                  ? CircularProgressIndicator(
                      strokeWidth: Adapt.px(3),
                    )
                  : null,
            ),
          ))
        ],
      ),
    );
  }
}
