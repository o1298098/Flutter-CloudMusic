import 'dart:math';

import 'package:cloudmusic/actions/Adapt.dart';
import 'package:cloudmusic/actions/cloudmusicapihelper.dart';
import 'package:cloudmusic/models/enum/cloudmusicvideogroup.dart';
import 'package:cloudmusic/models/model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

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
  VideoPlayerController vpController;
  ScrollController scrollController = new ScrollController();
  Random random = new Random(DateTime.now().millisecondsSinceEpoch);
  void getVideo() async {
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
                        bool showplayer = true;
                        VideoPlayerController vc =
                            VideoPlayerController.network(
                                videoGroupMpdel.datas[index].data.urlInfo.url);
                        var chewieController = ChewieController(
                          videoPlayerController: vc,
                          aspectRatio: 16 / 9,
                          autoPlay: false,
                          looping: false,
                        );
                        return Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(Adapt.px(20)),
                                    child: Image.network(videoGroupMpdel
                                        .datas[index].data.coverUrl),
                                  ),
                                 Offstage(
                                   key: Key(index.toString()),
                                   offstage: showplayer,
                                   child: Container(
                                    child: Chewie(
                                      controller: chewieController,
                                    ),
                                  ),
                                 ) ,
                                ],
                              ),
                              Container(
                                height: Adapt.px(80),
                                child: Row(
                                  children: <Widget>[
                                    Text(videoGroupMpdel
                                            .datas[index].data.description ??
                                        ''),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.play_circle_outline),
                                onPressed: () {
                                  if (!vc.value.isPlaying) {
                                    setState(() {
                                      showplayer = false;
                                    });
                                    vc.play();
                                  } else {
                                    vc.pause();
                                  }
                                },
                              )
                            ],
                          ),
                        );
                      }, childCount: videocount))
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
