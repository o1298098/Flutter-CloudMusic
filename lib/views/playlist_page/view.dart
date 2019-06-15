import 'dart:typed_data';
import 'dart:ui';

import 'package:cloudmusic/actions/Adapt.dart';
import 'package:cloudmusic/actions/counTostr.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(PlayListPageState state, Dispatch dispatch, ViewService viewService) {
   Widget hasVideo(int i) {
    if (state.musicPlayList.playlist.tracks[i].mv > 0) {
      return IconButton(
        icon:Icon(Icons.ondemand_video,color: Colors.grey[400],),
        onPressed: () async {
                      /*await Navigator.push(context,
                          new MaterialPageRoute(
                              builder: (BuildContext context) {
                        return new MusicVideoPage(vid: state.musicPlayList.playlist.tracks[i].mv);
                      }));*/}
      );
    } else {
      return SizedBox(
        width: 20,
      );
    }
  }
  Widget getView() {
    var s=state.musicPlayList;
    if (s == null) {
      return new Center(
        child: Text('加载中'),
      );
    } else {
      return new NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              child: SliverAppBar(
                title: Text('歌单'),
                iconTheme: IconThemeData(color: Colors.white),
                elevation: 0,
                pinned: true,
                centerTitle: false,
                expandedHeight: 320,
                forceElevated: innerBoxIsScrolled,
                bottom: PreferredSize(
                  preferredSize: new Size(double.infinity, 50.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      child: new Container(
                        color: Colors.white,
                        height: 50,
                        child: Center(
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                onPressed: () async {
                                 /*await Navigator.push(context,
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) {
                                    return new MusicPlayerPage(
                                      playList: state.musicPlayList,
                                    );
                                  }));*/
                                },
                                icon: Icon(Icons.play_circle_outline,
                                    color: Colors.grey[800]),
                                tooltip: '播放全部',
                              ),
                              Text(
                                '播放全部',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                              ),
                              Text('(共' +
                                  state.musicPlayList.playlist.trackCount.toString() +
                                  '首)'),
                              Expanded(
                                child: SizedBox(),
                              ),
                              Container(
                                width: 80,
                                height: 30,
                                margin: EdgeInsets.only(right: 15),
                                decoration: BoxDecoration(
                                  color: Colors.red[400],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    Text('收藏',
                                        style: TextStyle(color: Colors.white))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    background: Container(
                      child: Stack(
                        children: <Widget>[
                          SizedBox.expand(
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(state.backgroundurl),
                            ),
                          ),
                          BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
                            child: new Container(
                              color: Colors.black54,
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: Adapt.px(180)),
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: FadeInImage.memoryNetwork(
                                              placeholder: Uint8List(512 * 512),
                                              image: state.backgroundurl,
                                              fadeOutDuration:
                                                  Duration(milliseconds: 0),
                                              width: Adapt.px(250),
                                              height: Adapt.px(250),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            height: 30,
                                            width: Adapt.px(250),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Expanded(
                                                  child: SizedBox(),
                                                ),
                                                Icon(
                                                  Icons.play_arrow,
                                                  color: Colors.white,
                                                  size: 18,
                                                ),
                                                Text(
                                                    CountTostr.chage(s.playlist.playCount),
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 10),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(s.playlist.name,
                                                softWrap: true,
                                                textAlign: TextAlign.left,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white)),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: <Widget>[
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  child: Image(
                                                    width: 30,
                                                    height: 30,
                                                    image: NetworkImage(s
                                                        .playlist
                                                        .creator
                                                        .avatarUrl),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                    s.playlist.creator.nickname,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                              ],
                                            ),
                                            SizedBox(
                                                  height: 10,
                                                ),
                                            Text(s.playlist.creator.description,
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          Icon(
                                            Icons.comment,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            s.playlist.commentCount.toString(),
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Icon(
                                            Icons.share,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            s.playlist.shareCount.toString(),
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Icon(
                                            Icons.cloud_download,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            '下载',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Icon(
                                            Icons.check_circle_outline,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            '多选',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      ),
                    )),
              ),
            ),
          ];
        },
        body: ListView.builder(
          padding: EdgeInsets.only(top: Adapt.px(250)),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              padding: EdgeInsets.all(Adapt.px(20)),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text((index + 1).toString()),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          s.playlist.tracks[index].name,
                          softWrap: true,
                          style: TextStyle(
                              fontSize: Adapt.px(28),
                              color: Colors.black,
                              decoration: TextDecoration.none),
                        ),
                        Text(
                          s.playlist.tracks[index].ar[0].name +
                              ' - ' +
                              s.playlist.tracks[index].al.name,
                          softWrap: true,
                          style: TextStyle(
                              fontSize: Adapt.px(20),
                              color: Colors.grey,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                  ),
                  hasVideo(index),
                  Icon(
                    Icons.more_vert,
                    color: Colors.grey[400],
                  ),
                ],
              ),
            );
          },
          itemCount: s.playlist.tracks.length,
        ),
      );
    }
  }
  return Scaffold(
      backgroundColor: Colors.white,
      body: getView(),
    );
}
