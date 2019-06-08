import 'dart:ui';
import 'package:cloudmusic/actions/Adapt.dart';
import 'package:cloudmusic/actions/cloudmusicapihelper.dart';
import 'package:cloudmusic/actions/counTostr.dart';
import 'package:cloudmusic/views/songcommentpage.dart';
import 'package:flutter/material.dart';
import 'package:cloudmusic/models/model.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:audioplayer/audioplayer.dart';
import 'package:share/share.dart';

import 'musicvideopage.dart';

class MusicPlayerPage extends StatefulWidget {
  final MusicPlayList playList;
  MusicPlayerPage({this.playList});
  @override
  MusicPlayerState createState() => new MusicPlayerState(playList: playList);
}

class MusicPlayerState extends State<MusicPlayerPage>
    with TickerProviderStateMixin {
  int musicindex = 0;
  int commentcount = 0;
  MusicPlayList playList;
  MusicPlayerState({this.playList});
  AnimationController animationController;
  SwiperController discController;
  Animation<double> animation;
  Animation<double> needleAnimation;
  AnimationController needleAnimationController;
  AudioPlayer audioPlayer = new AudioPlayer();
  bool animationstate = false;
  AudioPlayerState playerState;
  Duration position;
  Icon playicon;
  Future<void> play(String url) async {
    await audioPlayer.play(url);
    animationController.forward();
    needleAnimationController.forward(from: -0.09);
    setState(() {
      playerState = AudioPlayerState.PLAYING;
      animationstate = true;
      playicon = Icon(
        Icons.pause_circle_outline,
        color: Colors.white,
      );
    });
  }

  Future<void> pause() async {
    await audioPlayer.pause();
    animationController.stop();
    needleAnimationController.animateTo(0);
    setState(() {
      playerState = AudioPlayerState.PAUSED;
      playicon = Icon(
        Icons.play_circle_outline,
        color: Colors.white,
      );
      animationstate = false;
    });
  }

  Future<void> stop() async {
    await audioPlayer.stop();
    animationController.stop();
    needleAnimationController.animateTo(0);
    setState(() {
      playerState = AudioPlayerState.STOPPED;
      animationstate = false;
      playicon = Icon(
        Icons.play_circle_outline,
        color: Colors.white,
      );
      position = new Duration();
    });
  }

  Future<void> loadComment(int i) async {
    var r = await CloudMusicApiHelper.songComments(
        playList.playlist.tracks[i].id, 1, 0);
    commentcount = r.total;
  }

  void chageMusic(int i) async {
    if (i >= playList.playlist.trackCount - 1) return;
    await stop();
    await play('https://music.163.com/song/media/outer/url?id=' +
        playList.playlist.tracks[i].id.toString() +
        '.mp3');
    await discController.move(i);
    await loadComment(i);
    setState(() {
      musicindex = i;
      precacheImage(
          new NetworkImage(playList.playlist.tracks[musicindex + 1].al.picUrl),
          context);
    });
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  Widget getDisc(int index) {
    return RotationTransition(
        turns: animation,
        child: Center(
          child: Stack(
            children: <Widget>[
              Center(
                child: Image(
                  image: AssetImage('images/ic_disc.png'),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.8,
                ),
              ),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width * 0.275),
                  child: Image(
                    image:
                        NetworkImage(playList.playlist.tracks[index].al.picUrl),
                    width: MediaQuery.of(context).size.width * 0.55,
                    height: MediaQuery.of(context).size.width * 0.55,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.network(
                        playList.playlist.tracks[musicindex].al.picUrl,
                        width: Adapt.px(80),
                        height: Adapt.px(80)),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: Adapt.screenW() * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            playList.playlist.tracks[musicindex].al.name,
                            maxLines: 1,
                            softWrap: true,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: Adapt.px(35),
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            playList.playlist.tracks[musicindex].ar[0].name,
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Adapt.px(25)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 1,
                  color: Colors.grey[100],
                  width: Adapt.screenW(),
                ),
                Container(
                  height: Adapt.px(100),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.playlist_add,
                        color: Colors.grey[700],
                        size: Adapt.px(65),
                      ),
                      SizedBox(
                        width: Adapt.px(30),
                      ),
                      Text(
                        '收藏到歌单',
                        style: TextStyle(fontSize: Adapt.px(26)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: Adapt.px(110)),
                  height: 1,
                  color: Colors.grey[100],
                  width: Adapt.screenW(),
                ),
                Container(
                  height: Adapt.px(100),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        color: Colors.grey[700],
                        size: Adapt.px(65),
                      ),
                      SizedBox(
                        width: Adapt.px(30),
                      ),
                      Text(
                        '歌手:' + playList.playlist.tracks[musicindex].ar[0].name,
                        style: TextStyle(fontSize: Adapt.px(26)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: Adapt.px(110)),
                  height: 1,
                  color: Colors.grey[100],
                  width: Adapt.screenW(),
                ),
                Container(
                  height: Adapt.px(100),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.album,
                        color: Colors.grey[700],
                        size: Adapt.px(65),
                      ),
                      SizedBox(
                        width: Adapt.px(30),
                      ),
                      Text(
                        '专辑:' + playList.playlist.tracks[musicindex].al.name,
                        softWrap: true,
                        style: TextStyle(fontSize: Adapt.px(26)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: Adapt.px(110)),
                  height: 1,
                  color: Colors.grey[100],
                  width: Adapt.screenW(),
                ),
                Container(
                  height: Adapt.px(100),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.link,
                        color: Colors.grey[700],
                        size: Adapt.px(65),
                      ),
                      SizedBox(
                        width: Adapt.px(30),
                      ),
                      Text(
                        '来源:在线音乐',
                        style: TextStyle(fontSize: Adapt.px(26)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: Adapt.px(110)),
                  height: 1,
                  color: Colors.grey[100],
                  width: Adapt.screenW(),
                ),
                Container(
                  height: Adapt.px(100),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.music_note,
                        color: Colors.grey[700],
                        size: Adapt.px(65),
                      ),
                      SizedBox(
                        width: Adapt.px(30),
                      ),
                      Text(
                        '音质:320kbit/s',
                        style: TextStyle(fontSize: Adapt.px(26)),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: Adapt.px(110)),
                  height: 1,
                  color: Colors.grey[100],
                  width: Adapt.screenW(),
                ),
                GestureDetector(
                  onTap: () async {
                    await Navigator.pushReplacement(context,
                        new MaterialPageRoute(builder: (BuildContext context) {
                      return new MusicVideoPage(vid: playList.playlist.tracks[musicindex].mv.toString());
                    }));
                  },
                  child: Container(
                    height: Adapt.px(100),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.slow_motion_video,
                          color: Colors.grey[700],
                          size: Adapt.px(65),
                        ),
                        SizedBox(
                          width: Adapt.px(30),
                        ),
                        Text(
                          '视频',
                          style: TextStyle(fontSize: Adapt.px(26)),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: Adapt.px(110)),
                  height: 1,
                  color: Colors.grey[100],
                  width: Adapt.screenW(),
                ),
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    position = new Duration();
    audioPlayer.onAudioPositionChanged
        .listen((p){
        if(p.inMilliseconds<=playList.playlist.tracks[musicindex].dt)
        {
        setState(() => position = p);
        }
        else{
          chageMusic(musicindex+1);
        }
        }
        );
    play('https://music.163.com/song/media/outer/url?id=' +
        playList.playlist.tracks[0].id.toString() +
        '.mp3');
    discController = new SwiperController();
    animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 6000));
    animation = Tween(begin: 0.0, end: 1.0).animate(animationController)
      ..addStatusListener((AnimationStatus e) {
        if (e == AnimationStatus.completed) {
          if (animationstate) animationController.forward(from: 0.0);
        }
      });
    needleAnimationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 500));
    needleAnimation =
        Tween(begin: -0.09, end: 0.0).animate(needleAnimationController);
    loadComment(0);
  }

  @override
  void dispose() {
    animationController.dispose();
    audioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          SizedBox.expand(
              child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: playList.playlist.tracks[musicindex].al.picUrl,
            fit: BoxFit.cover,
          )),
          SizedBox.expand(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
            child: new Container(
              color: Colors.black26,
            ),
          )),
          Container(
              height: Adapt.px(830),
              margin: EdgeInsets.only(top: Adapt.px(230)),
              child: Center(
                child: Image(
                  image: AssetImage('images/ic_disc_blackground.png'),
                  width: MediaQuery.of(context).size.width * 0.82,
                  height: MediaQuery.of(context).size.width * 0.82,
                ),
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: Adapt.px(830),
                margin: EdgeInsets.only(top: Adapt.px(230)),
                child: new Swiper(
                  controller: discController,
                  viewportFraction: 0.99999,
                  itemCount: playList.playlist.trackCount,
                  itemBuilder: (BuildContext context, int index) {
                    return getDisc(index);
                  },
                  onIndexChanged: (int i) => chageMusic(i),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  IconButton(
                      onPressed: () {},
                      iconSize: 25,
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      )),
                  IconButton(
                      onPressed: () {},
                      iconSize: 25,
                      icon: Icon(Icons.cloud_download, color: Colors.white)),
                  IconButton(
                      onPressed: () {},
                      iconSize: 25,
                      icon: Icon(Icons.hearing, color: Colors.white)),
                  Stack(
                    children: <Widget>[
                      IconButton(
                          onPressed: () async {
                            await Navigator.push(context, new MaterialPageRoute(
                                builder: (BuildContext context) {
                              return new SongCommentPage(
                                  id: playList.playlist.tracks[musicindex].id);
                            }));
                          },
                          iconSize: 25,
                          icon: Icon(Icons.comment, color: Colors.white)),
                      Container(
                        width: Adapt.px(85),
                        alignment: Alignment.bottomRight,
                        //color: Colors.white,
                        child: Text(
                          CountTostr.commentCountChange(commentcount),
                          style: TextStyle(
                              color: Colors.white, fontSize: Adapt.px(18)),
                        ),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () => _modalBottomSheetMenu(),
                      iconSize: 25,
                      icon: Icon(Icons.control_point_duplicate,
                          color: Colors.white)),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      _printDuration(
                          Duration(milliseconds: position.inMilliseconds)),
                      style: TextStyle(color: Colors.white),
                    ),
                    Expanded(
                      child: Slider(
                        activeColor: Colors.white,
                        min: 0.0,
                        max: double.parse(
                            playList.playlist.tracks[musicindex].dt.toString()),
                        value: double.parse(position.inMilliseconds.toString()),
                        onChanged: (double e) {
                          audioPlayer.seek(e / 1000);
                        },
                      ),
                    ),
                    Text(
                      _printDuration(Duration(
                          milliseconds:
                              playList.playlist.tracks[musicindex].dt)),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      iconSize: 35,
                      icon: Icon(
                        Icons.repeat,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      iconSize: 35,
                      icon: Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        chageMusic(musicindex - 1);
                      },
                    ),
                    IconButton(
                      iconSize: 65,
                      icon: playicon,
                      onPressed: () {
                        playerState == AudioPlayerState.PLAYING
                            ? pause()
                            : play(
                                'https://music.163.com/song/media/outer/url?id=' +
                                    playList.playlist.tracks[musicindex].id
                                        .toString() +
                                    '.mp3');
                      },
                    ),
                    IconButton(
                      iconSize: 35,
                      icon: Icon(
                        Icons.skip_next,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        chageMusic(musicindex + 1);
                      },
                    ),
                    IconButton(
                      iconSize: 35,
                      icon: Icon(
                        Icons.playlist_play,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: Adapt.px(170)),
              height: Adapt.px(300),
              child: Align(
                alignment: Alignment(0.2, 0),
                child: RotationTransition(
                  turns: needleAnimation,
                  alignment: Alignment(-.64, -.87),
                  child: Image(
                    image: AssetImage('images/ic_needle.png'),
                    width: Adapt.px(180),
                  ),
                ),
              )),
          new Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              actions: <Widget>[
                IconButton(
                    onPressed: () {
                      Share.share(
                          'https://music.163.com/song/media/outer/url?id=' +
                              playList.playlist.tracks[musicindex].id
                                  .toString() +
                              '.mp3');
                    },
                    icon: Icon(Icons.share))
              ],
              centerTitle: false,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(playList.playlist.tracks[musicindex].name,
                      style: TextStyle(fontSize: Adapt.px(35))),
                  Text(playList.playlist.tracks[musicindex].ar[0].name,
                      style: TextStyle(
                          fontSize: Adapt.px(24), color: Colors.grey[350]))
                ],
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
          ),
        ],
      ),
    );
  }
}
