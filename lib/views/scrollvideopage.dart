import 'dart:math';

import 'package:cloudmusic/actions/Adapt.dart';
import 'package:cloudmusic/actions/cloudmusicapihelper.dart';
import 'package:cloudmusic/models/enum/cloudmusicvideogroup.dart';
import 'package:cloudmusic/models/model.dart';
import 'package:cloudmusic/views/videopage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloudmusic/views/customwidgets/videoplayeritem.dart';
import 'package:flutter/rendering.dart';
import 'package:video_player/video_player.dart';

class ScrollVideoPage extends StatefulWidget {
  @override
  ScrollPageState createState() => ScrollPageState();
}

class ScrollPageState extends State<ScrollVideoPage>
    with AutomaticKeepAliveClientMixin {
  int count = 0;
  int offset = 0;
  int videocount = 0;
  VideoGroupMpdel videoGroupMpdel;
  bool isBusy = false;
  ScrollController scrollController = new ScrollController();
  Random random = new Random(DateTime.now().millisecondsSinceEpoch);
  void getVideo() async {
    setState(() {
      isBusy = true;
    });
    var r = await CloudMusicApiHelper.getVideo(
        CloudMusicVideoGroup.Happy.toInt(), 30, offset);
    setState(() {
      if (videoGroupMpdel == null) {
        videoGroupMpdel = r;
      } else {
        videoGroupMpdel.datas.addAll(r.datas);
      }
      videocount = videoGroupMpdel.datas.length;
    });
    offset += 30;
    isBusy = false;
  }

  @override
  void initState() {
    getVideo();
    scrollController.addListener(() {
      bool isBottom = scrollController.position.pixels ==
          scrollController.position.maxScrollExtent;
      if (isBottom) {
        getVideo();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return new Scaffold(
        body: DefaultTabController(
      length: 6,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                child: SliverAppBar(
                  pinned: true,
                  floating: false,
                  snap: false,
                  brightness: Brightness.light,
                  backgroundColor: Colors.white,
                  title: Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: Adapt.px(60),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.video_call,
                            ),
                            iconSize: Adapt.px(60),
                            color: Colors.grey[600],
                          ),
                        ),
                        new Expanded(
                            child: Container(
                          height: Adapt.px(80),
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.grey[200]),
                          child: new Center(
                            child: new Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Icon(
                                  Icons.search,
                                  color: Colors.grey[400],
                                ),
                                Text(
                                  '出前一丁',
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: Adapt.px(30)),
                                )
                              ],
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                  bottom: TabBar(
                    labelColor: Colors.black,
                    indicatorColor: Colors.red,
                    indicatorSize: TabBarIndicatorSize.label,
                    isScrollable: true,
                    tabs: <Widget>[
                      Tab(text: '推荐'),
                      Tab(text: '视频广场'),
                      Tab(text: 'MV'),
                      Tab(text: '舞蹈'),
                      Tab(text: '翻唱'),
                      Tab(text: '舞蹈'),
                    ],
                  ),
                )),
          ];
        },
        body: TabBarView(
          children: <Widget>[
            SafeArea(
                top: false,
                bottom: false,
                child: Builder(builder: (BuildContext context) {
                  return CustomScrollView(
                    controller: scrollController,
                    slivers: <Widget>[
                      SliverOverlapInjector(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                      ),
                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                        VideoPlayerItem player = new VideoPlayerItem(
                          vc: VideoPlayerController.network(
                              videoGroupMpdel.datas[index].data.urlInfo.url),
                          showplayer: !videoGroupMpdel.datas[index].displayed,
                          coverurl: videoGroupMpdel.datas[index].data.coverUrl,
                          playtime: videoGroupMpdel.datas[index].data.playTime,
                          duration:
                              videoGroupMpdel.datas[index].data.durationms,
                          key: Key(index.toString()),
                        );
                        return Container(
                          color: Colors.grey[300],
                          child: Container(
                            padding: EdgeInsets.all(Adapt.px(20)),
                            margin: EdgeInsets.only(bottom: Adapt.px(20)),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                player,
                                SizedBox(
                                  height: Adapt.px(20),
                                ),
                                Container(
                                  height: Adapt.px(80),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: Adapt.screenW() * 0.75,
                                        child: Text(
                                          videoGroupMpdel.datas[index].data.title ??
                                              'no title',
                                          maxLines: 2,
                                          softWrap: true,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: Adapt.px(28)),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: Adapt.px(10)),
                                        width: Adapt.px(80),
                                        height: Adapt.px(80),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black, width: 8),
                                            borderRadius: BorderRadius.circular(
                                                Adapt.px(80)),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    videoGroupMpdel.datas[index]
                                                        .data.coverUrl),
                                                fit: BoxFit.cover)),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: Adapt.px(20),
                                ),
                                Container(
                                  color: Colors.grey[300],
                                  height: 1,
                                ),
                                SizedBox(
                                  height: Adapt.px(20),
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: Adapt.px(100),
                                      height: Adapt.px(100),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Adapt.px(50)),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  videoGroupMpdel
                                                      .datas[index]
                                                      .data
                                                      .creator
                                                      .avatarUrl))),
                                    ),
                                    SizedBox(
                                      width: Adapt.px(10),
                                    ),
                                    Container(
                                      width: Adapt.screenW() * 0.5,
                                      child: Text(
                                        videoGroupMpdel
                                            .datas[index].data.creator.nickname,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: Adapt.px(30)),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: Adapt.px(40),
                                      ),
                                    ),
                                    Stack(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(Icons.thumb_up),
                                          color: videoGroupMpdel
                                                  .datas[index].data.praised
                                              ? Colors.red
                                              : Colors.grey[600],
                                          onPressed: () {
                                            if (!videoGroupMpdel
                                                .datas[index].data.praised) {
                                              setState(() {
                                                videoGroupMpdel.datas[index]
                                                    .data.praised = true;
                                                videoGroupMpdel.datas[index]
                                                    .data.praisedCount++;
                                              });
                                            } else {
                                              setState(() {
                                                videoGroupMpdel.datas[index]
                                                    .data.praised = false;
                                                videoGroupMpdel.datas[index]
                                                    .data.praisedCount--;
                                              });
                                            }
                                          },
                                        ),
                                        Container(
                                          width: Adapt.px(100),
                                          alignment: Alignment.bottomRight,
                                          //color: Colors.white,
                                          child: Text(
                                            videoGroupMpdel
                                                .datas[index].data.praisedCount
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: Adapt.px(18)),
                                          ),
                                        )
                                      ],
                                    ),
                                    Stack(
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(Icons.comment),
                                          color: Colors.grey[600],
                                          onPressed: () async {
                                            await Navigator.push(context,
                                                new MaterialPageRoute(builder:
                                                    (BuildContext context) {
                                              return new VideoPage(vid:videoGroupMpdel.datas[index].data.vid);
                                            }));
                                          },
                                        ),
                                        Container(
                                          width: Adapt.px(100),
                                          alignment: Alignment.bottomRight,
                                          //color: Colors.white,
                                          child: Text(
                                            videoGroupMpdel
                                                .datas[index].data.commentCount
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: Adapt.px(18)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }, childCount: videocount)),
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
                  );
                })),
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
