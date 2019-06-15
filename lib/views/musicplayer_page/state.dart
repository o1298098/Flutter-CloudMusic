import 'package:audioplayer/audioplayer.dart';
import 'package:cloudmusic/models/model.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MusicPlayerPageState implements Cloneable<MusicPlayerPageState>{
  AudioPlayerState playerState;
  Duration position;
  int musicindex = 0;
  int commentcount = 0;
  MusicPlayList playList;
  AnimationController animationController;
  SwiperController discController;
  Animation<double> animation;
  Animation<double> needleAnimation;
  AnimationController needleAnimationController;
  AudioPlayer audioPlayer;
  bool animationstate = false;
  @override
  MusicPlayerPageState clone() {
    return MusicPlayerPageState();
  }
}

MusicPlayerPageState initState(Map<String, dynamic> args) {
  MusicPlayerPageState state=new MusicPlayerPageState();
  if(args['playlist']!=null)
  state.playList=args['playlist'];
  state.audioPlayer=new AudioPlayer();
  return state;
}
