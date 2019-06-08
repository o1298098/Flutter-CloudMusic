import 'package:chewie/chewie.dart';
import 'package:cloudmusic/actions/Adapt.dart';
import 'package:cloudmusic/actions/cloudmusicapihelper.dart';
import 'package:cloudmusic/actions/counTostr.dart';
import 'package:cloudmusic/models/model.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

import 'customwidgets/sliverappbardelegate.dart';

class MusicVideoPage extends StatefulWidget {
  final String vid;
  MusicVideoPage({this.vid});
  @override
  MusicVideoPageState createState() => new MusicVideoPageState();
}

class MusicVideoPageState extends State<MusicVideoPage> {
  String videoname = '';
  String date = '';
  String playtime = '';
  String videourl;
  VideoDetialInfoModel videoDetail;
  SimilarVideoModel similarVideos;
  SongCommentModel videocomment;
  VideoUrlModel videoUrlModel;
  ScrollController scrollController = new ScrollController();
  VideoPlayerController vc;
  ChewieController chewieController;
  int localtime = DateTime.now().millisecondsSinceEpoch;
  int offset = 0;
  int likecount = 0;
  int subcount = 0;
  int commentcount = 0;
  int sharecount = 0;
  int loadedcommentcount = 0;
  String vid;
  bool isBusy = false;
  void getVideoInfo() async {
    var r = await CloudMusicApiHelper.videoDetail(vid);
    if (r.code == 200) {
      setState(() {
        videoDetail = r;
        videoname = r.data.title;
        playtime = CountTostr.chage(r.data.playTime);
        likecount = r.data.praisedCount;
        subcount = r.data.subscribeCount;
        commentcount = r.data.commentCount;
        sharecount = r.data.shareCount;
        date = TimelineUtil.format(
          r.data.publishTime,
          locTimeMillis: DateTime.now().millisecondsSinceEpoch,
          locale: 'zh_cloudmusic',
        );
      });
      var r2 = await CloudMusicApiHelper.similarVideo(vid);
      if (r2.code == 200)
        setState(() {
          similarVideos = r2;
        });
    }
  }

  void getVideoComments() async {
    setState(() {
      isBusy = true;
    });
    var r = await CloudMusicApiHelper.videoComments(vid, 30, offset);
    if (r.code == 200) {
      if (videocomment == null) {
        setState(() {
          videocomment = r;
        });
      } else {
        setState(() {
          videocomment.comments.addAll(r.comments);
        });
      }
      setState(() {
        loadedcommentcount = videocomment.comments.length;
        isBusy = false;
      });
      offset += 30;
    }
  }

  void getVideoUrl() async {
    if (videourl == null) {
      var r = await CloudMusicApiHelper.videoUrl(vid);
      if (r.code == 200) {
        videourl = r.urls[0].url;
        videoUrlModel = r;
        vc = new VideoPlayerController.network(videourl);
        chewieController = new ChewieController(
          videoPlayerController: vc,
          autoInitialize: true,
          aspectRatio: 16 / 9,
          autoPlay: true,
        );
      }
    }
  }

  Widget buildCommentCell(int i) {
    if (videocomment == null)
      return Container();
    else {
      var c = videocomment.comments[i];
      return Container(
          padding: EdgeInsets.only(left: Adapt.px(30), bottom: Adapt.px(30)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(Adapt.px(30)),
                child: FadeInImage.assetNetwork(
                  width: Adapt.px(60),
                  placeholder: 'images/CacheBG.jpg',
                  image: c.user.avatarUrl,
                ),
              ),
              SizedBox(
                width: Adapt.px(15),
              ),
              Container(
                  width: Adapt.screenW() * 0.8,
                  child: Stack(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            c.user.nickname,
                            style: TextStyle(fontSize: Adapt.px(24)),
                          ),
                          Text(
                            TimelineUtil.format(
                              c.time,
                              locTimeMillis: localtime,
                              locale: 'zh_cloudmusic',
                            ),
                            style: TextStyle(fontSize: Adapt.px(18)),
                          ),
                          SizedBox(
                            height: Adapt.px(10),
                          ),
                          Text(
                            c.content,
                            softWrap: true,
                            style: TextStyle(
                                height: 1.2,
                                color: Colors.black,
                                fontSize: Adapt.px(28)),
                          ),
                          SizedBox(
                            height: Adapt.px(20),
                          ),
                          Container(
                            color: Colors.grey[200],
                            height: 1,
                          )
                        ],
                      ),
                      Container(
                        height: Adapt.px(50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text(
                                c.likedCount > 0 ? c.likedCount.toString() : '',
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: Adapt.px(20)),
                              ),
                            ),
                            Container(
                              width: Adapt.px(40),
                              child: IconButton(
                                color: c.liked
                                    ? Colors.red[400]
                                    : Colors.grey[400],
                                padding: EdgeInsets.all(2),
                                alignment: Alignment.centerRight,
                                icon: Icon(Icons.thumb_up),
                                iconSize: Adapt.px(30),
                                onPressed: () {
                                  int count = c.likedCount;
                                  if (!c.liked) {
                                    count++;
                                  } else if (count > 0) {
                                    count--;
                                  }
                                  setState(() {
                                    c.likedCount = count;
                                    c.liked = !c.liked;
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ))
            ],
          ));
    }
  }

  Widget buildSimiVideoCell(SimilarVideoData d) {
    return GestureDetector(
      onTap: () async {
        await Navigator.pushReplacement(context,
            new MaterialPageRoute(builder: (BuildContext context) {
          return new MusicVideoPage(vid: d.vid);
        }));
      },
      child: Container(
        padding: EdgeInsets.only(bottom: Adapt.px(20)),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(Adapt.px(10)),
              child: Container(
                width: Adapt.px(240),
                height: Adapt.px(135),
                child: Stack(
                  children: <Widget>[
                    SizedBox.expand(
                      child: new FittedBox(
                          fit: BoxFit.fill,
                          child: FadeInImage.assetNetwork(
                            placeholder: 'images/CacheBG.jpg',
                            image: d.coverUrl,
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: Adapt.px(25),
                        ),
                        Text(
                          CountTostr.chage(d.playTime),
                          style: TextStyle(
                              color: Colors.white, fontSize: Adapt.px(25)),
                        ),
                        SizedBox(
                          width: Adapt.px(5),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: Adapt.px(10),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: Adapt.screenW() * 0.6,
                  child: Text(
                    d.title,
                    maxLines: 2,
                    style:
                        TextStyle(fontSize: Adapt.px(25), color: Colors.black),
                  ),
                ),
                Container(
                  width: Adapt.screenW() * 0.5,
                  child: Text(
                    (CountTostr.printduration(
                            Duration(milliseconds: d.durationms)) +
                        ' ' +
                        d.creator[0].userName),
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getSimiVideoCells(SimilarVideoModel s) {
    if (s == null)
      return Container();
    else
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: Adapt.px(20), left: Adapt.px(20)),
            child: Text(
              '相关视频',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: Adapt.px(35)),
            ),
          ),
          Container(
            padding: EdgeInsets.all(Adapt.px(20)),
            child: Column(children: s.data.map(buildSimiVideoCell).toList()),
          )
        ],
      );
  }

  Widget getCreatorIcon() {
    if (videoDetail == null) {
      return Container(
        child: Text('加载中'),
      );
    } else {
      return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Container(
          width: Adapt.px(60),
          height: Adapt.px(60),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Adapt.px(30)),
            image: DecorationImage(
                image: NetworkImage(videoDetail.data.avatarUrl),
                fit: BoxFit.cover),
          ),
        ),
        SizedBox(
          width: Adapt.px(10),
        ),
        Text(videoDetail.data.creator.nickname),
        Expanded(
          child: Container(),
        ),
        Container(
            width: Adapt.px(100),
            height: Adapt.px(40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Adapt.px(20)),
                color: Colors.red),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: Adapt.px(20),
                  ),
                  Text(
                    '收藏',
                    style:
                        TextStyle(color: Colors.white, fontSize: Adapt.px(20)),
                  )
                ]))
      ]);
    }
  }

  Widget getVideoPlayer() {
    if (videourl == null) {
      return Container();
    } else {
      return Chewie(
        key: Key('video'),
        controller: chewieController,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    vid = widget.vid;
    scrollController.addListener(() {
      bool isBottom = scrollController.position.pixels ==
          scrollController.position.maxScrollExtent;
      if (isBottom) {
        getVideoComments();
      }
    });
    getVideoInfo();
    getVideoComments();
    getVideoUrl();
  }

  @override
  void dispose() {
    vc.pause();
    vc.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        body: SafeArea(
      bottom: false,
      child: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            CustomScrollView(
              controller: scrollController,
              slivers: <Widget>[
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: Adapt.screenW() * 9 / 16,
                    maxHeight: Adapt.screenW() * 9 / 16,
                    child: Container(
                      child: getVideoPlayer(),
                      color: Colors.black,
                      height: Adapt.screenW() * 9 / 16,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: Adapt.px(50),
                        left: Adapt.px(30),
                        right: Adapt.px(30),
                        bottom: Adapt.px(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          videoname ?? '无题',
                          maxLines: 3,
                          style: TextStyle(
                              color: Colors.black, fontSize: Adapt.px(40)),
                        ),
                        SizedBox(height: Adapt.px(20)),
                        Text(
                          '$playtime次观看',
                          style: TextStyle(
                              color: Colors.grey[500], fontSize: Adapt.px(25)),
                        ),
                        SizedBox(height: Adapt.px(20)),
                        Text(
                          '$date发布',
                          style: TextStyle(
                              color: Colors.grey[500], fontSize: Adapt.px(30)),
                        ),
                        SizedBox(height: Adapt.px(20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.thumb_up,
                                    color: Colors.grey[600],
                                    size: Adapt.px(45),
                                  ),
                                  onPressed: () {},
                                ),
                                Text(
                                  likecount.toString(),
                                  style: TextStyle(color: Colors.grey[600]),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.library_add,
                                    color: Colors.grey[600],
                                    size: Adapt.px(45),
                                  ),
                                  onPressed: () {},
                                ),
                                Text(
                                  subcount.toString(),
                                  style: TextStyle(color: Colors.grey[600]),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.textsms,
                                    color: Colors.grey[600],
                                    size: Adapt.px(45),
                                  ),
                                  onPressed: () {},
                                ),
                                Text(
                                  commentcount.toString(),
                                  style: TextStyle(color: Colors.grey[600]),
                                )
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.share,
                                    color: Colors.grey[600],
                                    size: Adapt.px(45),
                                  ),
                                  onPressed: () {},
                                ),
                                Text(
                                  sharecount.toString(),
                                  style: TextStyle(color: Colors.grey[600]),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 1,
                    color: Colors.grey[300],
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: Adapt.px(100),
                    maxHeight: Adapt.px(100),
                    child: Container(
                      color: Colors.white,
                      height: Adapt.px(100),
                      padding: EdgeInsets.all(Adapt.px(20)),
                      child: getCreatorIcon(),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    color: Colors.grey[300],
                    height: Adapt.px(20),
                  ),
                ),
                SliverToBoxAdapter(
                  child: getSimiVideoCells(similarVideos),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(Adapt.px(20)),
                    child: Text(
                      '最新评论($commentcount)',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: Adapt.px(35)),
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                  return buildCommentCell(index);
                }, childCount: loadedcommentcount)),
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
            new Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                  brightness: Brightness.dark,
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  actions: <Widget>[
                    IconButton(onPressed: () {}, icon: Icon(Icons.share))
                  ],
                  centerTitle: false),
            ),
          ],
        ),
      ),
    ));
  }
}
